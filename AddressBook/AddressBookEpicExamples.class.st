"
!Epic Examples

This class holds example epics for the Address Book.
Each ${class:name=Epic}$ has ${class:name=EUseCase}$ that have ${class:name=EUserStory}$ that have ${class:name=EScenario}$ to serve as test cases.
"
Class {
	#name : #AddressBookEpicExamples,
	#superclass : #Object,
	#category : #'AddressBook-Examples'
}

{ #category : #accessing }
AddressBookEpicExamples >> addressBookAddAddressSuccess [
	<gtExample>
	| addressBook contact |
	addressBook := self emptyAddressBook.
	contact := ABContact janeDoeClass.
	addressBook
		addContact: contact.
	
	contact addAddress: (ABAddressExamples >> #emptyAddress) gtExample returnValue.
	
	self assert: contact address isNotEmpty.
	self assert: contact address size equals: 1.
	^addressBook.
]

{ #category : #'examples - board' }
AddressBookEpicExamples >> board [
	|board|
	board:= EAgileEpicBoard new
	epics: (Array 
			with: self epicManageAddressBook 
			with: self epicSearchAddressBook
			).
	^ board.
]

{ #category : #'examples - epic' }
AddressBookEpicExamples >> epicManageAddressBook [
	<gtExample>
	| epic |
	epic := EEpic new.
	epic title: 'Manage address book'.
	epic addUseCase: self useCaseAddNewContact.
	epic addUseCase: self useCaseEditContact.
	epic addUseCase: self useCaseRemoveContact.
	^ epic 
]

{ #category : #'examples - epic' }
AddressBookEpicExamples >> epicSearchAddressBook [
	<gtExample>
	| epic |
	epic := EEpic new.
	epic title: 'Search address book'.
	epic addUseCase: self useCaseSearchContact.
	epic addUseCase: self useCaseSearchWilhFilter.
	^ epic 
]

{ #category : #initialization }
AddressBookEpicExamples >> initialize [
	super initialize.
]

{ #category : #'examples - requirement container' }
AddressBookEpicExamples >> requirementContainerWithThreeEpics [
	"run this method in order to obtain an ERequirementContainer instance with two epics, with all of their sub-elements, as elements of this container. 
	Check out the Mind Map view for a visual representation of the project's requirement hierarchy.
	For now, two of the epics are identical. This is to have a better representation of the Mind Map view."
	<gtExample>
	| container |
	container := ERequirementContainer new project: 'AddressBookApp'.
	container addArtifact: self epicSearchAddressBook.
	container addArtifact: self epicManageAddressBook.
	container addArtifact: self epicSearchAddressBook.
	^container
]

{ #category : #'examples - scenario' }
AddressBookEpicExamples >> scenarioAddDuplicateAddress [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario title: 'add duplicate type address to contact'.
	scenario description: 'add a duplicate type address to a contact'.
	scenario exampleMethod: (ABContactExamples >> #addSameAddressTypes) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
AddressBookEpicExamples >> scenarioAddEmailOnDuplicateType [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario title: 'add duplicate type email to contact'.
	scenario description: 'add a duplicate type email to a contact'.
	scenario exampleMethod: (ABContactExamples >> #addSameMailTypes) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
AddressBookEpicExamples >> scenarioEditAddress [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario title: 'edit addresses in contact'.
	scenario description: 'edit the addresses in a contact'.
	scenario exampleMethods: (Array 
			with: (ABContactExamples >> #editAddress) gtExample
			).
	^ scenario
]

{ #category : #'examples - scenario' }
AddressBookEpicExamples >> scenarioEditCompany [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario title: 'edit company in contact'.
	scenario description: 'edit the company in a contact'.
	scenario exampleMethods: (Array 
			with: (ABContactExamples >> #editCompany) gtExample
			).
	^ scenario
]

{ #category : #'examples - scenario' }
AddressBookEpicExamples >> scenarioEditEmail [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario title: 'edit emails in contact'.
	scenario description: 'edit the emails in a contact'.
	scenario exampleMethods: (Array 
			with: (ABContactExamples >> #editEmail) gtExample
			).
	^ scenario
]

{ #category : #'examples - scenario' }
AddressBookEpicExamples >> scenarioEditNote [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario title: 'edit note in contact'.
	scenario description: 'Edit the note in a contact'.
	scenario exampleMethods: (Array 
			with: (ABContactExamples >> #editNote) gtExample
			).
	^ scenario
]

{ #category : #'examples - scenario' }
AddressBookEpicExamples >> scenarioEditPhone [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario title: 'edit phone in contact'.
	scenario description: 'edit the phone numbers in a contact'.
		scenario exampleMethods: (Array 
			with: (ABContactExamples >> #editPhone) gtExample
			).
	^ scenario
]

{ #category : #'examples - scenario' }
AddressBookEpicExamples >> scenarioMergeContacts [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario title: 'merge two contacts in address book'.
	scenario description: 'Fully merge two contacts in an address book'.
	scenario exampleMethod: (AddressBookEpicExamples >> #addressBookMergeContacts) gtExample.
	^ scenario
]

{ #category : #'examples - scenario' }
AddressBookEpicExamples >> scenarioNewContact [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario title: 'add new contact'.
	scenario description: 'Add a new contact'.
	scenario descriptionText: '!!Description:
Adding a contact to an address book
!!Scenario:
Feature: Add a contact to an address book
Given: AddressBook ${class:ABAddressBook}$ and a Contact ${class:ABContact}$
When: The user clicks on ''Add'' button in a contact list
Then: the chosen contact should be added.'.
	scenario simpleExampleText: '!!Simple example:
Imagine we have a simple ${class:ABAddressBook|label=address book}$ with one contact: 
${example:ABAddressBookExamples>>#addressBookWithFullTestContact|noCode|previewShow=gtViewContactsList:|previewHeight=80}$

We want to add ${class:ABContact|label=another contact}$: 
${example:ABMyContactsAddressBookExamples>>#berangariaMartinContact|noCode|previewShow=gtViewDetailsCardFor:|previewHeight=240}$

After the execution of ${method:name=ABAddressBook>>#addContact:}$

The size of book should increase by one.

Test case: ${method:name=ABAddressBookExamples>>#testExampleAddContactToAddressBook|previewExpanded=true|previewHeight=100|codeExpanded=true|codeHeight=100}$ 

${example:ABAddressBookExamples>>#testExampleAddContactToAddressBook|noCode|previewShow=gtViewContactsList:|previewHeight=120}$'. 
	scenario exampleMethods: (Array 
		with: (ABAddressBookExamples >> #addressBookAddContact) gtExample
		with: (ABAddressBookExamples >> #addressBookAddTwoContactsWithSameName) gtExample
	).
	scenario
		addParametrizedExample:
			(EParametrizedExample new
				exampleMethod: ABAddressBookExamples >> #exampleAddContact:toAddressBook:).
	^ scenario
]

{ #category : #'examples - scenario' }
AddressBookEpicExamples >> scenarioRemoveContactFromAddressBook [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario title: 'remove contact'.
	scenario description: 'Remove a given contact'.
	scenario exampleMethods: 
		(Array 
			with: (ABAddressBookExamples >> #removeContact) gtExample 
		).
	scenario
		addParametrizedExample:
			(EParametrizedExample new
				exampleMethod: ABAddressBookExamples >> #removeContact:fromBook:).
	^ scenario
]

{ #category : #'examples - scenario' }
AddressBookEpicExamples >> scenarioSearchByAddress [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario title: 'search contact by address'.
	scenario description: 'search for a contact by address'.
	scenario exampleMethods: (Array 
		with: (ABAddressBookExamples >> #exampleSearchAddressesWithOneContact) gtExample
		).
	scenario
		addParametrizedExample:
			(EParametrizedExample new
				exampleMethod: ABAddressBookExamples >> #exampleSearchAddress:in:).		
	^ scenario
]

{ #category : #'examples - scenario' }
AddressBookEpicExamples >> scenarioSearchByCompany [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario title: 'search for contact by company'.
	scenario description: 'search for a contact by a company'.
	scenario exampleMethods: (Array 
			with: (ABAddressBookExamples >> #exampleSearchCompanyWithOneContact) gtExample
			with: (ABAddressBookExamples >> #exampleSearchCompanyWithTwoContacts) gtExample
			).
	scenario
		addParametrizedExample:
			(EParametrizedExample new
				exampleMethod: ABAddressBookExamples >> #exampleSearchCompany:in:).			
	^ scenario
]

{ #category : #'examples - scenario' }
AddressBookEpicExamples >> scenarioSearchByName [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario title: 'search for contact by first name'.
	scenario description: 'search for a contact by a first name'.
	scenario
		exampleMethods:
			(Array
				with: (ABAddressBookExamples >> #exampleSearchNamesWithOneContact) gtExample
				with:
					(ABAddressBookExamples >> #exampleSearchNamesWithTwoContacts)
						gtExample).
	scenario
		addParametrizedExample:
			(EParametrizedExample new
				exampleMethod: ABAddressBookExamples >> #exampleSearchNames:in:).
	scenario
		addParametrizedExample:
			(EParametrizedExample new
				exampleMethod: ABAddressBookExamples >> #exampleSearchNames:inMany:).
	^ scenario
]

{ #category : #'examples - scenario' }
AddressBookEpicExamples >> scenarioSearchByPhone [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario title: 'search for contact by phone'.
	scenario description: 'search for a contact by phone'.
	scenario exampleMethods: 
		(Array 
			with: (ABAddressBookExamples >> #exampleSearchPhonesWithOneContact) gtExample 
			with: (ABAddressBookExamples >> #exampleSearchPhonesWithTwoContacts) gtExample 
		).
	scenario addParametrizedExample: (EParametrizedExample new
				exampleMethod: ABAddressBookExamples >> #exampleSearchPhones:in:).
	^ scenario
]

{ #category : #'examples - scenario' }
AddressBookEpicExamples >> scenarioUseDefinedFilter [
	<gtExample>
	| scenario |
	scenario := EScenario new.
	scenario title: 'search for contact with defined filter'.
	scenario description: 'Search for a contact with a defined filter'.
	scenario exampleMethods: 
		(Array 
			with: (ABAddressBookExamples >> #filterSearchByFilter) gtExample 
		).
	scenario addParametrizedExample: (EParametrizedExample new
				exampleMethod: ABAddressBookExamples >> #searchResultForFilter:inBook:word:).	
	^ scenario
]

{ #category : #'examples - use case' }
AddressBookEpicExamples >> useCaseAddNewContact [
	<gtExample>
	| useCase actor|
	useCase := EUseCase new.
	actor:= EActor new.
	actor name: 'Igor'.
	
	useCase 	title: 'Add a contact';
				task: 'Add a new contact to address book';
				addActor: actor;
				supportingActor: nil;
				precondition: 'User has opened the app';
				successGarantie: nil;
				complexity: 'low';
				flowOfEvents: 'Main flow of events: 1. User opens the app. 2. User presses the ""PLUS"" button near the search field. 3. User fills out all necessary details and clicks Save. 4. User acknowledges success. 5.End';
				userStories: (OrderedCollection 
					with: self userStoryAddNewContact
					).
	
	self assert: useCase userStories  size equals: 1.
	^ useCase
]

{ #category : #'examples - use case' }
AddressBookEpicExamples >> useCaseEditContact [
	<gtExample>
	| useCase actor |
	useCase := EUseCase new.
	actor:= EActor new.
	actor name: 'Andrei'.
	useCase 	title: 'Edit a contact in an address book';
				task: 'Edit contact details';
				addActor: actor;
				supportingActor: nil;
				precondition: 'User has opened the app';
				successGarantie: nil;
				complexity: 'low';
				flowOfEvents: 'Main flow of events: 1. User opens the app. 2. User chooses one of the contacts 3. User edits any contact details 4. User confirms changes';
				userStories: (OrderedCollection  
					with: self userStoryEditContact).
	self assert: useCase userStories  size equals: 1.
	^ useCase
]

{ #category : #'examples - use case' }
AddressBookEpicExamples >> useCaseRemoveContact [
	<gtExample>
	| useCase actor |
	useCase := EUseCase new.
	actor:= EActor new.
	actor name: 'User'.
	useCase 	title: 'Remove a contact from address book';
				task: 'Remove contact';
				addActor: actor;
				supportingActor: nil;
				precondition: 'User has opened the app';
				successGarantie: nil;
				complexity: 'low';
				flowOfEvents: 'Main flow of events: 1. User opens the app. 2. User chooses one of the contacts and confirms the removal of contact 3. User confirms changes';
				userStories: (OrderedCollection  
					with: self userStoryRemoveContact).
	self assert: useCase userStories  size equals: 1.
	^ useCase
]

{ #category : #'examples - use case' }
AddressBookEpicExamples >> useCaseSearchContact [
	<gtExample>
	| useCase actor |
	useCase := EUseCase new.
	actor:= EActor new.
	actor name: 'Jake'.
	useCase 	title: 'Search for a contact';
				task: 'Search for a new contact to address book';
				addActor: actor;
				supportingActor: nil;
				precondition: 'User has opened the app';
				successGarantie: nil;
				complexity: 'low';
				flowOfEvents: 'Main flow of events: 1. User opens the app. 2. User enters search details in an input element. 3. User acknowledges success. 4.End';
				userStories: (OrderedCollection  
					with: self userStorySearchByAddress
					with: self userStorySearchByCompany 
					with: self userStorySearchByName
					with: self userStorySearchByPhone).
	self assert: useCase userStories  size equals: 4.
	^ useCase
]

{ #category : #'examples - use case' }
AddressBookEpicExamples >> useCaseSearchWilhFilter [
	<gtExample>
	| useCase actor |
	useCase := EUseCase new.
	actor:= EActor new.
	actor name: 'John'.
	useCase 	title: 'User can filter based on given search parameters';
				task: 'Search for a contact providing a search object';
				addActor: actor;
				supportingActor: nil;
				precondition: 'User has opened the app, user has chosen a search parameters';
				successGarantie: nil;
				complexity: 'low';
				flowOfEvents: 'Main flow of events: 1. User opens the app. 2. Defines the filter for search 3. User acknowledges success.';
				userStories: (OrderedCollection 
					with: self userStorySearchWithFilter
					).
					
	self assert: useCase userStories  size equals: 1.
	^ useCase
]

{ #category : #'examples - user story' }
AddressBookEpicExamples >> userStoryAddNewContact [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory title: 'add contact'.
	userStory action: 'add a contact'.
	userStory description: 'The ${class:name=User}$ should be able to add a new ${class:name=Contact}$ to the ${class:name=AddressBook}$.'.
	userStory points: 20.
	
	userStory addScenario: self scenarioNewContact.
	userStory addScenario: self scenarioAddDuplicateAddress.
	^ userStory
]

{ #category : #'examples - user story' }
AddressBookEpicExamples >> userStoryEditContact [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory title: 'edit contact'.
	userStory action: 'edit user contact details'.
	userStory description: 'The ${class:name=User}$ should be able to edit an existing ${class:name=Contact}$ in the ${class:name=AddressBook}$.'.
	userStory points: 20.
	
	userStory addScenario: self scenarioEditAddress.
	userStory addScenario: self scenarioEditCompany.
	userStory addScenario: self scenarioEditNote.
	userStory addScenario: self scenarioEditPhone.
	userStory addScenario: self scenarioEditEmail.
	userStory addScenario: self scenarioAddEmailOnDuplicateType.
	
	^ userStory
]

{ #category : #'examples - user story' }
AddressBookEpicExamples >> userStoryRemoveContact [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory title: 'remove contact'.
	userStory action: 'remove an entire contact'.
	userStory description: 'The ${class:name=User}$ should be able to remove a ${class:name=Contact}$ from the ${class:name=AddressBook}$.'.
	userStory points: 10.
	
	userStory addScenario: self scenarioRemoveContactFromAddressBook.
	^ userStory
]

{ #category : #'examples - user story' }
AddressBookEpicExamples >> userStorySearchByAddress [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory title: 'search for contact by address'.
	userStory action: 'search for a contact by address'.
	userStory description: 'The ${class:name=User}$ should be able to search for a ${class:name=Contact}$ in the ${class:name=AddressBook}$. The search is done based on the address of the contact.'.
	userStory points: 12.
	
	userStory addScenario: self scenarioSearchByAddress.
	^ userStory
]

{ #category : #'examples - user story' }
AddressBookEpicExamples >> userStorySearchByCompany [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory title: 'search by company'.
	userStory action: 'search by company'.
	userStory description: 'The ${class:name=User}$ should be able to search for a ${class:name=Contact}$ in the ${class:name=AddressBook}$. The search is done based on the company of the ${class:name=Contact}$.'.
	userStory points: 12.
	
	userStory addScenario: self scenarioSearchByCompany.
	^ userStory
]

{ #category : #'examples - user story' }
AddressBookEpicExamples >> userStorySearchByName [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory title: 'search by name'.
	userStory action: 'search user by his last or second name'.
	userStory description: 'The ${class:name=User}$ should be able to search for a ${class:name=Contact}$ in the ${class:name=AddressBook}$. The search is done based on the name of the ${class:name=Contact}$.'.
	userStory points: 12.
	
	userStory addScenario: self scenarioSearchByName.
	
	^ userStory
]

{ #category : #'examples - user story' }
AddressBookEpicExamples >> userStorySearchByPhone [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory title: 'search by phone'.
	userStory action: 'search for a contact by phone number'.
	userStory description: 'The ${class:name=User}$ should be able to search for a ${class:name=Contact}$ in the ${class:name=AddressBook}$. The search is done based on the phone number of the ${class:name=Contact}$.'.
	userStory points: 12.
	
	userStory addScenario: self scenarioSearchByPhone.
	^ userStory
]

{ #category : #'examples - user story' }
AddressBookEpicExamples >> userStorySearchWithFilter [
	<gtExample>
	| userStory |
	userStory := EUserStory new.
	userStory title: 'search with filter'.
	userStory action: 'search with a custom filter'.
	userStory description: 'The ${class:name=User}$ should be able to search for a ${class:name=Contact}$ in the ${class:name=AddressBook}$, using a custom ${class:name=Filter}$.'.
	userStory points: 30.
	
	userStory addScenario: self scenarioUseDefinedFilter.
	^ userStory
]

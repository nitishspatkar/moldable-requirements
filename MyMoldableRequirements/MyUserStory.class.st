Class {
	#name : #MyUserStory,
	#superclass : #Object,
	#instVars : [
		'id',
		'description',
		'status',
		'points',
		'scenarios',
		'references',
		'role',
		'means',
		'benefit',
		'epic',
		'checklist',
		'assignees',
		'acceptanceCriteria',
		'notes',
		'personas',
		'labels',
		'announcer'
	],
	#category : #MyMoldableRequirements
}

{ #category : #accessing }
MyUserStory class >> fromRawData: userStoryDict [
	^ self
		id: (userStoryDict at: #id)
		role: (userStoryDict at: #role)
		means: (userStoryDict at: #means)
		benefit: (userStoryDict at: #benefit)
		acceptanceCriteria: (userStoryDict at: #acceptanceCriteria)
		status: (userStoryDict at: #status)
		points: (userStoryDict at: #points)
		scenarios:
			((userStoryDict at: #scenarios)
				collect: [ :scenariosDict | MyScenario fromRawData: scenariosDict ])
		personas: ((userStoryDict at: #personas)
				collect: [ :personasDict | MyPersona fromRawData: personasDict ])
		assignees: ((userStoryDict at: #assignees)
				collect: [ :assigneesDict | MyAssignees fromRawData: assigneesDict])
		labels: ((userStoryDict at: #labels)
				collect: [ :labelDict | MyLabel fromRawData: labelDict])
		checklist: 
		((userStoryDict at: #checklist)
		collect: [:checklistDict | MyChecklist fromRawData: checklistDict])
		notes: ((userStoryDict at: #notes) collect: [:notesDict | MyNotes fromRawData: notesDict])
]

{ #category : #accessing }
MyUserStory class >> id: aString role: aString1 means: aString2 benefit: aString3 acceptanceCriteria: aString4 status: anotherString points: aNumber scenarios: anArray personas: anArray2 assignees: anotherArray checklist: yetAnotherArray notes: lastArray [
	^ self new
		id: aString;
		role: aString1;
		means: aString2;
		benefit: aString3;
		acceptanceCriteria: aString4;
		status: anotherString;
		points: aNumber;
		scenarios: anArray asOrderedCollection;
		personas: anArray2 asOrderedCollection;
		assignees: anotherArray asOrderedCollection;
		checklist: yetAnotherArray asOrderedCollection;
		notes: lastArray asOrderedCollection
		yourself
]

{ #category : #accessing }
MyUserStory class >> id: aString role: aString1 means: aString2 benefit: aString3 acceptanceCriteria: aString4 status: anotherString points: aNumber scenarios: anArray personas: anArray2 assignees: anotherArray labels: anotherArray2 checklist: yetAnotherArray notes: lastArray [
	^ self new
		id: aString;
		role: aString1;
		means: aString2;
		benefit: aString3;
		acceptanceCriteria: aString4;
		status: anotherString;
		points: aNumber;
		scenarios: anArray asOrderedCollection;
		personas: anArray2 asOrderedCollection;
		assignees: anotherArray asOrderedCollection;
		labels: anotherArray2 asOrderedCollection;
		checklist: yetAnotherArray asOrderedCollection;
		notes: lastArray asOrderedCollection
		yourself
]

{ #category : #accessing }
MyUserStory >> aButtonCircularLook [
"returns with aWithAllStatiDropdownLook a circular button look for the status"
^ [BrInteractiveCommonLook new
							default: [:e | e
								background: self statusColor]] asStencil.
]

{ #category : #accessing }
MyUserStory >> aWithAllStatiDropdownLook [
	"returns a dropdown of all stati"

	| statusButton |
	^ BrGlamorousWithDropdownLook
		handle: [ BrButton new
				size: 20@20;
				geometry: (BlRoundedRectangleGeometry cornerRadius: 10);
				look: self aButtonCircularLook create;
				icon: BrGlamorousIcons menu ]
		content: [ BrSimpleList new
				itemStencil: [ statusButton := BrButton new
						look:
							BrGlamorousLabelLook new
								+
									(BrStyleCommonLook new
										selected: [ :aStyle | aStyle background: Color veryVeryLightGray ]);
						padding: (BlInsets all: 5);
						action: [:eachElement | self status:eachElement label asString. announcer announce: MyUserStoryStatusChange]];
				itemDataBinder: [ :eachElement :eachStatus :eachIndex |
				(eachStatus = self status) ifTrue: [eachElement label: '> ', eachStatus]
				ifFalse: [eachElement label: eachStatus] ];
				items: (self allStati collect: [ :stati | stati ]) ]
]

{ #category : #accessing }
MyUserStory >> acceptanceCriteria: aString [
acceptanceCriteria := aString
]

{ #category : #accessing }
MyUserStory >> addNoteDropdownLook [
^ BrGlamorousWithDropdownLook 
	handle: [BrButton new
				look: BrGlamorousButtonRectangularLook + BrGlamorousButtonIconLook;
				icon: BrGlamorousIcons add
	]
	content: [ | note |
			note := MyNotes
				id: nil
				note: ''
				author: ''.
			note asFormElement: [ notes add: note ]]
]

{ #category : #accessing }
MyUserStory >> allStati [
"returns an orderedCollection of stati"
 ^ #('not-started' 'in-progress' 'done')
]

{ #category : #accessing }
MyUserStory >> asDetailedStoryCard [
	"Returns a bloc element that renders a card"

	| task taskDescription containerLeft checkbox newTask checkList statusElement notesContainer containerRight card |
	
	card := BlElement new
		layout: BlLinearLayout horizontal;
		margin: (BlInsets all: 20);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
	
	containerLeft := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
	
	containerRight := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical matchParent ].
			
	containerLeft addChild: self asUserStoryEditable.
	
	"status with dropdown"
	statusElement := self statusLabelAndDropdown.
	containerLeft addChild: statusElement.
	
	containerLeft 
		addChild: (BrLabel new
				look: BrGlamorousLabelLook;
				beLargeSize;
				text: 'Acceptance Criteria:';
				yourself);
		addChild:
			(BrEditableLabel new
				look: BrGlamorousEditableLabelLook new glamorousRegularFontAndSize;
				margin: (BlInsets bottom: 20);
				text: acceptanceCriteria;
				when: BrEditorAcceptWish do: [ :aWish | acceptanceCriteria := aWish text ];
				yourself).

	"checklist"
	task := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
	checkList := BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ];
		addChild:
			(BrLabel new
				look: BrGlamorousLabelLook;
				beLargeSize;
				text: 'Checklist:';
				margin: (BlInsets top: 0 left: 0 bottom: 5 right: 20);
				yourself).
	"add task button"
	checklist
		collect: [ :aList | 
			checkList
				addChild:
					(BrButton new
						look: BrGlamorousButtonWithIconLook + aList addTaskDropdownLook;
						icon: BrGlamorousVectorIcons add;
						beTinySize;
						label: 'Add a Task') ].
	task addChild: checkList.

	"makes tasklist for checklist"
	checklist
		collect: [ :list | 
			list tasks
				collect: [ :aTask | 
					taskDescription := (aTask getTaskDescription: aTask).
					task addChild: taskDescription ].
			containerLeft addChild: task ].
			
	"notes"
	notesContainer := (self notesContainerWithDropdown).
						
	containerLeft addChild: notesContainer.
	notes collect: [ :note | containerLeft addChild: (BrLabel new
								text: note author, ' says: ', note description;
								look: BrGlamorousLabelLook;
								beNormalSize;
								constraintsDo: [ :c | 
									c horizontal matchParent.
									c vertical fitContent ]).].
	
	"right side"
	containerRight addChild: (BrLabel new
						text: 'Assignees:';
						look: BrGlamorousLabelLook;
						beLargeSize;
						constraintsDo: [ :c | 
									c horizontal matchParent.
									c vertical fitContent ]).
	assignees collect: [:each | containerRight addChild: each asShorthandCircle].
	
	"Persona"
	containerRight addChild: (BrLabel new
						text: 'Persona:';
						look: BrGlamorousLabelLook;
						beLargeSize;
						constraintsDo: [ :c | 
									c horizontal matchParent.
									c vertical fitContent ]).
	personas collect: [:each | containerRight addChild: each asListElement].
	card addChild: containerLeft;
			addChild: containerRight.
	
	
	^ card
]

{ #category : #accessing }
MyUserStory >> asFormElement: aBlock [
	"a user story presents itself as a form to be filled and save as an object"

	| label textElementRole textElementMeans textElementBenefit |
	textElementRole := GtDocument new asElementWithoutSaveAction
		vFitContent;
		hMatchParent;
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 2);
		padding: (BlInsets all: 3);
		margin: (BlInsets top: 3 bottom: 3);
		geometry: (BlRectangle cornerRadius: 5).
	textElementMeans := GtDocument new asElementWithoutSaveAction
		vFitContent;
		hMatchParent;
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 2);
		padding: (BlInsets all: 3);
		margin: (BlInsets top: 3 bottom: 3);
		geometry: (BlRectangle cornerRadius: 5).
	textElementBenefit := GtDocument new asElementWithoutSaveAction
		vFitContent;
		hMatchParent;
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 2);
		padding: (BlInsets all: 3);
		margin: (BlInsets top: 3 bottom: 3);
		geometry: (BlRectangle cornerRadius: 5).
	^ BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal exact: 300 ];
		padding: (BlInsets all: 5);
		addChild:
			(BrLabel new
				look: BrGlamorousLabelLook;
				beLargeSize;
				text: 'As a';
				yourself);
		addChild: textElementRole;
		addChild:
			(BrLabel new
				look: BrGlamorousLabelLook;
				beLargeSize;
				text: 'I want';
				yourself);
		addChild: textElementMeans;
		addChild:
			(BrLabel new
				look: BrGlamorousLabelLook;
				beLargeSize;
				text: 'so that';
				yourself);
		addChild: textElementBenefit;
		addChild:
			(BrButton new
				look: BrGlamorousButtonWithIconLook;
				icon: BrGlamorousVectorIcons accept;
				label: 'Save';
				action: [ role := textElementRole document text asString.
					means := textElementMeans document text asString.
					benefit := textElementBenefit document text asString.
					(benefit isEmpty)
						ifTrue: [ description := 'As a ' , role , ', I want ' , means ]
						ifFalse: [ description := 'As a ' , role , ', I want ' , means , ' so that '
								, benefit ].
								status := 'not-started'. aBlock value
					"The following line means that when we click the save button, the arguement i.e., aBlock is evaluated" ];
				yourself);
		yourself
]

{ #category : #accessing }
MyUserStory >> asMinimalStoryCard [
	^ BlElement new
		layout: BlLinearLayout vertical;
		geometry: (BlRoundedRectangleGeometry cornerRadius: 10);
		margin: (BlInsets all: 10);
		addChild:
			(BrLabel new
				look: BrGlamorousLabelLook;
				beLargeSize;
				margin: (BlInsets right: 3);
				text: self description;
				yourself);
		yourself
]

{ #category : #accessing }
MyUserStory >> asUserStoryEditable [
"Returns a vertical element of a editable user story for the detailed story card"
	^ BlElement new
		geometry: (BlRectangle cornerRadius: 12);
		layout: BlFlowLayout horizontal;
		margin: (BlInsets bottom: 10);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent.
			 ];
		addChild:
			(BrLabel new
				look: BrGlamorousLabelLook;
				beLargeSize;
				margin: (BlInsets right: 5);
				text: 'As a';
				yourself);
		addChild:
			(BrEditableLabel new
				look: BrGlamorousEditableLabelLook new glamorousRegularFontAndSize;
				text: role;
				when: BrEditorAcceptWish do: [ :aWish | role := aWish text ];
				yourself);
		addChild:
			(BrLabel new
				look: BrGlamorousLabelLook;
				beLargeSize;
				margin: (BlInsets right: 5);
				text: ', I want';
				yourself);
		addChild:
			(BrEditableLabel new
				look: BrGlamorousEditableLabelLook new glamorousRegularFontAndSize;
				text: means;
				when: BrEditorAcceptWish do: [ :aWish | means := aWish text ];
				yourself);
		addChild:
			(BrLabel new
				look: BrGlamorousLabelLook;
				beLargeSize;
				margin: (BlInsets right: 5);
				text: 'so that';
				yourself);
		addChild:
			(BrEditableLabel new
				look: BrGlamorousEditableLabelLook new glamorousRegularFontAndSize;
				text: benefit;
				when: BrEditorAcceptWish do: [ :aWish | benefit := aWish text ];
				yourself);
		yourself
]

{ #category : #accessing }
MyUserStory >> assignees: anArray [
 assignees := anArray
]

{ #category : #accessing }
MyUserStory >> benefit: aString [
"part after 'so that' in user story"
	benefit := aString
]

{ #category : #accessing }
MyUserStory >> checklist: anObject [ 
checklist := anObject
]

{ #category : #accessing }
MyUserStory >> customEntityElementFor: aReference [
	"generate a UI element for a missing reference to a class, used in the Referenced Entities view"

	| container label button separator referencedEntity |
	referencedEntity := aReference copyReplaceAll: ' - missing' with: ''.
	container := BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical exact: 30 ].
	separator := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
	label := BrLabel new
		look: BrGlamorousListLabelLook;
		text: aReference asRopedText.

	"button := RequirementClassAdditionInterface new initializeWithFutureClassName: referencedEntity andElement: self."
	container addChild: label.
	container addChild: separator.
	container addChild: button.
	^ container
]

{ #category : #accessing }
MyUserStory >> description [
"returns user story with benefit if defined, otherwise without"
	(benefit isEmpty
		ifTrue: [ description := 'As a ' , role , ', I want ' , means ]
		ifFalse: [ description := 'As a ' , role , ', I want ' , means , ' so that '
				, benefit ]).
	^ description
]

{ #category : #accessing }
MyUserStory >> description: aString [
	description := aString
]

{ #category : #accessing }
MyUserStory >> epic: anEpic [
epic := anEpic
]

{ #category : #accessing }
MyUserStory >> getReferencesFrom: aDocument [
	"filter out all references to domain entities from a document"

	| classAnnotations methodAnnotations missingEntityString |
	references := OrderedCollection new.
	aDocument children
		do: [ :aChild | 
			aChild class = PRParagraph
				ifTrue: [ classAnnotations := aChild
						select: [ :e | e class = GtClassAnnotation ].
					methodAnnotations := aChild
						select: [ :e | e class = GtMethodAnnotation ].
					classAnnotations
						do: [ :anAnnotation | 
							[ (references
								includes: (self class environment at: anAnnotation referencedClass name))
								ifFalse: [ references
										add: (self class environment at: anAnnotation referencedClass name) ] ]
								on: KeyNotFound
								do: [ missingEntityString := String
										streamContents: [ :out | 
											out
												nextPutAll: anAnnotation referencedClass name;
												nextPutAll: ' - missing' ].
									references add: missingEntityString ] ].
					methodAnnotations
						do: [ :anAnnotation | 
							(references includes: anAnnotation referencedMethod)
								ifFalse: [ references add: anAnnotation referencedMethod ] ] ] ].
	^ references asSet asOrderedCollection
]

{ #category : #accessing }
MyUserStory >> getTeamMembers [
^epic project teamMembers
]

{ #category : #accessing }
MyUserStory >> gtDescriptionFor: aView [
	<gtView>
	| document |
	document := GtDocument new text: self description.
	^ (document gtTextFor: aView)
		title: 'Description';
		priority: 2;
		actionButtonIcon: BrGlamorousVectorIcons accept
			label: 'Save'
			action: [ self description: document text asString
			"self announcer announce: ERequirementStateChangedAnnouncement new" ];
		"updateWhen: ERequirementStateChangedAnnouncement in: self announcer;"
			priority: 1
]

{ #category : #accessing }
MyUserStory >> gtDetailedStoryCardFor: aView [
	<gtView>
	^ aView explicit
		title: 'Story card';
		priority: 0;
		updateWhen: MyUserStoryStatusChange in: [announcer];
		stencil: [ self asDetailedStoryCard
				look: BrShadowLook;
				background: Color white;
				padding: (BlInsets all: 5);
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical fitContent ];
				yourself ]
]

{ #category : #accessing }
MyUserStory >> gtMinimalStoryCardFor: aView [
	<gtView>
	^ aView explicit
		title: 'Minimal';
		priority: 1;
		stencil: [ self asMinimalStoryCard
				look: BrShadowLook;
				background: Color white;
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ];
				padding: (BlInsets all: 5);
				yourself ]
]

{ #category : #accessing }
MyUserStory >> gtReferencedEntitiesFor: aView [
	<gtView>
	| listView |
	listView := aView list
		title: 'Referenced Entities';
		items: [ self getReferencesFrom: self parseStory ].
	listView
		itemStencil: [ :x | 
			x class = ByteString
				ifTrue: [ self customEntityElementFor: x ]
				ifFalse: [ listView buildTextElementFor: x ] ].
	listView
		actionButtonIcon: BrGlamorousVectorIcons refresh
		label: 'Refresh'
		action: [ "self announcer announce: ERequirementStateChangedAnnouncement new ].
	listView
		updateWhen: ERequirementStateChangedAnnouncement
		in: [ self announcer" ].
	^ listView
]

{ #category : #accessing }
MyUserStory >> gtScenariosFor: aView [
	<gtView>
	^ (scenarios gtItemsFor: aView)
		title: 'Scenarios';
		actionDropdownButtonIcon: BrGlamorousVectorIcons add
			tooltip: 'Add an scenario'
			content: [ | label |
			BlElement new
				layout: BlLinearLayout horizontal;
				constraintsDo: [ :c | 
					c vertical fitContent.
					c horizontal fitContent ];
				padding: (BlInsets all: 5);
				addChild:
					(label := BrEditableLabel new
						look: BrGlamorousEditableLabelLook new glamorousRegularFontAndSize;
						yourself);
				addChild:
					(BrButton new
						look: BrGlamorousButtonWithIconLook;
						icon: BrGlamorousVectorIcons accept;
						label: 'Save';
						action: [ scenarios add:
								(MyScenario id: nil description: label text asString) ];
						yourself);
				yourself ]
]

{ #category : #accessing }
MyUserStory >> id: aString [
	id := aString
]

{ #category : #accessing }
MyUserStory >> initialize [
	super initialize.
	announcer :=  Announcer new.
]

{ #category : #accessing }
MyUserStory >> labels: anArray [
labels := anArray
]

{ #category : #accessing }
MyUserStory >> means: aString [
"the part of a user story after 'I want' "
 means := aString
]

{ #category : #accessing }
MyUserStory >> notes [
^notes
]

{ #category : #accessing }
MyUserStory >> notes: anArray [
notes := anArray 
]

{ #category : #accessing }
MyUserStory >> notesContainerWithDropdown [
| notesContainer |
	notesContainer := BlElement new
						layout: BlLinearLayout horizontal;
						constraintsDo: [ :c | 
									c horizontal matchParent.
									c vertical fitContent ].
	^ notesContainer addChild: (BrLabel new
						text: 'Notes:';
						look: BrGlamorousLabelLook;
						margin: (BlInsets top: 20 left: 0 bottom: 5 right: 20);
						beLargeSize);
						addChild: (BrButton new 
						look: BrGlamorousButtonWithIconLook + self addNoteDropdownLook;
						icon: BrGlamorousVectorIcons add;
						margin: (BlInsets top: 20 left: 0 bottom: 5 right: 0);
						beTinySize;
						label: 'Add a Note').
]

{ #category : #accessing }
MyUserStory >> parseStory [
	| aPRDocument |
	aPRDocument := GtDocumenterParser new parse: self description.
	^ aPRDocument
]

{ #category : #accessing }
MyUserStory >> personas [
^personas
]

{ #category : #accessing }
MyUserStory >> personas: anArray [
personas := anArray
]

{ #category : #accessing }
MyUserStory >> points: aNumber [
	points := aNumber
]

{ #category : #accessing }
MyUserStory >> printOn: aStream [
	aStream nextPutAll: (benefit isEmpty
		ifTrue: [ description := 'As a ' , role , ', I want ' , means ]
		ifFalse: [ description := 'As a ' , role , ', I want ' , means , ' so that '
				, benefit ])
]

{ #category : #accessing }
MyUserStory >> role: aString [
"the part of a user story after 'As a' "
 role := aString
]

{ #category : #accessing }
MyUserStory >> scenarios: anArray [
	scenarios := anArray do: [ :each | each userStory: self]
]

{ #category : #accessing }
MyUserStory >> status [
 ^status
]

{ #category : #accessing }
MyUserStory >> status: anotherString [
	status := anotherString.
]

{ #category : #accessing }
MyUserStory >> statusColor [
	status = 'not-started'
		ifTrue: [ ^ Color lightRed ].
	status = 'in-progress'
		ifTrue: [ ^ Color lightYellow ].
	status = 'done'
		ifTrue: [ ^ Color lightGreen ]
]

{ #category : #accessing }
MyUserStory >> statusForDetailedCard [

^BlElement new
				layout: BlLinearLayout horizontal;
				addChild:
					(BrLabel new
						look: BrGlamorousLabelLook;
						beLargeSize;
						margin: (BlInsets right: 3);
						text: 'Status:';
						yourself);
				addChild:
					(BrButton new
						label: self status;
						look: BrGlamorousButtonWithLabelAndIconLook + (self aWithAllStatiDropdownLook);
						icon: BrGlamorousIcons menu;
						yourself);
				yourself.
]

{ #category : #accessing }
MyUserStory >> statusLabelAndDropdown [
| statusElement |
	^ statusElement := BlElement new
		layout: BlLinearLayout horizontal;
		margin: (BlInsets bottom: 20);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ];
		addChild:
			(BrLabel new
				look: BrGlamorousLabelLook;
				beNormalSize;
				margin: (BlInsets right: 10);
				text: 'Status:';
				yourself);
		addChild:
			(BrButton new
				size: 20 @ 20;
				geometry: (BlRoundedRectangleGeometry cornerRadius: 10);
				label: 'status';
				look: self aButtonCircularLook create + self aWithAllStatiDropdownLook;
				yourself).
]

{ #category : #accessing }
MyUserStory >> subItems [
 ^ OrderedCollection new
]

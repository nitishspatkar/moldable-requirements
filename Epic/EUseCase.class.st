"
!Use Case

Uses cases are actions that define how a system and a user work together to achieve a goal. Because of this, each use case will have a task and an actor. The task will be within the scope of the epic's feature. They are one step into more detail from an ${class:name=Epic}$.

The title serves as a 1 or 2 word summation of the contents of the use case for identification purposes. The actor will be an ${class:name=EActor}$ who can have specifications made about them. The task will be a more detailed account of the title and goal of this use case.

Each use case will have a collection of ${class:name=EUserStory}$ that will give more specifications and scenarios.

"
Class {
	#name : #EUseCase,
	#superclass : #Object,
	#instVars : [
		'title',
		'actor',
		'supportingActor',
		'precondition',
		'successGarantie',
		'complexity',
		'flowOfEvents',
		'state',
		'task',
		'userStories',
		'references',
		'announcer'
	],
	#category : #'Epic-Model'
}

{ #category : #accessing }
EUseCase >> actor [
	^ actor
]

{ #category : #accessing }
EUseCase >> actor: anObject [
	actor := anObject
]

{ #category : #adding }
EUseCase >> addActor [
	| a |
	a := EActor new.
	actor add: a.
]

{ #category : #adding }
EUseCase >> addActor: anObject [
	actor add: anObject.
]

{ #category : #adding }
EUseCase >> addUserStory: aUserStory [
	self userStories add: aUserStory
]

{ #category : #accessing }
EUseCase >> announcer [
	^announcer
]

{ #category : #accessing }
EUseCase >> announcer: anAnnouncer [
	announcer := anAnnouncer
]

{ #category : #accessing }
EUseCase >> children [
	^ self userStories
]

{ #category : #accessing }
EUseCase >> complexity [
	^ complexity
]

{ #category : #accessing }
EUseCase >> complexity: anObject [
	complexity := anObject
]

{ #category : #'as yet unclassified' }
EUseCase >> createUserStory [
	| us |
	us := EUserStory new.
	userStories add: us.
]

{ #category : #ui }
EUseCase >> customEntityElementFor: aReference [
	"generate a UI element for a missing reference, used in the Referenced Entities view"
	| container label button separator referencedEntity |
	
	referencedEntity :=  aReference copyReplaceAll: ' - missing' with: ''.
	
	container := BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical exact: 30.
			 ].
	
	separator := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent.
			 ].
	
	label := BrLabel new
		aptitude: BrGlamorousListLabelAptitude;
		text: aReference asRopedText.
	
	button := RequirementClassAdditionInterface new initializeWithFutureClassName: referencedEntity andElement: self.
	
	container addChild: label.
	container addChild: separator.
	container addChild: button.
	^container
]

{ #category : #accessing }
EUseCase >> flowOfEvents [
	^ flowOfEvents
]

{ #category : #accessing }
EUseCase >> flowOfEvents: anObject [
	flowOfEvents := anObject
]

{ #category : #'entity references' }
EUseCase >> getReferencesFrom: aCollectionOfUserStories [
	| storyReferences uniqueReferences |
	uniqueReferences := Set new.
	aCollectionOfUserStories do: [ :aStory | 
		storyReferences := aStory getReferencesFrom: aStory parseStory.
		uniqueReferences addAll: storyReferences.
		 ].
	references := uniqueReferences asOrderedCollection.
	^references
]

{ #category : #ui }
EUseCase >> gtActorColumnsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Actors';
		priority: 1;
		items: [ self actor asOrderedCollection];
		column: 'Index' item: [ :anElement :anIndex | anIndex ] width: 40;
		column: 'Name' item: [ :anElement | anElement name ] width: 200
]

{ #category : #ui }
EUseCase >> gtCaseInfoFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Information';
		priority: 0;
		text: [ title , String cr , String cr, 
				'The current state of this use case is: ' , state , String cr, 
				String cr , 'The task of this use case is: ' , self task, String cr,
				'Actor: ', (self actor ifNil: ['']) asString, String cr,
				'Supporting Actor: ', self supportingActor asString, String cr,
				'Precondition: ', (self precondition ifNil: ['']) , String cr,
				'SuccessGarantie: ', (self successGarantie ifNil: ['']) , String cr,
				'Complexity: ', (self complexity  ifNil: ['']), String cr,
				'Flow of events: ', (self flowOfEvents ifNil: ['']) , String cr 
				
				
				]
				
			
]

{ #category : #ui }
EUseCase >> gtDiagramFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Diagram';
		priority: 4;
		text: [ 'This page will hopefully have a use case diagram' ]
]

{ #category : #ui }
EUseCase >> gtDocumentFor: aView [
	<gtView>
	| aDocument |
	aDocument := GtDocument new
		text:
			'A ${class:name=EUseCase}$ is defined as: I am a(n) ${class:name=EActor}$ who wants to complete a task.
			
Under information you will see the name of this use case as well as the state it is currently in and the task that the use case is responsible for implementing.
			
In Actors, you can see the list of ${class:name=EActor}$ that exists in this use case.

Under User Stories you can see a list of all ${class:name=EUserStory}$.

Under Diagram, you will be able to see a use case diagram. This is still under construction.'.
	^ (aDocument gtTextFor: aView)
		title: 'View Details';
		priority: 1
]

{ #category : #'entity references' }
EUseCase >> gtReferencesFor: aView [
	<gtView>
	| listView |
   listView := aView list
		title: 'Referenced Entities';
		items: [ self getReferencesFrom: self children ].
	listView itemStencil: [ :x | 
			(x class = ByteString) 
			ifTrue: [ self customEntityElementFor: x ]
			ifFalse: [ listView buildTextElementFor: x ]
			 ].
	listView actionButtonIcon: BrGlamorousVectorIcons refresh 
			label: 'Refresh'
			action: [ self announcer announce: ERequirementStateChangedAnnouncement new ].
	listView updateWhen: ERequirementStateChangedAnnouncement in: [ self announcer ].
	^listView
]

{ #category : #'as yet unclassified' }
EUseCase >> gtTreeViewOn: aView [
	<gtView>
	self userStories isEmpty
		ifTrue: [ ^ aView empty ].
	^ aView columnedTree
		title: 'Tree' translated;
		items: [ self children ];
		children: [ :each | each children ];
		column: 'Type'
			text: [ :eachElement | eachElement treeViewShortString ]
]

{ #category : #ui }
EUseCase >> gtUserStoryColumnsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'User Stories';
		priority: 3;
		items: [ self userStories asArray ];
		column: 'Index' item: [ :anElement :anIndex | anIndex ] width: 30;
		column: 'User' item: [ :anElement :anIndex | anElement user name ] width: 100;
		column: 'Action' item: [ :anElement :anIndex | anElement action ].
]

{ #category : #initialization }
EUseCase >> initialize [
	super initialize.
	announcer := Announcer new.
	userStories := OrderedCollection new.
	actor := OrderedCollection new.
	references := OrderedCollection new.
	actor add: EActor new.
	title :=  'Use Case Title'.
	state :=  'Not started'.
	task := 'Undefined'.
	
	
]

{ #category : #'as yet unclassified' }
EUseCase >> markComplete [
	state := 'Completed'.
]

{ #category : #'as yet unclassified' }
EUseCase >> markStarted [
	state := 'In progress'.
]

{ #category : #accessing }
EUseCase >> nodeHighlightColor [
	^ Color cyan
]

{ #category : #accessing }
EUseCase >> precondition [
	^ precondition
]

{ #category : #accessing }
EUseCase >> precondition: anObject [
	precondition := anObject
]

{ #category : #adding }
EUseCase >> removeUserStory: aUserStory [
	self userStories remove: aUserStory
]

{ #category : #accessing }
EUseCase >> state [
	^ state
]

{ #category : #accessing }
EUseCase >> state: anObject [
	state := anObject
]

{ #category : #accessing }
EUseCase >> successGarantie [
	^ successGarantie
]

{ #category : #accessing }
EUseCase >> successGarantie: anObject [
	successGarantie := anObject
]

{ #category : #accessing }
EUseCase >> supportingActor [
	^ supportingActor
]

{ #category : #accessing }
EUseCase >> supportingActor: anObject [
	supportingActor := anObject
]

{ #category : #accessing }
EUseCase >> task [
	^ task
]

{ #category : #accessing }
EUseCase >> task: anObject [
	task := anObject
]

{ #category : #accessing }
EUseCase >> title [
	^ title
]

{ #category : #accessing }
EUseCase >> title: anObject [
	title := anObject
]

{ #category : #'as yet unclassified' }
EUseCase >> treeViewShortString [
	^ 'Use Case: (Title:' , self title, ' , Task: ', self task, ')'
]

{ #category : #accessing }
EUseCase >> userStories [
	^ userStories
]

{ #category : #accessing }
EUseCase >> userStories: anObject [
	userStories := anObject
]

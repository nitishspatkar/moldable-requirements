"
!User Story

User stories are brief descriptions of the feature and its purpose - the focus is on user and business needs, goals, and benefits. They do not contain techincal details or specifications. Stories need to be specific, measurable, achievable, relevant, and time boxed (limited duration). They are one step deeper into detail from a ${class:name=EUseCase}$. 

The format on a traditional story card is
			As a <user> I want to <complete action> so that I can <goal>
			
${class:name=EScenario}$ are examples that serve as test cases.
The user of each story is an ${class:name=EActor}$ who can have specifications made about them. The action can be defined as a quick phrase about what the ${class:name=EActor}$ will be doing (i.e. use an email address). The goal is related to/the same as the task in the heirarchal use case (i.e. register for an account).
"
Class {
	#name : #EUserStory,
	#superclass : #Object,
	#instVars : [
		'user',
		'action',
		'goal',
		'component',
		'pillar',
		'scenarios',
		'acceptCriteria',
		'title',
		'points',
		'state',
		'announcer',
		'references',
		'description'
	],
	#category : #'Epic-Model'
}

{ #category : #accessing }
EUserStory >> acceptCriteria [
	^ acceptCriteria
]

{ #category : #accessing }
EUserStory >> acceptCriteria: anObject [
	acceptCriteria := anObject
]

{ #category : #accessing }
EUserStory >> action [
	^ action
]

{ #category : #accessing }
EUserStory >> action: anObject [
	action := anObject
]

{ #category : #adding }
EUserStory >> addClassPlaceholder: aName [ 
	Object subclass: aName asSymbol 
	instanceVariableNames: ''
	classVariableNames: ''
	package: ''
]

{ #category : #adding }
EUserStory >> addScenario: aScenario [
	scenarios add: aScenario.
]

{ #category : #accessing }
EUserStory >> announcer [ 
	"The announcer announces to potential watchers (typically viewers)
	that a new signal was recorded"
	^ announcer
]

{ #category : #accessing }
EUserStory >> announcer: anAnnouncer [
	"Change the associated announcer"
	announcer := anAnnouncer.
]

{ #category : #helper }
EUserStory >> buildClassStringFromUser [
	| camelCase |
	camelCase := user class = ByteString
		ifTrue: [ user asCamelCase ]
		ifFalse: [ user class name asCamelCase ].
	^ camelCase
]

{ #category : #helper }
EUserStory >> buildMethodStringFromAction [
	| camelCase |
	camelCase := action asCamelCase.
	camelCase at:1 put: ((camelCase at:1) asLowercase).
	^camelCase
]

{ #category : #'ui helpers' }
EUserStory >> cardViewGenerate [
	"Used by the gtCardViewFor method to create the story card view."
	|container verticalContainerLeft verticalContainerRight detailsTextContainer criteriaContainer stateColorContainer stateTextContainer pointsContainer details pointsText stateText criteriaText changeStateButton |
			details := (
			'User story:', String cr, String cr, 
			'As ', self user asString, ',', String cr, 
			'I want to ', self action, ',', String cr, 
			'So I can ', self goal, '.').
			pointsText := ('Points: ', self points asString).
			stateText := ('Status: ', self state).
			criteriaText := ('Acceptance criteria: ', String cr, self acceptCriteria).
			
			container := BlElement new
				geometry: (BlRectangle cornerRadius: 12);
				layout: BlLinearLayout horizontal;
				background: Color white;
				aptitude: BrShadowAptitude;
				margin: (BlInsets all: 20);
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical fitContent].
					
			stateColorContainer := BlElement new
				geometry: BlCircle new;
				size: 50@50;
				background: self getStateColor;
				border: (BlBorder paint: Color gray width: 1);
				margin: (BlInsets top: 10 right: 10 bottom: 10 left: 0).
				
			stateTextContainer := BlTextElement new
				constraintsDo: [ :c |
					c horizontal fitContent.
					c vertical fitContent ];
				text: stateText asRopedText.
				
			pointsContainer := BlTextElement new
				geometry: (BlRectangle cornerRadius: 6);
				layout: (BlLinearLayout horizontal) alignCenter;
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent. ];
				border: (BlBorder paint: (Color fromHexString: 'd9d9d9') width: 1);
				padding: (BlInsets all: 5);
				text: pointsText asRopedText.
				
			changeStateButton := (BrButton new
				layout: (BlLinearLayout horizontal) alignBottomCenter;
				margin: (BlInsets top: 5);
				background: (Color fromHexString: 'eaeaea');
				aptitude: BrGlamorousButtonWithLabelAptitude new;
				label: 'Change Status';
				action: [ 
					self inform: 'Clicked change state button.'. 
					self changeWorkState. "This changes the object's state"
					announcer announce: ERequirementStateChangedAnnouncement
					]).
			
			detailsTextContainer := BrEditor new
				geometry: (BlRectangle cornerRadius: 6);
				border: (BlBorder paint: (Color fromHexString: 'd9d9d9') width: 1);
				aptitude: (BrGlamorousRegularEditorAptitude new fontSize: 16);
				text: details asRopedText;
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ].
					
			criteriaContainer := BrEditor new
				geometry: (BlRectangle cornerRadius: 6);
				margin: (BlInsets top: 5);
				padding: (BlInsets top: 5; left: 5);
				border: (BlBorder paint: (Color fromHexString: 'd9d9d9') width: 1);
				aptitude: (BrGlamorousRegularEditorAptitude new fontSize: 16);
				text: criteriaText asRopedText;
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical fitContent ].
					
			verticalContainerLeft := BlElement new
				layout: (BlLinearLayout vertical) alignTopLeft;
				margin: (BlInsets all: 10);
				constraintsDo: [ :c |
					c horizontal matchParent.
					c vertical fitContent].
					
			verticalContainerRight := BlElement new
				layout: (BlLinearLayout vertical) alignCenter;
				margin: (BlInsets all: 10);
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical matchParent.
					].
					
			verticalContainerLeft addChild: detailsTextContainer.
			verticalContainerLeft addChild: criteriaContainer.
			verticalContainerRight addChild: pointsContainer.
			verticalContainerRight addChild: stateColorContainer.
			verticalContainerRight addChild: stateTextContainer.
			verticalContainerRight addChild: changeStateButton.
			container addChild: verticalContainerLeft.
			container addChild: verticalContainerRight.
			^container
]

{ #category : #'work state' }
EUserStory >> changeWorkState [
	"Changes the work state of the user story in cyclical order (started -> in progress -> done -> started etc.)"
	state = 'Not started' 
		ifTrue: [ self markStarted. ]
		ifFalse: [ 
			state = 'In progress'
				ifTrue: [ self markComplete ]
				ifFalse: [ self markNotStarted ]
				 ]
]

{ #category : #accessing }
EUserStory >> children [ 
	^ self scenarios
]

{ #category : #accessing }
EUserStory >> component [
	^ component
]

{ #category : #accessing }
EUserStory >> component: anObject [
	component := anObject
]

{ #category : #ui }
EUserStory >> customEntityElementFor: aReference [
	"generate a UI element for a missing reference to a class, used in the Referenced Entities view"
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
EUserStory >> description [
	^description
]

{ #category : #accessing }
EUserStory >> description: aString [
	description := aString
]

{ #category : #'entity references' }
EUserStory >> getReferencesFrom: aDocument [
	"filter out all references to domain entities from a document"

	^ aDocument
		select:
			[ :e | e class = GtClassAnnotation or: [ e class = GtMethodAnnotation ] ]
]

{ #category : #'work state' }
EUserStory >> getStateColor [
	| color |
	(state = 'Not started') ifTrue: [ color := Color red ].
	(state = 'In progress') ifTrue: [ color := Color yellow ].
	(state = 'Complete') ifTrue: [ color := Color green ].
	^ color
]

{ #category : #accessing }
EUserStory >> goal [
	^ goal
]

{ #category : #accessing }
EUserStory >> goal: anObject [
	goal := anObject
]

{ #category : #ui }
EUserStory >> gtCardViewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Card' translated;
		priority: 5;
		updateWhen: ERequirementStateChangedAnnouncement in: [ self announcer ];
		stencil: [self cardViewGenerate].
]

{ #category : #ui }
EUserStory >> gtDescriptionFor: aView [
	<gtView>
	| document |
	document := GtDocument new text: self description.

	
	^(document gtTextFor: aView)
      title: 'Description';
		actionButtonIcon: BrGlamorousVectorIcons accept 
			label: 'Save' 
			action: [ self description: document text asString.
						self announcer announce: ERequirementStateChangedAnnouncement new ];
		updateWhen: ERequirementStateChangedAnnouncement in: self announcer;
      priority: 1.
]

{ #category : #ui }
EUserStory >> gtDocumentFor: aView [
   <gtView>
   | aDocument userObject actionObject |
	userObject := '${class:name=', self buildClassStringFromUser, '}$'.
	actionObject := '${method:name=', self buildClassStringFromUser, '>>#', self buildMethodStringFromAction, '}$'.
	aDocument := GtDocument new text: 'As a ', userObject, ' I want to ', actionObject, ' so that I can <goal>

Under elements, you can see a list of all actors that are present within this user story.

Under scenarios, you can see a list and view each of the scenarios used to support this story.'. 
   ^ (aDocument gtTextFor: aView)
       title: 'View Details';
       priority: 1
]

{ #category : #parsing }
EUserStory >> gtReferencesFor: aView [
	<gtView>
	^ aView list
		title: 'Referenced Entities';
		items: [ self getReferencesFrom: self parseStory ];
		itemStencil: [ :x | 
			| container label button separator |
			container := BlElement new
				layout: BlLinearLayout horizontal;
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical exact: 30 ].
			separator := BlElement new
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical fitContent ].
			label := BrLabel new aptitude: BrGlamorousListLabelAptitude.
			button := RequirementClassAdditionInterface new.
			container addChild: label.
			container addChild: separator.
			container addChild: button ];
		itemDataBinder: [ :anItemElement :anItem | 
			anItemElement children first text: anItem referencedClass name.
			anItemElement children third
				initializeWithFutureClassName: anItem referencedClass name
					andElement: anItemElement;
				visibility:
					(anItem isClassDefined
						ifTrue: [ BlVisibility hidden ]
						ifFalse: [ BlVisibility visible ]) ];
		actionButtonIcon: BrGlamorousVectorIcons refresh
			label: 'Refresh'
			action: [ self announcer announce: ERequirementStateChangedAnnouncement new ];
		updateWhen: ERequirementStateChangedAnnouncement
			in: [ self announcer ]
]

{ #category : #ui }
EUserStory >> gtStoryInfoFor: aView [
	<gtView>
"	|aDocument|
	aDocument := GtDocument new.
	aDocument editor useSyncStylerStrategy.
	self assert: aDocument isSubscribedToSystem not.
	self assert: (SystemAnnouncer uniqueInstance hasSubscriber: aDocument) not.
	^ aDocument
	"
	^ aView textEditor
		title: 'Information';
		priority: 0;
		text: [ 'As a ', user asString, ', I want to ', action, '.', String cr]
]

{ #category : #ui }
EUserStory >> gtTreeViewOn: aView [
	<gtView>
	self scenarios isEmpty
		ifTrue: [ ^ aView empty ].
	^ aView columnedTree
		title: 'Tree' translated;
		items: [ self children ];
		children: [ :each | each children ];
		column: 'Type'
			text: [ :eachElement | eachElement treeViewShortString ]
]

{ #category : #ui }
EUserStory >> gtViewScenarios: aView [
	<gtView>
	^ aView list
		title: 'Scenarios';
		priority: 3;
		items: [ scenarios ];
		itemText: [ :aScenario | aScenario description ]
]

{ #category : #initialization }
EUserStory >> initialize [
	super initialize.
	user := EActor new.
	component := OrderedCollection new.
	component add: user.
	goal := 'Undefined'.
	action := 'Undefined'.
	description := ''.
	scenarios := OrderedCollection new.
	acceptCriteria := 'Undefined'.
	points := 0.
	state := 'Not started'.
	announcer := Announcer new.
	references := OrderedCollection new.
]

{ #category : #'work state' }
EUserStory >> markComplete [
	state := 'Complete'.
]

{ #category : #'work state' }
EUserStory >> markNotStarted [
	state := 'Not started'.
]

{ #category : #'work state' }
EUserStory >> markStarted [
	state := 'In progress'.
]

{ #category : #accessing }
EUserStory >> nodeHighlightColor [
	^ Color blue
]

{ #category : #'entity references' }
EUserStory >> parseStory [
	| aPRDocument |
	aPRDocument := GtDocumenterParser new parse: self description. 
	
	^ aPRDocument
]

{ #category : #accessing }
EUserStory >> pillar [
	^ pillar
]

{ #category : #accessing }
EUserStory >> pillar: anObject [
	pillar := anObject
]

{ #category : #accessing }
EUserStory >> points [
	^points
]

{ #category : #accessing }
EUserStory >> points: anInteger [
	points := anInteger
]

{ #category : #adding }
EUserStory >> removeScenario: aScenario [
	scenarios remove: aScenario.
]

{ #category : #accessing }
EUserStory >> scenarios [
	^ scenarios
]

{ #category : #accessing }
EUserStory >> state [ 
	^state
]

{ #category : #accessing }
EUserStory >> state: anObject [
	state := anObject.
]

{ #category : #accessing }
EUserStory >> title [
	^title
]

{ #category : #accessing }
EUserStory >> title: aString [
	title := aString.
]

{ #category : #utilities }
EUserStory >> treeViewShortString [
	^ 'Use Story: (As a ', user name, ', I want to ', action, ')'
]

{ #category : #accessing }
EUserStory >> user [
	^ user
]

{ #category : #accessing }
EUserStory >> user: anObject [
	user := anObject
]

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
		'assignees',
		'acceptanceCriteria',
		'notes',
		'personas',
		'labels',
		'announcer',
		'tasks'
	],
	#category : #'MyMoldableRequirements-Models'
}

{ #category : #accessing }
MyUserStory class >> fromRawData: userStoryDict [
	^ self
		id: (userStoryDict at: #id)
		role: (userStoryDict at: #role)
		means: (userStoryDict at: #means)
		benefit: (userStoryDict at: #benefit)
		acceptanceCriteria: (userStoryDict at: #acceptanceCriteria)
		status: (MyUserStatus fromString: (userStoryDict at: #status))
		points: (userStoryDict at: #points)
		scenarios:
			((userStoryDict at: #scenarios)
				collect: [ :scenariosDict | MyScenario fromRawData: scenariosDict ])
		personas: ((userStoryDict at: #personas)
				collect: [ :personasDict | MyPersona fromRawData: personasDict ])
		assignees: ((userStoryDict at: #assignees)
				collect: [ :assigneesDict | MyTeamMembers fromRawData: assigneesDict])
		labels: ((userStoryDict at: #labels)
				collect: [ :labelDict | MyLabel fromRawData: labelDict])
		tasks: 
		((userStoryDict at: #tasks)
		collect: [:taskDict | MyTask fromRawData: taskDict])
		notes: ((userStoryDict at: #notes) collect: [:notesDict | MyNotes fromRawData: notesDict])
]

{ #category : #accessing }
MyUserStory class >> id: aString role: aString1 means: aString2 benefit: aString3 acceptanceCriteria: aString4 status: anotherString points: aNumber scenarios: anArray personas: anArray2 assignees: anotherArray labels: anotherArray2 tasks: yetAnotherArray notes: lastArray [
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
		tasks: yetAnotherArray asOrderedCollection;
		notes: lastArray asOrderedCollection
		yourself
]

{ #category : #accessing }
MyUserStory >> aButtonCircularAptitude [
"returns with aWithAllStatiDropdownAptitude a circular button aptitude for the status"
^ [BrInteractiveCommonAptitude new
							default: [:e | e
								background: self statusColor]] asStencil.
]

{ #category : #accessing }
MyUserStory >> aWithAllLabelsDropdownAptitude [
"returns a dropdown of all labels"

	^ BrGlamorousWithDropdownAptitude
		handle: [ BrButton new
				aptitude: BrGlamorousButtonRectangularAptitude + BrGlamorousButtonIconAptitude;
				icon: BrGlamorousIcons add ]
		content: [ self labelListForDropdown  ]
]

{ #category : #accessing }
MyUserStory >> aWithAllPersonasDropdownAptitude [
"returns a dropdown of all personas"

	^ BrGlamorousWithDropdownAptitude
		handle: [ BrButton new
				aptitude: BrGlamorousButtonRectangularAptitude + BrGlamorousButtonIconAptitude;
				icon: BrGlamorousIcons add ]
		content: [ self personaListForDropdown  ]
]

{ #category : #accessing }
MyUserStory >> aWithAllStatiDropdownAptitude [
	"returns a dropdown of all stati"

	^ BrGlamorousWithDropdownAptitude
		handle: [ BrButton new
				size: 20@20;
				geometry: (BlRoundedRectangleGeometry cornerRadius: 10);
				aptitude: self aButtonCircularAptitude create;
				icon: BrGlamorousIcons menu ]
		content: [
			BrSimpleList new
				itemStencil: [
					BrButton new
						aptitude: BrGlamorousLabelAptitude new
								+ (BrStyleCommonAptitude new selected: [ :aStyle | aStyle background: Color veryVeryLightGray ]);
						padding: (BlInsets all: 5);
						action: [ :aButton |
							self status: aButton model.
							aButton fireEvent: BrDropdownHideWish new ] ];
				itemDataBinder: [ :eachButton :eachStatus |
					(eachStatus = self status)
						ifTrue: [ eachButton label: '> ', eachStatus label ]
						ifFalse: [ eachButton label: eachStatus label ].
						
					eachButton model: eachStatus ];
				items: self allStati ]
]

{ #category : #accessing }
MyUserStory >> aWithAllTeamMembersDropdownAptitude [
	"returns a dropdown of all team members"

	^ BrGlamorousWithDropdownAptitude
		handle: [ BrButton new
				aptitude: BrGlamorousButtonRectangularAptitude + BrGlamorousButtonIconAptitude;
				icon: BrGlamorousIcons add ]
		content: [ self teamMembersListForDropdown ]
]

{ #category : #accessing }
MyUserStory >> acceptanceCriteria: aString [
acceptanceCriteria := aString
]

{ #category : #accessing }
MyUserStory >> addNoteDropdownAptitude [
^ BrGlamorousWithDropdownAptitude 
	handle: [BrButton new
				aptitude: BrGlamorousButtonRectangularAptitude + BrGlamorousButtonIconAptitude;
				icon: BrGlamorousIcons add
	]
	content: [ | note |
			note := MyNotes
				id: nil
				note: ''
				author: ''.
				note userStory: self.
			note asFormElement: [ notes add: note ]]
]

{ #category : #accessing }
MyUserStory >> addTaskDropdownAptitude [
	^ BrGlamorousWithDropdownAptitude 
	handle: [BrButton new
				aptitude: BrGlamorousButtonRectangularAptitude + BrGlamorousButtonIconAptitude;
				icon: BrGlamorousIcons add
	]
	content: [ | task |
			task := MyTask
				id: nil
				description: ''
				done: 'false'
				end: '01.01.2021'
				assignees: OrderedCollection new.
				task userStory: self.
			task asFormElement: [ tasks add: task ]].
]

{ #category : #accessing }
MyUserStory >> allStati [
	"returns an orderedCollection of stati"
	
	^ MyUserStatus allSubclasses collect: [ :eachStatusClass | eachStatusClass new ]
]

{ #category : #accessing }
MyUserStory >> announcer [
^announcer
]

{ #category : #'private - instance creation' }
MyUserStory >> asDetailedStoryCard [
	"Returns a bloc element that renders a card"
	| task taskDescription containerLeft checkbox newTask checkList statusElement notesContainer containerRight card assigned |

	card := BlElement new
		layout: BlLinearLayout vertical;
		margin: (BlInsets all: 20);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ];
		addChild:
			(BrButton new
				aptitude: BrGlamorousLabelAptitude;
				label: 'Epic: ' , epic title;
				size: 20 @ 20;
				beSmallSize;
				action: [ :button | button phlow spawnObject: epic ] yourself);
		addChild: self asUserStoryEditable.

	"status with dropdown"
	statusElement := self statusLabelAndDropdown.
	card addChild: statusElement.
	card
		addChild:
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				beLargeSize;
				text: 'Acceptance Criteria:';
				yourself);
		addChild:
			(BrEditableLabel new
				aptitude: BrGlamorousEditableLabelAptitude new glamorousRegularFontAndSize;
				text: acceptanceCriteria;
				when: BrEditorAcceptWish
					do: [ :aWish | acceptanceCriteria := aWish text ];
				yourself).

	"checklist"
	task := BlElement new
		layout: BlLinearLayout vertical alignCenterLeft;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
	task addChild: self checklistContainerWithDropdown.

	"makes tasklist for checklist"
	tasks
		collect: [ :aTask | 
			taskDescription := aTask getTaskDescription: aTask.
			task addChild: taskDescription ].
	card addChild: task.

	"notes"
	notesContainer := self notesContainerWithDropdown.
	card addChild: notesContainer.
	notes
		collect: [ :note | 
			card
				addChild:
					(BrLabel new
						text: note author , ' says: ' , note description;
						aptitude: BrGlamorousLabelAptitude;
						beNormalSize;
						constraintsDo: [ :c | 
							c horizontal matchParent.
							c vertical fitContent ]) ].

	"assignees"
	card addChild: self assigneeLabelAndDropdown.
	assigned := BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
	assignees
		collect: [ :each | assigned addChild: each asShorthandCircle ].
	card addChild: assigned.

	"personas"
	card addChild: self personaLabelAndDropdown.
	personas collect: [ :each | card addChild: each asListElement ].

	"labels"
	card addChild: self labelsLabelAndDropdown.
	labels
		collect: [ :each | 
			card
				addChild:
					(BrButton new
						label:each description;
						aptitude: BrGlamorousLabelAptitude;
						beNormalSize;
						constraintsDo: [ :c | 
							c horizontal matchParent.
							c vertical fitContent ]) ].
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
				aptitude: BrGlamorousLabelAptitude;
				beLargeSize;
				text: 'As a';
				yourself);
		addChild: textElementRole;
		addChild:
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				beLargeSize;
				text: 'I want';
				yourself);
		addChild: textElementMeans;
		addChild:
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				beLargeSize;
				text: 'so that';
				yourself);
		addChild: textElementBenefit;
		addChild:
			(BrButton new
				aptitude: BrGlamorousButtonWithIconAptitude;
				icon: BrGlamorousVectorIcons accept;
				label: 'Save';
				action: [ role := textElementRole document text asString.
					means := textElementMeans document text asString.
					benefit := textElementBenefit document text asString.
					(benefit isEmpty)
						ifTrue: [ description := 'As a ' , role , ', I want ' , means ]
						ifFalse: [ description := 'As a ' , role , ', I want ' , means , ' so that '
								, benefit ].
						epic ifNotNil: [ :anEpic | anEpic announcer announce: (MyUserStoryStatusChange new) ].
								aBlock value
					"The following line means that when we click the save button, the arguement i.e., aBlock is evaluated" ];
				yourself);
		yourself
]

{ #category : #accessing }
MyUserStory >> asMinimalStoryCard [
	| card labelContainer storyContainer assigneesContainer |
	card := BlElement new
		layout: BlLinearLayout vertical;
		geometry: (BlRoundedRectangleGeometry cornerRadius: 10);
		margin: (BlInsets all: 10).
		
	labelContainer := BlElement new
		layout: BlFlowLayout horizontal;
		margin: (BlInsets bottom: 20);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent.
			 ].
	labels collect: [ :each | labelContainer addChild: each asLabel].
	
	storyContainer := BrButton new
		layout: BlFlowLayout horizontal;
		margin: (BlInsets bottom: 20);
		action: [:button | button phlow spawnObject: self];
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent.
			 ].
	storyContainer addChild: (BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				beLargeSize;
				text: 'As a ';
				yourself);
				addChild: (BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				beLargeSize;
				text: role;
				yourself);
				addChild: (BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				beLargeSize;
				text: ', I want ';
				yourself);
				addChild: (BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				beLargeSize;
				text: means;
				yourself).
	(benefit isEmpty)
		ifFalse: [ storyContainer addChild: (BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				beLargeSize;
				text: ' so that ';
				yourself);
				addChild: (BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				beLargeSize;
				text: benefit;
				yourself).].
	
	assigneesContainer := BlElement new
		layout: BlFlowLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent.
			 ]. 
			 
	assignees collect: [ :each | assigneesContainer addChild: each asShorthandCircle].
	
	card addChild: labelContainer.
	card addChild: storyContainer.
	card addChild: assigneesContainer.
	^card
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
				aptitude: BrGlamorousLabelAptitude;
				beLargeSize;
				margin: (BlInsets right: 5);
				text: 'As a';
				yourself);
		addChild:
			(BrEditableLabel new
				aptitude: BrGlamorousEditableLabelAptitude new glamorousRegularFontAndSize;
				text: role;
				when: BrEditorAcceptWish do: [ :aWish | role := aWish text ];
				yourself);
		addChild:
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				beLargeSize;
				margin: (BlInsets right: 5);
				text: ', I want';
				yourself);
		addChild:
			(BrEditableLabel new
				aptitude: BrGlamorousEditableLabelAptitude new glamorousRegularFontAndSize;
				text: means;
				when: BrEditorAcceptWish do: [ :aWish | means := aWish text ];
				yourself);
		addChild:
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				beLargeSize;
				margin: (BlInsets right: 5);
				text: 'so that';
				yourself);
		addChild:
			(BrEditableLabel new
				aptitude: BrGlamorousEditableLabelAptitude new glamorousRegularFontAndSize;
				text: benefit;
				when: BrEditorAcceptWish do: [ :aWish | benefit := aWish text ];
				yourself);
		yourself
]

{ #category : #accessing }
MyUserStory >> assigneeLabelAndDropdown [
^BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ];
		addChild:
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				beLargeSize;
				margin: (BlInsets top: 20 left: 0 bottom: 5 right: 20);
				text: 'Assignees:';
				yourself);
		addChild:
			(BrButton new
				label: 'Add a Team Member';
				aptitude: BrGlamorousButtonWithIconAptitude + self aWithAllTeamMembersDropdownAptitude;
				icon: BrGlamorousVectorIcons add;
				margin: (BlInsets top: 20 left: 0 bottom: 5 right: 0);
				beTinySize;
				yourself).
]

{ #category : #accessing }
MyUserStory >> assignees [
^assignees
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
MyUserStory >> checklistContainerWithDropdown [
| checklistContainer |
	checklistContainer := BlElement new
						layout: BlLinearLayout horizontal;
						constraintsDo: [ :c | 
									c horizontal matchParent.
									c vertical fitContent ].
	^ checklistContainer addChild: (BrLabel new
						text: 'Checklist:';
						aptitude: BrGlamorousLabelAptitude;
						margin: (BlInsets top: 20 left: 0 bottom: 5 right: 20);
						beLargeSize);
						addChild: (BrButton new 
						aptitude: BrGlamorousButtonWithIconAptitude + self addTaskDropdownAptitude ;
						icon: BrGlamorousVectorIcons add;
						margin: (BlInsets top: 20 left: 0 bottom: 5 right: 0);
						beTinySize;
						label: 'Add a Note').
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
		aptitude: BrGlamorousListLabelAptitude;
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
MyUserStory >> epic [
^epic
]

{ #category : #accessing }
MyUserStory >> epic: anEpic [
epic := anEpic
]

{ #category : #accessing }
MyUserStory >> getLabels [
^self epic project labels
]

{ #category : #accessing }
MyUserStory >> getPersonas [
^ self epic project personas
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

{ #category : #'gt-extensions' }
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

{ #category : #'gt-extensions' }
MyUserStory >> gtDetailedStoryCardFor: aView [
	<gtView>
	^ aView explicit
		title: 'Story card';
		priority: 0;
		updateWhen: MyUserStoryStatusChange in: [ announcer ];
		stencil: [ self asDetailedStoryCard
				aptitude: BrShadowAptitude;
				background: Color white;
				padding: (BlInsets all: 5);
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical fitContent ];
				yourself ]
]

{ #category : #'gt-extensions' }
MyUserStory >> gtMinimalStoryCardFor: aView [
	<gtView>
	^ aView explicit
		title: 'Minimal';
		priority: 1;
		stencil: [ self asMinimalStoryCard
				aptitude: BrShadowAptitude;
				background: Color white;
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical fitContent ];
				padding: (BlInsets all: 5);
				yourself ]
]

{ #category : #'gt-extensions' }
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

{ #category : #'gt-extensions' }
MyUserStory >> gtScenariosFor: aView [
	<gtView>
	| scenario |
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
						aptitude: BrGlamorousEditableLabelAptitude new glamorousRegularFontAndSize;
						yourself);
				addChild:
					(BrButton new
						aptitude: BrGlamorousButtonWithIconAptitude;
						icon: BrGlamorousVectorIcons accept;
						label: 'Save';
						action: [ scenario := MyScenario id: nil description: label text asString.
							scenario userStory: self.
							scenarios add: scenario ];
						yourself);
				yourself ]
]

{ #category : #accessing }
MyUserStory >> id: aString [
	id := aString
]

{ #category : #initialization }
MyUserStory >> initialize [
	super initialize.

	announcer :=  Announcer new.
]

{ #category : #testing }
MyUserStory >> isDone [
	^ self status isDone
]

{ #category : #testing }
MyUserStory >> isInProgress [
	^ self status isInProgress
]

{ #category : #accessing }
MyUserStory >> labelListForDropdown [
| dropdown |
dropdown := BlElement new
				layout: BlLinearLayout vertical;
				constraintsDo: [ :c | 
					c vertical fitContent.
					c horizontal fitContent ];
				padding: (BlInsets all: 5).
			(self getLabels ) collect: [:label | dropdown addChild: (BrButton new
				aptitude: BrGlamorousLabelAptitude;
				label: label description;
				action: [ (labels includes: label) ifFalse:[labels add: label. announcer announce: MyUserStoryStatusChange] ];
				yourself). ].
			^dropdown
]

{ #category : #accessing }
MyUserStory >> labels: anArray [
labels := anArray
]

{ #category : #accessing }
MyUserStory >> labelsLabelAndDropdown [
^BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ];
		addChild:
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				beLargeSize;
				margin: (BlInsets top: 20 left: 0 bottom: 5 right: 20);
				text: 'Labels:';
				yourself);
		addChild:
			(BrButton new
				label: 'Add a Label';
				aptitude: BrGlamorousButtonWithIconAptitude + self aWithAllLabelsDropdownAptitude ;
				icon: BrGlamorousVectorIcons add;
				margin: (BlInsets top: 20 left: 0 bottom: 5 right: 0);
				beTinySize;
				yourself).
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
notes := anArray do: [ :each | each notNil ifTrue: [each userStory: self]]
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
						aptitude: BrGlamorousLabelAptitude;
						margin: (BlInsets top: 20 left: 0 bottom: 5 right: 20);
						beLargeSize);
						addChild: (BrButton new 
						aptitude: BrGlamorousButtonWithIconAptitude + self addNoteDropdownAptitude;
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
MyUserStory >> personaLabelAndDropdown [
^BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ];
		addChild:
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				beLargeSize;
				margin: (BlInsets top: 20 left: 0 bottom: 5 right: 20);
				text: 'Personas:';
				yourself);
		addChild:
			(BrButton new
				label: 'Add a Persona';
				aptitude: BrGlamorousButtonWithIconAptitude + self aWithAllPersonasDropdownAptitude;
				icon: BrGlamorousVectorIcons add;
				margin: (BlInsets top: 20 left: 0 bottom: 5 right: 0);
				beTinySize;
				yourself).
]

{ #category : #accessing }
MyUserStory >> personaListForDropdown [
| dropdown |
dropdown := BlElement new
				layout: BlLinearLayout vertical;
				constraintsDo: [ :c | 
					c vertical fitContent.
					c horizontal fitContent ];
				padding: (BlInsets all: 5).
			(self getPersonas) collect: [:person | dropdown addChild: (BrButton new
				aptitude: BrGlamorousLabelAptitude;
				label: person name;
				action: [ (personas includes: person) ifFalse:[personas add: person. announcer announce: MyUserStoryStatusChange] ];
				yourself). ].
			^dropdown
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
MyUserStory >> role [
^role
]

{ #category : #accessing }
MyUserStory >> role: aString [
"the part of a user story after 'As a' "
 role := aString
]

{ #category : #accessing }
MyUserStory >> scenarios: anArray [
	scenarios := anArray do: [ :each | each notNil ifTrue: [each userStory: self]]
]

{ #category : #accessing }
MyUserStory >> status [
 ^status
]

{ #category : #accessing }
MyUserStory >> status: myUserStatus [
	self
		assert: [ myUserStatus isKindOf: MyUserStatus ]
		description: [ 'User status must be a domain object' ].

	status = myUserStatus
		ifTrue: [ ^ self ].

	status := myUserStatus.
	
	epic ifNotNil: [ :anEpic | anEpic announcer announce: (MyUserStoryStatusChange new) ].
	self announcer announce: (MyUserStoryStatusChange new)
]

{ #category : #accessing }
MyUserStory >> statusColor [
	^ status statusColor
]

{ #category : #accessing }
MyUserStory >> statusForDetailedCard [

^BlElement new
				layout: BlLinearLayout horizontal;
				addChild:
					(BrLabel new
						aptitude: BrGlamorousLabelAptitude;
						beLargeSize;
						margin: (BlInsets right: 3);
						text: 'Status:';
						yourself);
				addChild:
					(BrButton new
						label: self status;
						aptitude: BrGlamorousButtonWithLabelAndIconAptitude + (self aWithAllStatiDropdownAptitude);
						icon: BrGlamorousIcons menu;
						yourself);
				yourself.
]

{ #category : #'private - instance creation' }
MyUserStory >> statusLabelAndDropdown [
	| statusElement |

	statusElement := BlElement new
		layout: BlLinearLayout horizontal;
		margin: (BlInsets bottom: 20);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ];
		addChild:
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				beNormalSize;
				margin: (BlInsets right: 10);
				text: 'Status:';
				yourself);
		addChild: (MyUserStoryStatusButton new userStory: self; size: 20 @ 20;
				geometry: (BlRoundedRectangleGeometry cornerRadius: 10);
				label: 'status';
				aptitude: self aButtonCircularAptitude create + self aWithAllStatiDropdownAptitude;
				yourself).
	
	self announcer when: MyUserStoryStatusChange do: [ statusElement  ].	
			
	^ statusElement
]

{ #category : #accessing }
MyUserStory >> subItems [
 ^ OrderedCollection new
]

{ #category : #accessing }
MyUserStory >> tasks: anArray [
tasks := anArray do: [ :each | each notNil ifTrue: [each userStory: self]]
]

{ #category : #accessing }
MyUserStory >> teamMembersListForDropdown [
| dropdown |
dropdown := BlElement new
				layout: BlLinearLayout vertical;
				constraintsDo: [ :c | 
					c vertical fitContent.
					c horizontal fitContent ];
				padding: (BlInsets all: 5).
			(self getTeamMembers) collect: [:member | dropdown addChild: (BrButton new
				aptitude: BrGlamorousLabelAptitude;
				label: member name;
				action: [ (assignees includes: member) ifFalse:[assignees add: member. announcer announce: MyUserStoryStatusChange] ];
				yourself). ].
			^dropdown
]

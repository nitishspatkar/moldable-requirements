Class {
	#name : #MyUserStory,
	#superclass : #Object,
	#traits : 'TMyWithAcceptanceCriteria + TMyWithStatus',
	#classTraits : 'TMyWithAcceptanceCriteria classTrait + TMyWithStatus classTrait',
	#instVars : [
		'id',
		'description',
		'points',
		'scenarios',
		'references',
		'role',
		'means',
		'benefit',
		'epic',
		'assignees',
		'notes',
		'personas',
		'labels',
		'announcer',
		'tasks',
		'annotations'
	],
	#category : #'MyMoldableRequirements-User Story - Models'
}

{ #category : #accessing }
MyUserStory class >> fromRawData: userStoryDict [
	^ self
		id: (userStoryDict at: #id)
		role: (userStoryDict at: #role)
		means: (userStoryDict at: #means)
		benefit: (userStoryDict at: #benefit)
		acceptanceCriteria: (userStoryDict at: #acceptanceCriteria)
		status: (MyUserStatusOld fromString: (userStoryDict at: #status))
		points: (userStoryDict at: #points)
		scenarios:
			((userStoryDict at: #scenarios)
				collect: [ :scenariosDict | MyScenario fromRawData: scenariosDict ])
		personas: ((userStoryDict at: #personas)
				collect: [ :personasDict | MyPersona fromRawData: personasDict ])
		assignees: ((userStoryDict at: #assignees)
				collect: [ :assigneesDict | MyTeamMembers fromRawData: assigneesDict])
		labels: ((userStoryDict at: #labels)
				collect: [ :labelDict | MyLabelOld fromRawData: labelDict])
		tasks: 
		((userStoryDict at: #tasks)
		collect: [:taskDict | MyTaskOld fromRawData: taskDict])
		notes: ((userStoryDict at: #notes) collect: [:notesDict | MyNote fromRawData: notesDict])
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
MyUserStory >> aWithAllTeamMembersDropdownAptitude [
	"returns a dropdown of all team members"

	^ BrGlamorousWithDropdownAptitude
		handle: [ BrButton new
				aptitude: BrGlamorousButtonRectangularAptitude + BrGlamorousButtonIconAptitude;
				icon: BrGlamorousIcons add ]
		content: [ self teamMembersListForDropdown ]
]

{ #category : #accessing }
MyUserStory >> addNoteDropdownAptitude [
^ BrGlamorousWithDropdownAptitude 
	handle: [BrButton new
				aptitude: BrGlamorousButtonRectangularAptitude + BrGlamorousButtonIconAptitude;
				icon: BrGlamorousIcons add
	]
	content: [ | note |
			note := MyNote
				id: nil
				description: ''
				author: ''.
			note asFormElement: [ notes addNote: note ]]
]

{ #category : #accessing }
MyUserStory >> addTaskDropdownAptitude [
	^ BrGlamorousWithDropdownAptitude 
	handle: [BrButton new
				aptitude: BrGlamorousButtonRectangularAptitude + BrGlamorousButtonIconAptitude;
				icon: BrGlamorousIcons add
	]
	content: [ | task |
			task := MyTaskOld
				id: nil
				description: ''
				done: 'false'
				end: '01.01.2021'
				assignees: OrderedCollection new.
				task userStory: self.
			task asFormElement: [ tasks addTask: task ]].
]

{ #category : #accessing }
MyUserStory >> allStati [
	"returns an orderedCollection of stati"
	
	^ MyUserStatusOld allSubclasses collect: [ :eachStatusClass | eachStatusClass new ]
]

{ #category : #'api - annotations' }
MyUserStory >> annotations [
	^ annotations ifNil: [ annotations := self createAnnotations ]
]

{ #category : #'api - announcer' }
MyUserStory >> announce: anAnnouncement [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#announceTemplate'>
	announcer ifNotNil: [ :anAnnouncer | anAnnouncer announce: anAnnouncement ]
]

{ #category : #accessing }
MyUserStory >> announcer [
^announcer
]

{ #category : #'private - instance creation' }
MyUserStory >> asDetailedStoryCard [
	"Returns a bloc element that renders a card"
	| task taskDescription notesContainer card assigned |

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

	card addChild: (MyUserStoryElement new userStoryModel: self).

	"checklist"
	task := BlElement new
		layout: BlLinearLayout vertical alignCenterLeft;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
	task addChild: self checklistContainerWithDropdown.

	"makes tasklist for checklist"
	tasks tasks
		collect: [ :aTask | 
			taskDescription := aTask getTaskDescription: aTask.
			task addChild: taskDescription ].
	card addChild: task.

	"notes"
	notesContainer := self notesContainerWithDropdown.
	card addChild: notesContainer.
	notes notes
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
	labels labels
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
						epic ifNotNil: [ :anEpic | anEpic announcer announce: (MyUserStoryStatusChanged new) ].
								aBlock value
					"The following line means that when we click the save button, the arguement i.e., aBlock is evaluated" ];
				yourself);
		yourself
]

{ #category : #accessing }
MyUserStory >> asMinimalStoryCard [
	| card labelContainer storyContainer assigneesContainer cardLeft cardRight statusContainer |
	card := BlElement new
		layout: BlLinearLayout horizontal;
		geometry: (BlRoundedRectangleGeometry cornerRadius: 10);
		margin: (BlInsets all: 10);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent.
			 ].
	
	cardLeft := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent.
			 ].
	
	cardRight := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical matchParent.
			 ].
		
	labelContainer := BrButton new
		layout: BlFlowLayout horizontal;
		margin: (BlInsets bottom: 20);
		action: [:button | button phlow spawnObject: labels];
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent.
			 ].
	labels labels collect: [ :each | labelContainer addChild: each asLabel].
	
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
				
	statusContainer := BrLabel new
		aptitude: BrGlamorousLabelAptitude;
		beNormalSize;
		text: 'Status: ';
		addChild: (BlElement new
			geometry: BlCircle new;
			size: 20@20;
			margin: (BlInsets left: 5);
			border: (BlBorder paint: Color lightGray width: 1);
			background: self statusColor).
	
	assigneesContainer := BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent.
			 ]. 
			 
	assignees collect: [ :each | assigneesContainer addChild: (BrButton new
		layout: (BlLinearLayout horizontal) alignBottomRight;
		size: 20@20;
		geometry: (BlCircle new);
		background: Color palePeach;
		margin: (BlInsets right: 2);
		id: #'spawn-assignees';
		action: [:button | button phlow spawnObject: assignees];
		addChild: (BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				beLargeSize;
				alignCenter;
				text: each shorthand;
				beTinySize;
				yourself);
		aptitude: BrShadowAptitude;
		constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical matchParent ];
		padding: (BlInsets all: 5);
		yourself )].
	
	cardLeft addChild: labelContainer.
	cardLeft addChild: storyContainer.
	cardLeft addChild: statusContainer.
	cardRight addChild: assigneesContainer.
	card addChild: cardLeft.
	card addChild: cardRight.
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
				yourself);
						addChild: (BrButton new 
						aptitude: BrGlamorousButtonWithIconAptitude + self removeAssigneeDropdownAptitude;
						icon: BrGlamorousVectorIcons remove;
						margin: (BlInsets top: 20 left: 0 bottom: 5 right: 0);
						beTinySize;
						label: 'Remove a Team Member').
]

{ #category : #accessing }
MyUserStory >> assigneeListForDropdown [
| dropdown |
dropdown := BlElement new
				layout: BlLinearLayout vertical;
				constraintsDo: [ :c | 
					c vertical fitContent.
					c horizontal fitContent ];
				padding: (BlInsets all: 5).
			(self assignees) collect: [:assign | dropdown addChild: (BrButton new
				aptitude: BrGlamorousLabelAptitude;
				label: 'Remove this assignee: "', assign name, '"';
				action: [ assignees remove: assign. announcer announce: MyUserStoryStatusChanged ];
				yourself). ].
			^dropdown
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
						label: 'Add a Task');
						addChild: (BrButton new 
						aptitude: BrGlamorousButtonWithIconAptitude + self removeTaskDropdownAptitude;
						icon: BrGlamorousVectorIcons remove;
						margin: (BlInsets top: 20 left: 0 bottom: 5 right: 0);
						beTinySize;
						label: 'Remove a Task').
]

{ #category : #'private - instance creation' }
MyUserStory >> createAnnotations [
	^ MyUserStoryAnnotations new
]

{ #category : #'private - instance creation' }
MyUserStory >> createLabels [
	"Create a nested child object for a domain child (or children) and return the result"
	<return: #MyLabels>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForOneTemplate>>#createChildObjectsTemplate'>
	| childObject |

	childObject := MyLabels new.
	childObject parentUserStory: self.
	childObject labels: self userStory notes.
	^ childObject
]

{ #category : #'private - instance creation' }
MyUserStory >> createNotes [
	"Create a nested child object for a domain child (or children) and return the result"
	<return: #MyNotes>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForOneTemplate>>#createChildObjectsTemplate'>
	| childObject |

	childObject := MyNotes new.
	childObject parentUserStory: self.
	childObject notes: self userStory notes.
	^ childObject
]

{ #category : #'private - instance creation' }
MyUserStory >> createTasks [
	"Create a nested child object for a domain child (or children) and return the result"
	<return: #MyTasks>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForOneTemplate>>#createChildObjectsTemplate'>
	| childObject |

	childObject := MyTasks new.
	childObject parentUserStory: self.
	childObject tasks: self userStory notes.
	^ childObject
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
		ifTrue: [ description := 'As a ' , role , ', I want ' , means, '.' ]
		ifFalse: [ description := 'As a ' , role , ', I want ' , means , ' so that '
				, benefit, '.' ]).
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
^self epic project labels labels
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

{ #category : #'gt-extentions' }
MyUserStory >> gtAnnotationsFor: aView [
	<gtView>

	^ aView list
		priority: 5;
		title: 'Annotations';
		items: [ self annotations userStoryAnnotations ];
		updateWhen: MyUserStoryAnnotationAddedAnnouncement, MyUserStoryAnnotationRemovedAnnouncement in: self annotations
]

{ #category : #'gt-extentions' }
MyUserStory >> gtDescriptionFor: aView [
	<gtView>

	^ aView explicit
		title: 'Domain concepts';
		priority: 5;
		stencil: [ MyUserStoryAnnotatingElement new userStory: self ]
]

{ #category : #'gt-extentions' }
MyUserStory >> gtDetailedStoryCardFor: aView [
	<gtView>
	^aView explicit
		title: 'Story card';
		priority: 1;
		stencil: [
			self asDetailedStoryCard
				aptitude: BrShadowAptitude;
				background: Color white;
				padding: (BlInsets all: 5);
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical fitContent ];
				yourself ]
]

{ #category : #'gt-extentions' }
MyUserStory >> gtLabelsListViewFor: aView [
	<gtView>
	<generatedFrom: #'GtRobocoderMetamodelPhlowListViewDerive>>#listForOneTemplate'>

	^ aView list
		priority: 5;
		title: 'Labels';
		items: [ self labels labels ]
]

{ #category : #'gt-extentions' }
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

{ #category : #'gt-extentions' }
MyUserStory >> gtNotesListViewFor: aView [
	<gtView>
	<generatedFrom: #'GtRobocoderMetamodelPhlowListViewDerive>>#listForOneTemplate'>

	^ aView list
		priority: 5;
		title: 'Notes';
		items: [ self notes notes ]
]

{ #category : #'gt-extentions' }
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

{ #category : #'gt-extentions' }
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

{ #category : #'gt-extentions' }
MyUserStory >> gtTasksListViewFor: aView [
	<gtView>
	<generatedFrom: #'GtRobocoderMetamodelPhlowListViewDerive>>#listForOneTemplate'>

	^ aView list
		priority: 5;
		title: 'Tasks';
		items: [ self tasks tasks ]
]

{ #category : #accessing }
MyUserStory >> id: aString [
	id := aString
]

{ #category : #initialization }
MyUserStory >> initialize [
	super initialize.

	announcer :=  Announcer new.

	status := MyUserStatusNotStarted new.
	acceptanceCriteria := ''.
	description := ''.
	role := 'user'.
	means := 'to achieve'.
	benefit := ''.

	notes := MyNotes new.
	tasks := MyTasks new.
	labels := MyLabels new
]

{ #category : #testing }
MyUserStory >> isDone [
	^ self status isDone
]

{ #category : #testing }
MyUserStory >> isInProgress [
	^ self status isInProgress
]

{ #category : #'api - testing' }
MyUserStory >> isLabel [
	"Return true if the receiver represents Label, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
MyUserStory >> isLabels [
	"Return true if the receiver represents Labels, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
MyUserStory >> isNote [
	"Return true if the receiver represents Note, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
MyUserStory >> isNotes [
	"Return true if the receiver represents Notes, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
MyUserStory >> isTask [
	"Return true if the receiver represents Task, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
MyUserStory >> isTasks [
	"Return true if the receiver represents Tasks, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
MyUserStory >> isUserStory [
	"Return true if the receiver represents UserStory, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ true
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
				action: [ (labels includesLabel: label) ifFalse:[labels addLabel: label. announcer announce: MyUserStoryStatusChanged] ];
				yourself). ].
			^dropdown
]

{ #category : #accessing }
MyUserStory >> labelListForRemoveDropdown [
| dropdown |
dropdown := BlElement new
				layout: BlLinearLayout vertical;
				constraintsDo: [ :c | 
					c vertical fitContent.
					c horizontal fitContent ];
				padding: (BlInsets all: 5).
			(self labels labels) collect: [:label | dropdown addChild: (BrButton new
				aptitude: BrGlamorousLabelAptitude;
				label: 'Remove this label: "', label description, '"';
				action: [ labels removeLabel: label. announcer announce: MyUserStoryStatusChanged ];
				yourself). ].
			^dropdown
]

{ #category : #'api - accessing' }
MyUserStory >> labels [
	"Return a composite object (${class:nil}$) created for a collection of children from the domain model.
	Note: The object is lazily instantiated."
	<return: #MyLabels>
	<childObjectGetter: #labels>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForOneTemplate>>#childObjectsTemplate'>

	^ labels ifNil: [ labels := self createLabels ]
]

{ #category : #accessing }
MyUserStory >> labels: anArray [
	labels labels: anArray asOrderedCollection
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
				yourself);
						addChild: (BrButton new 
						aptitude: BrGlamorousButtonWithIconAptitude + self removeLabelDropdownAptitude;
						icon: BrGlamorousVectorIcons remove;
						margin: (BlInsets top: 20 left: 0 bottom: 5 right: 0);
						beTinySize;
						label: 'Remove a Label').
]

{ #category : #accessing }
MyUserStory >> means: aString [
"the part of a user story after 'I want' "
 means := aString
]

{ #category : #accessing }
MyUserStory >> notes [
	<return: #MyNotes>

	^ notes
]

{ #category : #accessing }
MyUserStory >> notes: anArray [
	notes notes: (anArray select: #notNil) asOrderedCollection
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
						label: 'Add a Note');
						addChild: (BrButton new 
						aptitude: BrGlamorousButtonWithIconAptitude + self removeNoteDropdownAptitude;
						icon: BrGlamorousVectorIcons remove;
						margin: (BlInsets top: 20 left: 0 bottom: 5 right: 0);
						beTinySize;
						label: 'Remove a Note').
]

{ #category : #accessing }
MyUserStory >> notesListForDropdown [
| dropdown |
dropdown := BlElement new
				layout: BlLinearLayout vertical;
				constraintsDo: [ :c | 
					c vertical fitContent.
					c horizontal fitContent ];
				padding: (BlInsets all: 5).
			(self notes) collect: [:note | dropdown addChild: (BrButton new
				aptitude: BrGlamorousLabelAptitude;
				label: 'Remove this note: "', note description, '"';
				action: [ notes remove: note. announcer announce: MyUserStoryStatusChanged ];
				yourself). ].
			^dropdown
]

{ #category : #'api - acceptance criteria' }
MyUserStory >> notifyAcceptanceCriteriaChanged [
	"Override this notify method to announce changes to the property"
	<propertyChangeNotifier: #acceptanceCriteria>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#notifyPropertyChangedTemplate'>
	
	self announcer announce: MyUserStoryAcceptanceCriteriaChanged new
]

{ #category : #'api - status' }
MyUserStory >> notifyStatusChanged [
	"Override this notify method to announce changes to the property"
	<propertyChangeNotifier: #status>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#notifyPropertyChangedTemplate'>
	
	epic ifNotNil: [ :anEpic | anEpic announcer announce: (MyUserStoryStatusChanged new) ].
	self announcer announce: (MyUserStoryStatusChanged new)
]

{ #category : #'api - accessing' }
MyUserStory >> objectName [
	"Return a symbolic name of the receiver which helps to create various type based mappings.
	Note: The symbolic name of the object is the exact name that was used
	in the metamodel declaration from which this class was generated"
	<return: #Symbol>
	<generatedFrom: #'GtRobocoderMetamodelNameDerive>>#objectNameTemplate'>

	^ #userStory
]

{ #category : #accessing }
MyUserStory >> parseStory [
	| aPRDocument |
	aPRDocument := GtDocumenterParser new parse: self description.
	^ aPRDocument
]

{ #category : #accessing }
MyUserStory >> personaLabelAndDropdown [
	^ BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ];
		addChild:
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				beLargeSize;
				margin:
					(BlInsets
						top: 20
						left: 0
						bottom: 5
						right: 20);
				text: 'Personas:';
				yourself);
		addChild:
			(BrButton new
				label: 'Add a Persona';
				aptitude:
					BrGlamorousButtonWithIconAptitude
						+ self aWithAllPersonasDropdownAptitude;
				icon: BrGlamorousVectorIcons add;
				margin:
					(BlInsets
						top: 20
						left: 0
						bottom: 5
						right: 0);
				beTinySize;
				yourself);
		addChild:
			(BrButton new
				aptitude:
					BrGlamorousButtonWithIconAptitude
						+ self removePersonaDropdownAptitude;
				icon: BrGlamorousVectorIcons remove;
				margin:
					(BlInsets
						top: 20
						left: 0
						bottom: 5
						right: 0);
				beTinySize;
				label: 'Remove a Persona')
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
				action: [ (personas includes: person) ifFalse:[personas add: person. announcer announce: MyUserStoryStatusChanged] ];
				yourself). ].
			^dropdown
]

{ #category : #accessing }
MyUserStory >> personaListForRemoveDropdown [
| dropdown |
dropdown := BlElement new
				layout: BlLinearLayout vertical;
				constraintsDo: [ :c | 
					c vertical fitContent.
					c horizontal fitContent ];
				padding: (BlInsets all: 5).
			(self personas) collect: [:person | dropdown addChild: (BrButton new
				aptitude: BrGlamorousLabelAptitude;
				label: 'Remove this persona: "', person name, '"';
				action: [ personas remove: person. announcer announce: MyUserStoryStatusChanged ];
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

{ #category : #printing }
MyUserStory >> printOn: aStream [
	<generatedFrom: #'GtRobocoderMetamodelPrintDerive>>#printOnTemplate'>

	aStream print: self description
]

{ #category : #accessing }
MyUserStory >> removeAssigneeDropdownAptitude [
^ BrGlamorousWithDropdownAptitude 
	handle: [BrButton new
				aptitude: BrGlamorousButtonRectangularAptitude + BrGlamorousButtonIconAptitude;
				icon: BrGlamorousIcons remove
	]
	content: [ self assigneeListForDropdown]
]

{ #category : #accessing }
MyUserStory >> removeLabelDropdownAptitude [
^ BrGlamorousWithDropdownAptitude 
	handle: [BrButton new
				aptitude: BrGlamorousButtonRectangularAptitude + BrGlamorousButtonIconAptitude;
				icon: BrGlamorousIcons remove
	]
	content: [ self labelListForRemoveDropdown]
]

{ #category : #accessing }
MyUserStory >> removeNoteDropdownAptitude [
^ BrGlamorousWithDropdownAptitude 
	handle: [BrButton new
				aptitude: BrGlamorousButtonRectangularAptitude + BrGlamorousButtonIconAptitude;
				icon: BrGlamorousIcons remove
	]
	content: [ self notesListForDropdown]
]

{ #category : #accessing }
MyUserStory >> removePersonaDropdownAptitude [
^ BrGlamorousWithDropdownAptitude 
	handle: [BrButton new
				aptitude: BrGlamorousButtonRectangularAptitude + BrGlamorousButtonIconAptitude;
				icon: BrGlamorousIcons remove
	]
	content: [ self personaListForRemoveDropdown]
]

{ #category : #accessing }
MyUserStory >> removeTaskDropdownAptitude [
^ BrGlamorousWithDropdownAptitude 
	handle: [BrButton new
				aptitude: BrGlamorousButtonRectangularAptitude + BrGlamorousButtonIconAptitude;
				icon: BrGlamorousIcons remove
	]
	content: [ self taskListForDropdown]
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

{ #category : #'api - status' }
MyUserStory >> status [
	<return: #MyUserStatusOld>
	<propertyGetter: #status>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#propertyGetterTemplate'>

	^ status
]

{ #category : #accessing }
MyUserStory >> statusColor [
	^ status statusColor
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
		addChild: (MyUserStoryStatusButton new
				userStoryModel: self;
				yourself).
	
	self announcer when: MyUserStoryStatusChanged do: [ statusElement  ].	
			
	^ statusElement
]

{ #category : #accessing }
MyUserStory >> subItems [
 ^ OrderedCollection new
]

{ #category : #accessing }
MyUserStory >> taskListForDropdown [
| dropdown |
dropdown := BlElement new
				layout: BlLinearLayout vertical;
				constraintsDo: [ :c | 
					c vertical fitContent.
					c horizontal fitContent ];
				padding: (BlInsets all: 5).
			(self tasks tasks) collect: [:task | dropdown addChild: (BrButton new
				aptitude: BrGlamorousLabelAptitude;
				label: 'Remove this task: "', task description, '"';
				action: [ tasks removeTask: task. announcer announce: MyUserStoryStatusChanged ];
				yourself). ].
			^dropdown
]

{ #category : #'api - accessing' }
MyUserStory >> tasks [
	"Return a composite object (${class:nil}$) created for a collection of children from the domain model.
	Note: The object is lazily instantiated."
	<return: #MyTasks>
	<childObjectGetter: #tasks>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForOneTemplate>>#childObjectsTemplate'>

	^ tasks ifNil: [ tasks := self createTasks ]
]

{ #category : #accessing }
MyUserStory >> tasks: anArray [
	tasks tasks: (anArray select: #notNil) asOrderedCollection
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
				action: [ (assignees includes: member) ifFalse:[assignees add: member. announcer announce: MyUserStoryStatusChanged] ];
				yourself). ].
			^dropdown
]

{ #category : #'api - announcer' }
MyUserStory >> unsubscribe: anObject [
	"Unsubscribe all subscriptions of anObject from the receiver"

	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#unsubscribeTemplate'>
	^ announcer ifNotNil: [ :anAnnouncer | anAnnouncer unsubscribe: anObject ]
]

{ #category : #'api - announcer' }
MyUserStory >> when: anAnnouncementClass do: aBlock [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenDoTemplate'>
	(announcer ifNil: [ announcer := Announcer new ])
		when: anAnnouncementClass do: aBlock
]

{ #category : #'api - announcer' }
MyUserStory >> when: anAnnouncementClass send: aSelector to: anObject [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenSendToTemplate'>
	(announcer ifNil: [ announcer := Announcer new ]) weak
		when: anAnnouncementClass send: aSelector to: anObject
]

Class {
	#name : #EUseCaseAdditionMenu,
	#superclass : #EReqArtifactAdditionMenu,
	#instVars : [
		'titleAdditionElement',
		'taskAdditionElement',
		'actorDropdown',
		'selectedActor'
	],
	#category : #'Epic-Model'
}

{ #category : #helper }
EUseCaseAdditionMenu >> getActors [
	^reqContainer getActors
]

{ #category : #initialization }
EUseCaseAdditionMenu >> initialize [ 
	super initialize.
	titleAdditionElement := self initializeTitleAdditionElement.
	taskAdditionElement := self initializeTaskAdditionElement.
	actorDropdown := self initializeActorAdditionDropdown.
	
	self addChild: (self titleFor: 'Add/Edit Use Case').
	self addChild: titleAdditionElement.
	self addChild: taskAdditionElement.
	self addChild: actorDropdown.
	self addChild: self createButtonBar.
]

{ #category : #initialization }
EUseCaseAdditionMenu >> initializeActorAdditionDropdown [
	"I create and return a dropdown toggle button for adding artifacts in the Mind Map view"
	| dropdownAptitude |
	^ self toggleButton
		margin: (BlInsets top: 15 left: 15 bottom: 0 right: 0);
		padding: (BlInsets all: 3);
		aptitude:
			BrGlamorousButtonWithLabelAndIconAptitude
				+
					(dropdownAptitude := BrGlamorousWithDropdownAptitude
						handle: [ self toggleButton
								aptitude:
									BrGlamorousButtonWithLabelAndIconAptitude - BrGlamorousButtonExteriorAptitude;
								yourself ]
						content: [ self popupActorList 
							addShortcut:
								(BlShortcut new
								combination: BlKeyCombination builder return build;
								action: [ dropdownAptitude hide ]).
								]);
		label: 'Add Actor';
		relocate: 200 @ 100;
		yourself
]

{ #category : #initialization }
EUseCaseAdditionMenu >> initializeTaskAdditionElement [
	|container taskLabel aDocument textElement taskText |
	container:= BlElement new 
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].

	taskLabel:= self blLabelFor: 'Task: '.
	
	editedArtifact ifNotNil: [ taskText := editedArtifact task ] ifNil: [ taskText := ('What is my task?') ].
	
	aDocument := GtDocument new.
	aDocument editor useSyncStylerStrategy.
	aDocument text: taskText.
	textElement := aDocument asElementWithoutSaveAction
			vFitContent;
			hMatchParent.
	textElement	
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 2);
		margin: (BlInsets top: 15 left: 15 bottom: 0 right: 0);
		padding: (BlInsets all: 3);
		geometry: (BlRectangle cornerRadius: 5).
	
		
	container addChild: taskLabel.		
	container addChild: textElement.		
	
	^ container.	
]

{ #category : #initialization }
EUseCaseAdditionMenu >> initializeTitleAdditionElement [
	|container titleLabel aDocument textElement titleText |
	container:= BlElement new 
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].

	titleLabel:= self blLabelFor: 'Title: '.
	
	editedArtifact ifNotNil: [ titleText := editedArtifact title ] ifNil: [ titleText := ('Give me a title') ].
	
	aDocument := GtDocument new.
	aDocument editor useSyncStylerStrategy.
	aDocument text: titleText.
	textElement := aDocument asElementWithoutSaveAction
			vFitContent;
			hMatchParent.
	textElement	
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 2);
		margin: (BlInsets top: 15 left: 15 bottom: 0 right: 0);
		padding: (BlInsets all: 3);
		geometry: (BlRectangle cornerRadius: 5).
	
		
	container addChild: titleLabel.		
	container addChild: textElement.		
	
	^ container.	
]

{ #category : #ui }
EUseCaseAdditionMenu >> popupActorList [
	| actorList |
	actorList := BrSimpleList new.
	actorList
		aptitudeDo: [ :aAptitude | aAptitude listElement constraintsDo: [ :c | c maxHeight: 200 ] ];
		layout: BlLinearLayout vertical;
		padding: (BlInsets all: 5);
		vFitContent;
		hExact: 200;
		stencil: [ :each :index | 
			BlTextElement new
				text: each asRopedText;
				constraintsDo: [ :c | c horizontal matchParent ];
				padding: (BlInsets all: 5);
				when: BlClickEvent
					do: [ :anEvent | 
					actorList selectOne: index.
					selectedActor := each.
					]
				];
		addShortcut:
			(BlShortcut new
				combination: BlKeyCombination builder return build;
				action: [  
					self initializeActorAdditionDropdown aptitude hide 
					]);
		fitContent;
		items: self getActors.
	^actorList
]

{ #category : #'morphic ui' }
EUseCaseAdditionMenu >> saveChanges [
	| title task useCase |
	self inform: 'Clicked save button.'.
	title := ((titleAdditionElement children at:2) document text) asString.
	task := ((taskAdditionElement children at:2) document text) asString.
	editedArtifact ifNotNil: [ 
		editedArtifact title: title.
		editedArtifact task: task.
		 ] ifNil: [ 
		useCase := (EUseCase new title: title; task: task; addActor: (EActor new name: selectedActor)).
		reqContainer addArtifact: useCase.
		 ].
	parentArtifact ifNotNil: [ parentArtifact addUseCase: useCase ].
	reqContainer announcer announce: ERequirementStateChangedAnnouncement.
]

{ #category : #'instance creation' }
EUseCaseAdditionMenu >> toggleButton [
	^ BrButton new
		label: 'Add Actor';
		icon:
			(BlElement new
				size: 8 @ 8;
				geometry:
					(BlPolygon
						vertices:
							{(0 @ 0).
							(8 @ 0).
							((8 / 2) rounded @ 8)});
				background: Color lightGray;
				margin: (BlInsets left: 6);
				constraintsDo: [ :c | c linear vertical alignCenter ]);
		yourself
]

"
I represent a container for the requirements of a given project. I am the starting point for managing the requirements.

I store a variety of requirements artifacts, as stated in my ""View Details"" view.
My instances implement views for visualizing and managing requirements. These are ""Mind Map"" and ""Story Wall"".
In the ""Mind Map"" one can add, remove and edit requirements, and display them in a cluster view.
the ""Story Wall"" view displays the user stories of the container in a status board. One can change the work states of the stories to indicate what progress is being made.

I interact with the artifacts from the container, as well as the creation menus for them.

Example instance:

ERequirementContainer new 
	project: 'My New App'.

"
Class {
	#name : #ERequirementContainer,
	#superclass : #Object,
	#instVars : [
		'project',
		'requirements',
		'announcer',
		'theGraph',
		'graphPane',
		'theGraphContainer'
	],
	#category : #'Epic-Model'
}

{ #category : #adding }
ERequirementContainer >> addArtifact: anArtifact [
	"I add an artifact to my requirement collection.
	Any children of the artifact are added as well.
	Finally, an announcement is sent to update the views"
	requirements add: anArtifact.
	self addArtifactChildren: anArtifact.
	self announcer announce: ERequirementStateChangedAnnouncement.
]

{ #category : #adding }
ERequirementContainer >> addArtifactChildren: anArtifact [
	"I execute this whenever an artifact is added to my container. 
	This ensures that all of the artifact's subelements are added as well"
	| children |
	children := anArtifact children.
	children do: [ :each | self addArtifact: each ].
]

{ #category : #ui }
ERequirementContainer >> addSubElementLabelFor: anArtifact [
	"return a string of the supplied artifact's sub-element. Used for the addition button for new artifacts"
	| label artifactType |
	artifactType := anArtifact class.
	(artifactType = EEpic) ifTrue: [ label := 'Add Use Case' ].
	(artifactType = EUseCase) ifTrue: [ label := 'Add User Story' ].
	(artifactType = EUserStory) ifTrue: [ label := 'Add Scenario' ].
	^ label
]

{ #category : #accessing }
ERequirementContainer >> announcer [
	^announcer
]

{ #category : #ui }
ERequirementContainer >> buildButtonBar [
	"I build a button bar for manipulating the Mind Map view (zooming, resizing, refreshing the view)"
	| buttonBar |
	buttonBar := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ];
		layout: BlLinearLayout horizontal;
		yourself.
	
	buttonBar addChild: self createInfoButtonForMindMap.
	
	buttonBar
		addChild:
			(BlElement new
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent ];
				yourself).
	buttonBar
		addChild:
			(BrButton new
				aptitude: BrGlamorousButtonWithLabelAptitude;
				label: 'Add Epic';
				action: [ 
					graphPane removeChildren.
					graphPane addChild: (self createAddEpicMenu).
					]).
	buttonBar
		addChild:
			(BrButton new
				aptitude: BrGlamorousButtonWithIconAptitude;
				icon: BrGlamorousIcons zoomin;
				label: 'Zoom In';
				action: [ theGraph zoomIn ]).
	buttonBar
		addChild:
			(BrButton new
				aptitude: BrGlamorousButtonWithIconAptitude;
				icon: BrGlamorousIcons zoomout;
				label: 'Zoom Out';
				action: [ theGraph zoomOut ]).
	buttonBar
		addChild:
			(BrButton new
				aptitude: BrGlamorousButtonWithIconAptitude;
				icon: BrGlamorousIcons zoomtofit;
				label: 'Fit';
				action: [ theGraph zoomToFit ]).
	buttonBar
		addChild:
			(BrButton new
				aptitude: BrGlamorousButtonWithIconAptitude;
				icon: BrGlamorousIcons actualsize;
				label: 'Resize';
				action: [ theGraph zoomToActualSize ]).
	buttonBar
		addChild:
			(BrButton new
				aptitude: BrGlamorousButtonWithIconAptitude;
				icon: BrGlamorousVectorIcons refresh;
				label: 'Refresh';
				action: [ self announcer announce: ERequirementStateChangedAnnouncement ]).
	^ buttonBar
]

{ #category : #helper }
ERequirementContainer >> computeEpicColor: anEpic [
	"I compute and return a color based on the combined status of the epic's associated use cases"
	| useCases color r g b numberOfCases |
	r := 0. g := 0. b := 0.
	useCases := anEpic children.
	numberOfCases := useCases size.
	useCases do: [ :each | 
		r := r + (self computeUseCaseColor: each) red.
		g := g + (self computeUseCaseColor: each) green.
		b := b + (self computeUseCaseColor: each) blue.
		 ].
	(numberOfCases = 0) ifFalse: [ 
		r := r / numberOfCases.
		g := g / numberOfCases.
		b := b / numberOfCases.
		 ].
	color := Color r: r g: g b: b.
	^color
]

{ #category : #helper }
ERequirementContainer >> computeUseCaseColor: aUseCase [
	"I compute and return a color based on the combined status of the use case's associated user stories"
	| stories color r g b numberOfStories |
	r := 0. g := 0. b := 0.
	stories := aUseCase children.
	numberOfStories := stories size.
	stories do: [ :each | 
		r := r + each getStateColor red.
		g := g + each getStateColor green.
		b := b + each getStateColor blue.
		 ].
	(numberOfStories = 0) ifFalse: [ 
		r := r / numberOfStories.
		g := g / numberOfStories.
		b := b / numberOfStories.
		 ].
	color := Color r: r g: g b: b.
	^color
]

{ #category : #ui }
ERequirementContainer >> createAddEpicMenu [
	^EEpicAdditionMenu new initializeWithContainer: self.
]

{ #category : #ui }
ERequirementContainer >> createInfoButtonForMindMap [
	"I set up the Help button in the Mind Map view, that gives some info on the visualization dimensions."
	| button buttonContent nodeSizeInfoElement nodeColorInfoElement nodeOutlineColorInfoElement |
	buttonContent := BlElement new 
		background: Color white;
		layout: BlLinearLayout vertical;
		padding: (BlInsets left: 5 right: 5);
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent.
				];
		yourself.
								
	nodeSizeInfoElement := BlTextElement new 
		padding: (BlInsets top: 5 bottom: 5);
		text: ('Node size: implementation points associated with the element') asRopedText.
	
	nodeColorInfoElement := BlTextElement new 
		padding: (BlInsets top: 5 bottom: 5);
		text: ('Node color: work progress state (red -> yellow -> green)') asRopedText.
	
	nodeOutlineColorInfoElement := BlTextElement new 
		padding: (BlInsets top: 5 bottom: 5);
		text: ('Node outline color: artifact type') asRopedText.
	
	buttonContent addChild: nodeSizeInfoElement.
	buttonContent addChild: nodeColorInfoElement.
	buttonContent addChild: nodeOutlineColorInfoElement.
	
	button := BrButton new
		aptitude:
			BrGlamorousButtonWithIconAptitude
				+
					(BrGlamorousWithDropdownAptitude
						handle: [ BrButton new
								aptitude: BrGlamorousButtonRectangularAptitude + BrGlamorousButtonIconAptitude;
								icon: BrGlamorousIcons help;
								yourself ]
						content: [ buttonContent ]);
		icon: BrGlamorousIcons help;
		label: 'Help';
		yourself.
	^ button
]

{ #category : #ui }
ERequirementContainer >> generateAdditionMenuFor: anArtifact [
	"I return an addition menu for the child artifact of the supplied artifact."
	| menu artifactType |
	artifactType := anArtifact class.
	(artifactType = EEpic) ifTrue: [ menu := (EUseCaseAdditionMenu new initializeWithContainer: self andParent: anArtifact) ].
	(artifactType = EUseCase) ifTrue: [ (menu := EUserStoryAdditionMenu new initializeWithContainer: self andParent: anArtifact) ].
	(artifactType = EUserStory) ifTrue: [ (menu := EScenarioAdditionMenu new initializeWithContainer: self andParent: anArtifact) ].
	^menu
]

{ #category : #ui }
ERequirementContainer >> generateEditMenuFor: anArtifact [
	"I return an edit menu for the supplied artifact."
	| menu artifactType |
	artifactType := anArtifact class.
	(artifactType = EEpic) ifTrue: [ menu := (EEpicAdditionMenu new initializeWithContainer: self andElement: anArtifact) ].
	(artifactType = EUseCase) ifTrue: [ menu := (EUseCaseAdditionMenu new initializeWithContainer: self andElement: anArtifact) ].
	(artifactType = EUserStory) ifTrue: [ menu := (EUserStoryAdditionMenu new initializeWithContainer: self andElement: anArtifact) ].
	(artifactType = EScenario) ifTrue: [ menu := (EScenarioAdditionMenu new initializeWithContainer: self andElement: anArtifact) ].
	^menu
]

{ #category : #ui }
ERequirementContainer >> generateMindMapView [
	"I set up the complete Mind Map view in the container. This includes the buttons and the graph itself."
	graphPane := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
	
	theGraphContainer := (self gtMindMapFor: GtPhlowEmptyView new) asElementDo: [ :e | e ].
	theGraph := theGraphContainer children first.
	
	theGraphContainer 
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent.
			 ].
	
	graphPane addChild: self buildButtonBar.
	graphPane addChild: theGraphContainer.
	^ graphPane

]

{ #category : #ui }
ERequirementContainer >> generateStoryWallView [
	"I set up the Story Wall view of the container."
	| container wall buttonBar refreshButton column columnTitle stories workStates |
	
	stories := self getUserStories.
	stories do: [ :story | story announcer: self announcer ].
	
	container := BlElement new
		layout: BlLinearLayout vertical;
		padding: (BlInsets all: 2);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent.
			 ].
	
	buttonBar := BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent.
			 ].
	
	refreshButton := (BrButton new
		aptitude: BrGlamorousButtonWithIconAptitude;
				icon: BrGlamorousVectorIcons refresh;
				label: 'Refresh';
				action: [ self announcer announce: ERequirementStateChangedAnnouncement ]).
	
	wall := BlElement new
		layout: BlLinearLayout horizontal;
		padding: (BlInsets all: 5);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent.
			 ].
	
	workStates := { 'Not started'. 'In progress'. 'Complete' }.
	
	workStates do: [ :aState | 
		column := BlElement new 
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent.
			 ].
		
		columnTitle := BrLabel new
		text: aState;
		margin: (BlInsets top: 15 left: 15 bottom: 0 right: 0);
		padding: (BlInsets all: 3);
		geometry: (BlRectangle cornerRadius: 5);
		aptitude: (BrGlamorousLabelAptitude new glamorousRegularFontAndSize; fontSize: 20); 
		constraintsDo: [ :c | 
			c linear vertical alignCenter.
			c linear horizontal alignCenter ].
		
		column addChild: columnTitle.
		column addChildren: ((stories select: [ :story | story state = aState ]) collect: [ :story | story cardViewGenerate ]).
		wall addChild: column.
		 ].
	
	buttonBar addChild:
			(BlElement new
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent ];
				yourself).
				
	buttonBar addChild: refreshButton.
	container addChild: buttonBar.
	container addChild: wall.
	^container asScrollableElement
]

{ #category : #accessing }
ERequirementContainer >> getActors [
	"I get all the actors from the use cases in the container"
	| useCases actors |
	useCases := requirements select: [ :each | each class name = 'EUseCase' ].
	actors := OrderedCollection new.
	useCases do: [ :useCase | 
		useCase actor do: [ :actor | 
			(actors includes: actor) ifFalse: [ actors add: actor name ]
			]
		 ].
	^actors
]

{ #category : #accessing }
ERequirementContainer >> getEpics [
	"I collect and return an OrderedCollection of all the epics from the requirements collection."
	| epics |
	epics := self requirements select: [ :each | each class = EEpic ].
	^epics
]

{ #category : #accessing }
ERequirementContainer >> getScenarios [
	"I collect and return an OrderedCollection of all the scenarios from the requirements collection."
	| scenarios |
	scenarios := self requirements select: [ :each | each class = EScenario ].
	^scenarios
]

{ #category : #accessing }
ERequirementContainer >> getUseCases [
	"I collect and return an OrderedCollection of all the user stories from the requirements collection."
	| useCases |
	useCases := self requirements select: [ :each | each class = EUseCase ].
	^useCases
]

{ #category : #accessing }
ERequirementContainer >> getUserStories [
	"I collect and return an OrderedCollection of all the user stories from the requirements collection."
	| stories |
	stories := self requirements select: [ :each | each class = EUserStory ].
	^stories
]

{ #category : #ui }
ERequirementContainer >> gtDocumentFor: aView [
	<gtView>
	| aDocument |
	aDocument := GtDocument new
		text:
			'A ${class:name=ERequirementContainer}$ is an object which will hold all of the requirements artifacts for a specific project.

As of now, the supported artifact types are: 
	1. Epics: ${class:name=EEpic}$,
	2. Use cases: ${class:name=EUseCase}$,
	3. User Stories: ${class:name=EUserStory}$,
	4. Agile Scenarios: ${class:name=EScenario}$.

The Mind Map view provides an overview of all the artifacts currently contained within the project. The structure of the map is hierarchical, with the finer-grained artifacts being situated farther from the center of the map.
The Story Wall view features all user stories in the form of cards. With the click of a button their work status can be changed between not started/in progress/finished states.
'.
	^ (aDocument gtTextFor: aView)
		title: 'View Details';
		priority: 1
]

{ #category : #ui }
ERequirementContainer >> gtMindMapFor: aView [
	^ aView mondrian
		title: 'Tree View';
		priority: 50;
		updateWhen: ERequirementStateChangedAnnouncement in: [ self announcer ];
		painting: [ :aMondrian | self mindMapGenerateFor: aMondrian ]
		
]

{ #category : #ui }
ERequirementContainer >> gtTestViewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Mind Map';
		priority: 50;
		updateWhen: ERequirementStateChangedAnnouncement in: [ self announcer ];
		stencil: [ self generateMindMapView ].
]

{ #category : #accessing }
ERequirementContainer >> gtTreeFor: aView [
	<gtView>
	^ aView tree
		title: 'Requirements Tree' translated;
		priority: 2;
		items: [ self getEpics ];
		children: [ :each | each children ];
		itemText: [ :each | each treeViewShortString ]
]

{ #category : #ui }
ERequirementContainer >> gtUserStoryWallViewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Story Wall';
		priority: 50;
		updateWhen: ERequirementStateChangedAnnouncement in: [ self announcer ];
		stencil: [ self generateStoryWallView ].
]

{ #category : #initialization }
ERequirementContainer >> initialize [
	"I set up a collection to store the requirements artifacts, and an announces for updating the views automatically.
	Also, I add myself to the requirement reference finder."
	project := 'New project'.
	requirements := OrderedCollection new.
	announcer := Announcer new.
	RequirementRefFinder addContainer: self.
]

{ #category : #ui }
ERequirementContainer >> mindMapGenerate [
	"Generate a Mind Map graph for the gtMindMap view"
	"Relays to a different method to avoid lots of refactoring"
	^self mindMapGenerateFor: GtMondrian new.
]

{ #category : #ui }
ERequirementContainer >> mindMapGenerateFor: view [
	"Generate a Mind Map graph for the gtMindMap view"
	view nodes
		shape: [ :anArtifact |
			BlElement new
				aptitude: (self setUpTooltipAptitudeFor: anArtifact);
				size: (self nodeSizeFor: anArtifact) asPoint;
				border: (BlBorder 
					paint: (anArtifact nodeHighlightColor alpha: 0.8)  
					width: 2);
				background: (self nodeBackgroundColorFor: anArtifact);
				geometry: BlCircle new.
				 ];
		with: requirements.
	view edges connectFrom: [ :x | x ] toAll: [ :x | x children ].
	view edges
		shape: [ :x | 
			BlLineElement new
				border: (BlBorder paint: (Color red alpha: 0.5) width: 5) ].
	view layout force 
		strength: 0.15;
		charge: -250;
		length: 70.
	
	"custom: (GtGraphClusterLayout new horizontalGap: 80; verticalGap: 80)".
	^ view
]

{ #category : #ui }
ERequirementContainer >> nodeBackgroundColorFor: anArtifact [
	"I Compute and return the color of the artifact node's background for the mind map view"
	| color artifactType |
	color := Color blue.
	artifactType := anArtifact class.
	(artifactType = EEpic) ifTrue: [ 
		color := self computeEpicColor: anArtifact
		 ].
	(artifactType = EUseCase) ifTrue: [ 
		color := self computeUseCaseColor: anArtifact
		 ].
	(artifactType = EUserStory) ifTrue: [ color := anArtifact getStateColor ].
	(artifactType = EScenario) ifTrue: [ color := Color white ].
	
	^color alpha: 0.5
	

]

{ #category : #ui }
ERequirementContainer >> nodeHighlightColorFor: anArtifact [
	"I return a corresponding color for a requirement artifact for the outline of the nodes in the mind map view."
	| artifactType color |
	artifactType := anArtifact class.
	color := 
	(artifactType = EEpic) ifTrue: [ color := Color gray ].
	(artifactType = EUseCase) ifTrue: [ color := Color cyan ].
	(artifactType = EUserStory) ifTrue: [ color := Color blue ].
	(artifactType = EScenario) ifTrue: [ color := Color green ].
	(artifactType = EParametrizedExample) ifTrue: [ color := Color gray ].
	^ color alpha: 0.8
]

{ #category : #ui }
ERequirementContainer >> nodeSizeFor: anArtifact [
	"I return the size of the node that represents supplied artifact in the mind map view. 
	The size depends on the number of implementation points given to the user stories. Scenarios all have the same size."
	| artifactType size scale |
	size := 10.
	scale := GtPlotterLogarithmicScale new.
	artifactType := anArtifact class.
	(artifactType = EEpic) ifTrue: [ 
		anArtifact children do: [ :useCase | 
			useCase children do: [ :story | size := size + story points ]
			 ].
		 ].
	(artifactType = EUseCase) ifTrue: [ 
		anArtifact children do: [ :story | size := size + story points ].
		 ].
	(artifactType = EUserStory) ifTrue: [ size := 10 + anArtifact points ].
	(artifactType = EScenario) ifTrue: [ size := 10 ].
	size := (scale map: size) * 20.
	^ size
]

{ #category : #accessing }
ERequirementContainer >> printOn: aStream [
 	super printOn: aStream.
 	aStream  
 		nextPutAll: '(';
 		nextPutAll:  self project;
 		nextPutAll: ')'
]

{ #category : #accessing }
ERequirementContainer >> project [
	^project
]

{ #category : #accessing }
ERequirementContainer >> project: aString [
	"Project name, which will be associated with my container"
	project := aString.
]

{ #category : #removing }
ERequirementContainer >> removeArtifact: anArtifact [
	"I remove the specified artifact from my requirement collection.
	I ensure that any reference of the artifact is removed from any parent element.
	Also, I make sure the children of the artifact are removed.
	Finally, I announce a change in the state of the requirements, so that the requirement views may be updated"
	self removeFromParent: anArtifact.
	requirements remove: anArtifact.
	self removeArtifactChildren: anArtifact.
	self announcer announce: ERequirementStateChangedAnnouncement.
]

{ #category : #removing }
ERequirementContainer >> removeArtifactChildren: anArtifact [
	"I am executed whenever an artifact is removed from my container. 
	This ensures that all of the artifact's subelements are removed as well"
	| children |
	children := anArtifact children.
	children do: [ :each | self removeArtifact: each ].
]

{ #category : #removing }
ERequirementContainer >> removeFromParent: anArtifact [
	"I remove the supplied artifact from its parent's children list, in order to properly remove any reference of it."
	| artifactType |
	artifactType := anArtifact class.
	(artifactType = EUseCase) ifTrue: [ 
		self getEpics do: [ :each | (each children includes: anArtifact) ifTrue: [ each removeUseCase: anArtifact ]  ].
		 ].
	(artifactType = EUserStory) ifTrue: [ 
		self getUseCases do: [ :each | (each children includes: anArtifact) ifTrue: [ each removeUserStory: anArtifact ]  ].
		 ].
	(artifactType = EScenario) ifTrue: [ 
		self getUserStories do: [ :each | (each children includes: anArtifact) ifTrue: [ each removeScenario: anArtifact ]  ].
		 ].
]

{ #category : #accessing }
ERequirementContainer >> requirements [
 ^requirements
]

{ #category : #accessing }
ERequirementContainer >> requirements: aCollectionOfRequirements [
	"I work with a collection of requirement artifacts, in order to display them in my various views. The supported artifact types can be found in the 'View Details' view of my object."
	requirements := aCollectionOfRequirements.
]

{ #category : #ui }
ERequirementContainer >> setUpTooltipAptitudeFor: anArtifact [
	"I set up the custom tooltip object for the Mind Map view, depending on the supplied artifact"
	^  BrGlamorousWithTooltipAptitude
		handle: [ BlElement new
			constraintsDo: [ :c | 
				c vertical exact: 20.
				c horizontal exact: 20. ] ] 
		content: [
			| addSubElementButton editElementButton deleteElementButton tooltipText tooltipLabel tooltipButtonBar tooltipContainer  |
			
			
			addSubElementButton := (BrButton new
				aptitude: BrGlamorousButtonWithIconAptitude;
				icon: BrGlamorousIcons add;
				label: (self addSubElementLabelFor: anArtifact);
				action: [ 
					graphPane removeChildren.
					graphPane addChild: (self generateAdditionMenuFor: anArtifact).
					 ]).
	
	editElementButton := (BrButton new
				aptitude: BrGlamorousButtonWithIconAptitude;
				icon: BrGlamorousIcons edit;
				label: 'Edit';
				action: [ 
					graphPane removeChildren.
					graphPane addChild: (self generateEditMenuFor: anArtifact).
					 ]).
	
	deleteElementButton := (BrButton new
				aptitude: BrGlamorousButtonWithIconAptitude;
				icon: BrGlamorousIcons remove;
				label: 'Delete this artifact (WARNING: This will delete all sub-elements too!)';
				action: [ 
					self removeArtifact: anArtifact.
					self announcer announce: ERequirementStateChangedAnnouncement.
					 ]).
			
			
			tooltipText := ('An ', anArtifact class name, ': ', anArtifact title) asRopedText.
			
			tooltipLabel := (BrLabel new 
				aptitude: BrGlamorousLabelAptitude new glamorousRegularFontAndSize; 
				padding: (BlInsets all: 20); 
				alignCenter; 
				fitContent;
				text: tooltipText).
				
			tooltipButtonBar := BlElement new 
				layout: BlLinearLayout horizontal;
				constraintsDo: [ :c | 
					c vertical fitContent.
					c horizontal fitContent ].
			(anArtifact class = EScenario) ifFalse: [ 
				tooltipButtonBar addChild: addSubElementButton. ].
			tooltipButtonBar addChild: editElementButton.
			tooltipButtonBar addChild: deleteElementButton.
			
			tooltipContainer := BlElement new 
				layout: BlLinearLayout vertical;
				constraintsDo: [ :c | 
					c vertical fitContent.
					c horizontal fitContent ].
			tooltipContainer addChild: tooltipLabel.
	
			tooltipContainer addChild: tooltipButtonBar.
			tooltipContainer
	
		].
		
]

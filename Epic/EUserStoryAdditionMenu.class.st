Class {
	#name : #EUserStoryAdditionMenu,
	#superclass : #EReqArtifactAdditionMenu,
	#instVars : [
		'titleAdditionElement',
		'userAdditionElement',
		'actionAdditionElement',
		'goalAdditionElement',
		'descriptionAdditionElement',
		'criteriaAdditionElement',
		'pointsAdditionElement'
	],
	#category : #'Epic-Model'
}

{ #category : #initialization }
EUserStoryAdditionMenu >> initialize [
	super initialize.
	titleAdditionElement := self initializeTitleAdditionElement.
	userAdditionElement := self initializeUserAdditionElement.
	actionAdditionElement := self initializeActionAdditionElement.
	goalAdditionElement := self initializeGoalAdditionElement.
	descriptionAdditionElement := self initializeDescriptionAdditionElement.
	criteriaAdditionElement := self initializeCriteriaAdditionElement.
	pointsAdditionElement := self initializePointsAdditionElement.
	
	self addChild: (self titleFor: 'Add/Edit User Story').
	self addChild: titleAdditionElement.
	self addChild: userAdditionElement.
	self addChild: actionAdditionElement.
	self addChild: goalAdditionElement.
	self addChild: descriptionAdditionElement.
	self addChild: criteriaAdditionElement.
	self addChild: pointsAdditionElement.
	self addChild: self createButtonBar.
]

{ #category : #initialization }
EUserStoryAdditionMenu >> initializeActionAdditionElement [
	|container titleLabel aDocument textElement actionText |
	container:= BlElement new 
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].

	titleLabel:= self blLabelFor: 'Action: '.
	
	editedArtifact ifNotNil: [ actionText := editedArtifact action ] ifNil: [ actionText := ('What is the action in this story?') ].
	
	aDocument := GtDocument new.
	aDocument editor useSyncStylerStrategy.
	aDocument text: actionText.
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

{ #category : #initialization }
EUserStoryAdditionMenu >> initializeCriteriaAdditionElement [
	|container titleLabel aDocument textElement criteriaText |
	container:= BlElement new 
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].

	titleLabel:= self blLabelFor: 'Acceptance criteria: '.
	
	editedArtifact ifNotNil: [ criteriaText := editedArtifact acceptCriteria ] ifNil: [ criteriaText := ('What are the acceptance criteria of this story?') ].
	
	aDocument := GtDocument new.
	aDocument editor useSyncStylerStrategy.
	aDocument text: criteriaText.
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

{ #category : #initialization }
EUserStoryAdditionMenu >> initializeDescriptionAdditionElement [
	|container titleLabel aDocument textElement descrText |
	container:= BlElement new 
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].

	titleLabel:= self blLabelFor: 'Description '.
	
	editedArtifact ifNotNil: [ descrText := editedArtifact description ] ifNil: [ descrText := ('Describe the user story') ].
	
	aDocument := GtDocument new.
	aDocument editor useSyncStylerStrategy.
	aDocument text: descrText.
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

{ #category : #initialization }
EUserStoryAdditionMenu >> initializeGoalAdditionElement [
	|container titleLabel aDocument textElement goalText |
	container:= BlElement new 
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].

	titleLabel:= self blLabelFor: 'Goal: '.
	
	editedArtifact ifNotNil: [ goalText := editedArtifact goal ] ifNil: [ goalText := ('What is the goal in this story?') ].
	
	aDocument := GtDocument new.
	aDocument editor useSyncStylerStrategy.
	aDocument text: goalText.
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

{ #category : #initialization }
EUserStoryAdditionMenu >> initializePointsAdditionElement [
	|container titleLabel aDocument textElement pointsText |
	container:= BlElement new 
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].

	titleLabel:= self blLabelFor: 'Points: '.
	
	editedArtifact ifNotNil: [ pointsText := editedArtifact points asString ] ifNil: [ pointsText := ('0') ].
	
	aDocument := GtDocument new.
	aDocument editor useSyncStylerStrategy.
	aDocument editor inputFilter: BrTextEditorDigitInputFilter new.
	aDocument text: pointsText.
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

{ #category : #initialization }
EUserStoryAdditionMenu >> initializeTitleAdditionElement [
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

{ #category : #initialization }
EUserStoryAdditionMenu >> initializeUserAdditionElement [
	|container titleLabel aDocument textElement userText |
	container:= BlElement new 
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].

	titleLabel:= self blLabelFor: 'User: '.
	
	editedArtifact ifNotNil: [ userText := editedArtifact user ] ifNil: [ userText := ('Who is the user in this story?') ].
	
	aDocument := GtDocument new.
	aDocument editor useSyncStylerStrategy.
	aDocument text: userText.
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

{ #category : #'morphic ui' }
EUserStoryAdditionMenu >> saveChanges [
	| title user action goal description criteria points userStory |
	self inform: 'Clicked save button.'.
	title := ((titleAdditionElement children at:2) document text) asString.
	user := EActor new name: (((userAdditionElement children at:2) document text) asString).
	action := ((actionAdditionElement children at:2) document text) asString.
	goal := ((goalAdditionElement children at:2) document text) asString.
	description := ((descriptionAdditionElement children at:2) document text) asString.
	criteria := ((criteriaAdditionElement children at:2) document text) asString.
	points := (((pointsAdditionElement children at:2) document text) asString) asNumber.
	editedArtifact ifNotNil: [ 
		editedArtifact title: title; user: user; action: action; goal: goal; acceptCriteria: criteria; points: points.
		 ] ifNil: [ 
		userStory := (EUserStory new title: title; user: user; action: action; goal: goal; description: description; acceptCriteria: criteria; points: points).
		reqContainer addArtifact: userStory.
		 ].
	parentArtifact ifNotNil: [ parentArtifact addUserStory: userStory ].
	reqContainer announcer announce: ERequirementStateChangedAnnouncement.
]

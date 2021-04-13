Class {
	#name : #EEpicAdditionMenu,
	#superclass : #EReqArtifactAdditionMenu,
	#instVars : [
		'titleAdditionElement'
	],
	#category : #'Epic-Model'
}

{ #category : #initialization }
EEpicAdditionMenu >> initialize [
	super initialize.
	titleAdditionElement := self initializeTitleAdditionElement.
	
	self addChild: (self titleFor: 'Add/Edit Epic').
	self addChild: titleAdditionElement.
	self addChild: self createButtonBar.
]

{ #category : #initialization }
EEpicAdditionMenu >> initializeTitleAdditionElement [
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

{ #category : #'morphic ui' }
EEpicAdditionMenu >> saveChanges [
	| title |
	self inform: 'Clicked save button.'.
	title := ((titleAdditionElement children at:2) document text) asString.
	editedArtifact ifNotNil: [ editedArtifact title: title ] ifNil: [ reqContainer addArtifact: (EEpic new title: title) ].
	reqContainer announcer announce: ERequirementStateChangedAnnouncement.
]

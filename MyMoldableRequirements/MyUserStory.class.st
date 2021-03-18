Class {
	#name : #MyUserStory,
	#superclass : #Object,
	#instVars : [
		'id',
		'description',
		'status',
		'points',
		'scenarios',
		'references'
	],
	#category : #MyMoldableRequirements
}

{ #category : #accessing }
MyUserStory class >> fromRawData: userStoryDict [
	^ self
		id: (userStoryDict at: #id)
		status: (userStoryDict at: #status)
		description: (userStoryDict at: #description)
		points: (userStoryDict at: #points)
		scenarios:
			((userStoryDict at: #scenarios)
				collect: [ :scenariosDict | MyScenario fromRawData: scenariosDict ])
]

{ #category : #accessing }
MyUserStory class >> id: aString status: anotherString description: yetAnotherString points: aNumber scenarios: anArray [
	^ self new
		id: aString;
		status: anotherString;
		description: yetAnotherString;
		points: aNumber;
		scenarios: anArray asOrderedCollection;
		yourself
]

{ #category : #accessing }
MyUserStory >> asFormElement [
	"a user story presents itself as a form to be filled and save as an object"

	| label textElementDescription textElementStatus textElementPoints |
	textElementDescription := GtDocument new asElementWithoutSaveAction
		vFitContent;
		hMatchParent;
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 2);
		padding: (BlInsets all: 3);
		margin: (BlInsets top: 3 bottom: 3);
		geometry: (BlRectangle cornerRadius: 5).
	textElementStatus := GtDocument new asElementWithoutSaveAction
		vFitContent;
		hMatchParent;
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 2);
		padding: (BlInsets all: 3);
		margin: (BlInsets top: 3 bottom: 3);
		geometry: (BlRectangle cornerRadius: 5).
	textElementPoints := GtDocument new asElementWithoutSaveAction
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
				text: 'Description';
				yourself);
		addChild: textElementDescription;
		addChild:
			(BrLabel new
				look: BrGlamorousLabelLook;
				beLargeSize;
				text: 'Status';
				yourself);
		addChild: textElementStatus;
		addChild:
			(BrLabel new
				look: BrGlamorousLabelLook;
				beLargeSize;
				text: 'Points';
				yourself);
		addChild: textElementPoints;
		addChild:
			(BrButton new
				look: BrGlamorousButtonWithIconLook;
				icon: BrGlamorousVectorIcons accept;
				label: 'Save';
				action: [ description := textElementDescription text.
					status := textElementStatus text.
					points := textElementPoints text ];
				yourself);
		yourself
]

{ #category : #accessing }
MyUserStory >> asFormElement: aBlock [
	"a user story presents itself as a form to be filled and save as an object"

	| label textElementDescription textElementStatus textElementPoints |
	textElementDescription := GtDocument new asElementWithoutSaveAction
		vFitContent;
		hMatchParent;
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 2);
		padding: (BlInsets all: 3);
		margin: (BlInsets top: 3 bottom: 3);
		geometry: (BlRectangle cornerRadius: 5).
	textElementStatus := GtDocument new asElementWithoutSaveAction
		vFitContent;
		hMatchParent;
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 2);
		padding: (BlInsets all: 3);
		margin: (BlInsets top: 3 bottom: 3);
		geometry: (BlRectangle cornerRadius: 5).
	textElementPoints := GtDocument new asElementWithoutSaveAction
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
				text: 'Description';
				yourself);
		addChild: textElementDescription;
		addChild:
			(BrLabel new
				look: BrGlamorousLabelLook;
				beLargeSize;
				text: 'Status';
				yourself);
		addChild: textElementStatus;
		addChild:
			(BrLabel new
				look: BrGlamorousLabelLook;
				beLargeSize;
				text: 'Points';
				yourself);
		addChild: textElementPoints;
		addChild:
			(BrButton new
				look: BrGlamorousButtonWithIconLook;
				icon: BrGlamorousVectorIcons accept;
				label: 'Save';
				action: [ description := textElementDescription document text asString.
					status := textElementStatus document text asString.
					points := textElementPoints document text asString.
					"The following line means that when we click the save button, the arguement i.e., aBlock is evaluated"
					aBlock value ];
				yourself);
		yourself
]

{ #category : #accessing }
MyUserStory >> asStoryCard [
	"Returns a bloc element that renders a card"

	^ BlElement new
		layout: BlLinearLayout vertical;
		addChild:
			(BrEditableLabel new
				look: BrGlamorousEditableLabelLook new glamorousRegularFontAndSize;
				text: description;
				when: BrEditorAcceptWish
					do: [ :aWish | description := aWish text ];
				yourself);
		addChild:
			(BrEditableLabel new
				look: BrGlamorousEditableLabelLook new glamorousRegularFontAndSize;
				text: status;
				when: BrEditorAcceptWish
					do: [ :aWish | status := aWish text ];
				yourself);
		addChild:
			(BrEditableLabel new
				look: BrGlamorousEditableLabelLook new glamorousRegularFontAndSize;
				text: points;
				when: BrEditorAcceptWish
					do: [ :aWish | points := aWish text ];
				yourself);
		yourself
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
	^ description
]

{ #category : #accessing }
MyUserStory >> description: yetAnotherString [
	description := yetAnotherString
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
MyUserStory >> gtDescriptionFor: aView [
	<gtView>
	| document |
	document := GtDocument new text: self description.
	^ (document gtTextFor: aView)
		title: 'Description';
		actionButtonIcon: BrGlamorousVectorIcons accept
			label: 'Save'
			action: [ self description: document text asString
			"self announcer announce: ERequirementStateChangedAnnouncement new" ];
		"updateWhen: ERequirementStateChangedAnnouncement in: self announcer;"
			priority: 1
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
		priority: 1;
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
MyUserStory >> gtStoryCardFor: aView [
	<gtView>
	^ aView explicit
		title: 'Story card';
		priority: 1;
		stencil: [ self asStoryCard
				look: BrShadowLook;
				background: Color white;
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ];
				padding: (BlInsets all: 5);
				yourself ]
]

{ #category : #accessing }
MyUserStory >> id: aString [
	id := aString
]

{ #category : #accessing }
MyUserStory >> parseStory [
	| aPRDocument |
	aPRDocument := GtDocumenterParser new parse: self description.
	^ aPRDocument
]

{ #category : #accessing }
MyUserStory >> points: aNumber [
	points := aNumber
]

{ #category : #accessing }
MyUserStory >> printOn: aStream [
	aStream nextPutAll: description
]

{ #category : #accessing }
MyUserStory >> scenarios: anArray [
	scenarios := anArray
]

{ #category : #accessing }
MyUserStory >> status: anotherString [
	status := anotherString
]

{ #category : #accessing }
MyUserStory >> title: anotherString [ 
]

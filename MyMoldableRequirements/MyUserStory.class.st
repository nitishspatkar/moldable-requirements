Class {
	#name : #MyUserStory,
	#superclass : #Object,
	#instVars : [
		'id',
		'description',
		'status',
		'points',
		'scenarios'
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
MyUserStory >> description [
	^ description
]

{ #category : #accessing }
MyUserStory >> description: yetAnotherString [
	description := yetAnotherString
]

{ #category : #accessing }
MyUserStory >> gtScenariosFor: aView [
	<gtView>
	^ (scenarios gtItemsFor: aView)
		title: 'Scenarios with form';
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
MyUserStory >> gtViewScenarios: aView [
	<gtView>
	^ aView list
		title: 'Scenarios';
		priority: 3;
		items: [ scenarios ];
		itemText: [ :aScenario | aScenario description ]
]

{ #category : #accessing }
MyUserStory >> id: aString [
	id := aString
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
MyUserStory >> scenarios [
	^ scenarios
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

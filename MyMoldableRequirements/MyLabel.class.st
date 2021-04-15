Class {
	#name : #MyLabel,
	#superclass : #Object,
	#instVars : [
		'id',
		'description',
		'color',
		'project'
	],
	#category : #'MyMoldableRequirements-Models'
}

{ #category : #accessing }
MyLabel class >> fromRawData: labelDict [ 
^ self
	id: (labelDict at: #id)
	description: (labelDict at: #description)
	color: (labelDict at: #color)
]

{ #category : #accessing }
MyLabel class >> id: aNumber description: aString color: anotherString [ 
^ self new 
	id: aNumber;
	description: aString;
	color: anotherString
	yourself
]

{ #category : #accessing }
MyLabel >> asFormElement: aBlock [
	"a label presents itself as a form to be filled and save as an object"

	| label textElementDescription |
	textElementDescription := GtDocument new asElementWithoutSaveAction
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
				text: 'Label Description';
				yourself);
		addChild: textElementDescription;
		addChild:
			(BrButton new
				aptitude: BrGlamorousButtonWithIconAptitude;
				icon: BrGlamorousVectorIcons accept;
				label: 'Save';
				action: [ description := textElementDescription document text asString.
				project ifNotNil: [ :aProject | aProject announcer announce: (MyUserStoryStatusChange new) ].
					"The following line means that when we click the save button, the arguement i.e., aBlock is evaluated"
					aBlock value ];
				yourself);
		yourself
]

{ #category : #accessing }
MyLabel >> asLabel [
	^ BlTextElement new
		geometry: (BlRectangle cornerRadius: 6);
		layout: BlLinearLayout horizontal alignCenter;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		border: (BlBorder paint: (Color fromHexString: 'd9d9d9') width: 1);
		padding: (BlInsets all: 5);
		text: self description asRopedText;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ]
]

{ #category : #accessing }
MyLabel >> color [
^color
]

{ #category : #accessing }
MyLabel >> color: aString [
color := aString
]

{ #category : #accessing }
MyLabel >> description [
^description
]

{ #category : #accessing }
MyLabel >> description: aString [ 
description := aString
]

{ #category : #accessing }
MyLabel >> gtCircleViewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Label';
		priority: 0;
		stencil: [ self asLabel constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ] ]
]

{ #category : #accessing }
MyLabel >> id: aNumber [ 
id := aNumber
]

{ #category : #accessing }
MyLabel >> printOn: aStream [
	aStream nextPutAll: description
]

{ #category : #accessing }
MyLabel >> project [
^project
]

{ #category : #accessing }
MyLabel >> project: aProject [
project := aProject
]

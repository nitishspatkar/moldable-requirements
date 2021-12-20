Class {
	#name : #MyLabelOld,
	#superclass : #Object,
	#instVars : [
		'id',
		'description',
		'color',
		'project'
	],
	#category : 'MyMoldableRequirements-Models'
}

{ #category : #accessing }
MyLabelOld class >> fromRawData: labelDict [ 
^ self
	id: (labelDict at: #id)
	description: (labelDict at: #description)
	color: (labelDict at: #color)
]

{ #category : #accessing }
MyLabelOld class >> id: aNumber description: aString color: anotherString [ 
^ self new 
	id: aNumber;
	description: aString;
	color: anotherString
	yourself
]

{ #category : #accessing }
MyLabelOld >> addColorDropdownAptitude [
"returns a dropdown of all colors"

	^ BrGlamorousWithDropdownAptitude
		handle: [ BrButton new
				aptitude: BrGlamorousButtonRectangularAptitude + BrGlamorousButtonIconAptitude;
				icon: BrGlamorousIcons add ]
		content: [ self colorListForDropdown ]
]

{ #category : #accessing }
MyLabelOld >> asFormElement: aBlock [
	"a label presents itself as a form to be filled and save as an object"

	| label textElementDescription form colorContainer |
	textElementDescription := GtDocument new asElementWithoutSaveAction
		vFitContent;
		hMatchParent;
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 2);
		padding: (BlInsets all: 3);
		margin: (BlInsets top: 3 bottom: 3);
		geometry: (BlRectangle cornerRadius: 5).
	form:=  BlElement new
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
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				beLargeSize;
				text: 'Choose a Color:';
				yourself).
	colorContainer := (BlElement new
						layout: BlFlowLayout horizontal;
						constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal exact: 300 ]).
	(self colorList) collect: [:each | colorContainer addChild:(BrButton new
				aptitude: BrGlamorousButtonWithLabelAptitude;
				margin: (BlInsets top: 0 left: 0 bottom: 2 right:2);
				beNormalSize;
				label: each;
				action: [ self color: each asString. description := textElementDescription document text asString.
				self assert: (self color notNil).
				project ifNotNil: [ :aProject | aProject announcer announce: (MyUserStoryStatusChanged new) ].
					"The following line means that when we click the save button, the arguement i.e., aBlock is evaluated"
					aBlock value ];
				yourself) ].
	form addChild: colorContainer.
	^form
]

{ #category : #accessing }
MyLabelOld >> asLabel [
	^ BlTextElement new
		geometry: (BlRectangle cornerRadius: 6);
		layout: BlLinearLayout horizontal alignCenter;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		border: (BlBorder paint: (Color fromHexString: 'd9d9d9') width: 1);
		padding: (BlInsets all: 5);
		margin: (BlInsets right: 3);
		background: self color veryMuchLighter;
		text: self description asRopedText;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ]
]

{ #category : #accessing }
MyLabelOld >> color [
^color
]

{ #category : #accessing }
MyLabelOld >> color: aString [
| aColor |
	
	aColor := { 
		#'yellow' -> (Color yellow).
		#'green' -> (Color green).
		#'blue' -> (Color blue).
		#'orange' -> (Color orange).
		#'red' -> (Color red).
		#'cyan' -> (Color cyan).
		#'' -> (nil).
	}	asDictionary
			at: aString asSymbol.
	
	color := aColor
]

{ #category : #accessing }
MyLabelOld >> colorDropdownButton [
	^ BrButton new
		aptitude: BrGlamorousButtonWithIconAptitude + self addColorDropdownAptitude;
		icon: BrGlamorousVectorIcons add;
		margin:
			(BlInsets
				top: 20
				left: 0
				bottom: 5
				right: 0);
		beTinySize;
		label: 'Add a Color'
]

{ #category : #accessing }
MyLabelOld >> colorList [
^ #('yellow' 'green' 'blue' 'orange' 'red' 'cyan')
]

{ #category : #accessing }
MyLabelOld >> colorListForDropdown [
| dropdown colorList |

colorList := #('yellow' 'green' 'blue' 'orange' 'red' 'cyan').

dropdown := BlElement new
				layout: BlLinearLayout vertical;
				constraintsDo: [ :c | 
					c vertical fitContent.
					c horizontal fitContent ];
				padding: (BlInsets all: 5).
			(colorList) collect: [:each | dropdown addChild: (BrButton new
				aptitude: BrGlamorousLabelAptitude;
				label: each asText;
				action: [ self color:each asString ];
				yourself). ].
			^dropdown
]

{ #category : #accessing }
MyLabelOld >> description [
^description
]

{ #category : #accessing }
MyLabelOld >> description: aString [ 
description := aString
]

{ #category : #accessing }
MyLabelOld >> gtCircleViewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Label';
		priority: 0;
		stencil: [ self asLabel constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ] ]
]

{ #category : #accessing }
MyLabelOld >> id: aNumber [ 
id := aNumber
]

{ #category : #accessing }
MyLabelOld >> printOn: aStream [
	aStream nextPutAll: description
]

{ #category : #accessing }
MyLabelOld >> project [
^project
]

{ #category : #accessing }
MyLabelOld >> project: aProject [
project := aProject
]

Class {
	#name : #MyPersona,
	#superclass : #Object,
	#instVars : [
		'name',
		'description',
		'project',
		'announcer'
	],
	#category : #'MyMoldableRequirements-Models'
}

{ #category : #accessing }
MyPersona class >> fromRawData: personaDict [ 
^ self 
	name: (personaDict at: #name)
	description: (personaDict at: #description)
]

{ #category : #accessing }
MyPersona class >> name: aString description: anotherString [
^self new
	name: aString;
	description: anotherString
	yourself
]

{ #category : #accessing }
MyPersona >> asFormElement: aBlock [
	"a persona presents itself as a form to be filled and save as an object"

	| label textElementDescription nameElementDescription |
	nameElementDescription := GtDocument new asElementWithoutSaveAction
		vFitContent;
		hMatchParent;
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 2);
		padding: (BlInsets all: 3);
		margin: (BlInsets top: 3 bottom: 3);
		geometry: (BlRectangle cornerRadius: 5).
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
				text: 'Name:';
				yourself);
		addChild: nameElementDescription;
		addChild:
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				beLargeSize;
				text: 'Description:';
				yourself);
		addChild: textElementDescription;
		addChild:
			(BrButton new
				aptitude: BrGlamorousButtonWithIconAptitude;
				icon: BrGlamorousVectorIcons accept;
				label: 'Save';
				action: [ name := nameElementDescription document text asString.
				description := textElementDescription document text asString.
				self assert: name notEmpty.
				self assert: description notEmpty.
				project ifNotNil: [ :aProject | aProject announcer announce: (MyUserStoryStatusChanged new) ].
					"The following line means that when we click the save button, the arguement i.e., aBlock is evaluated"
					aBlock value ];
				yourself);
		yourself
]

{ #category : #accessing }
MyPersona >> asListElement [
^BrButton new
	label: name;
	aptitude: BrGlamorousLabelAptitude;
	beNormalSize;
	constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ];
	action: [ :button | button phlow spawnObject: self]
]

{ #category : #accessing }
MyPersona >> asPersonaCard [
	^ BlElement new
		layout: BlLinearLayout vertical;
		geometry: (BlRoundedRectangleGeometry cornerRadius: 10);
		margin: (BlInsets all: 10);
		addChild: (BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				beLargeSize;
				text: name;
				beHugeSize;
				yourself);
		addChild:
			(BrEditableLabel new
				aptitude: BrGlamorousEditableLabelAptitude new glamorousRegularFontAndSize;
				text: description;
				when: BrEditorAcceptWish do: [ :aWish | description := aWish text ];
				yourself);
		yourself
]

{ #category : #accessing }
MyPersona >> description [
^description
]

{ #category : #accessing }
MyPersona >> description: aString [
description := aString
]

{ #category : #accessing }
MyPersona >> gtPersonaFor: aView [
	<gtView>
	^ aView explicit
		title: 'Persona';
		priority: 1;
		stencil: [ self asPersonaCard
				aptitude: BrShadowAptitude;
				background: Color white;
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ];
				padding: (BlInsets all: 5);
				yourself ]
]

{ #category : #accessing }
MyPersona >> name [ 
^name
]

{ #category : #accessing }
MyPersona >> name: aString [
name := aString 
]

{ #category : #accessing }
MyPersona >> printOn: aStream [
	aStream nextPutAll: name
]

{ #category : #accessing }
MyPersona >> project [
^project
]

{ #category : #accessing }
MyPersona >> project: aProject [
project := aProject
]

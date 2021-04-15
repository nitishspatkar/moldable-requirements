Class {
	#name : #MyTeamMembers,
	#superclass : #Object,
	#instVars : [
		'name',
		'shorthand',
		'project'
	],
	#category : #'MyMoldableRequirements-Models'
}

{ #category : #accessing }
MyTeamMembers class >> fromRawData: teamDict [ 
^self 
	name: (teamDict at: #name)
	shorthand: (teamDict at: #shorthand)
]

{ #category : #accessing }
MyTeamMembers class >> name: aString shorthand: anotherString [
^ self new
	name: aString;
	shorthand: anotherString
	yourself 
]

{ #category : #accessing }
MyTeamMembers >> asFormElement: aBlock [
	"a teamMember presents itself as a form to be filled and save as an object"

	| label nameElementDescription shorthandElementDescription|
	nameElementDescription := GtDocument new asElementWithoutSaveAction
		vFitContent;
		hMatchParent;
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 2);
		padding: (BlInsets all: 3);
		margin: (BlInsets top: 3 bottom: 3);
		geometry: (BlRectangle cornerRadius: 5).
	shorthandElementDescription := GtDocument new asElementWithoutSaveAction
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
				text: 'Name';
				yourself);
		addChild: nameElementDescription;
		addChild:
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				beLargeSize;
				text: 'Shorthand';
				yourself);
		addChild: shorthandElementDescription;
		addChild:
			(BrButton new
				aptitude: BrGlamorousButtonWithIconAptitude;
				icon: BrGlamorousVectorIcons accept;
				label: 'Save';
				action: [ name := nameElementDescription document text asString.
				shorthand := shorthandElementDescription document text asString.
				self assert: name notEmpty.
				self assert: shorthand notEmpty.
				project ifNotNil: [ :aProject | aProject announcer announce: (MyUserStoryStatusChange new) ].
					"The following line means that when we click the save button, the arguement i.e., aBlock is evaluated"
					aBlock value ];
				yourself);
		yourself
]

{ #category : #accessing }
MyTeamMembers >> asShorthandCircle [
^ BrButton new
		layout: BlLinearLayout vertical;
		size: 20@20;
		geometry: (BlCircle new);
		background: Color palePeach;
		margin: (BlInsets right: 10);
		action: [:button | button phlow spawnObject: self];
		addChild: (BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				beLargeSize;
				alignCenter;
				text: shorthand;
				beTinySize;
				yourself);
		aptitude: BrShadowAptitude;
		constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ];
		padding: (BlInsets all: 5);
		yourself 
]

{ #category : #accessing }
MyTeamMembers >> gtCircleViewFor: aView [
	<gtView>
	^aView explicit
		title: 'Shorthand View';
		priority: 1;
		stencil: [ self asShorthandCircle]
]

{ #category : #accessing }
MyTeamMembers >> name [ 
^name
]

{ #category : #accessing }
MyTeamMembers >> name: aString [ 
name := aString
]

{ #category : #accessing }
MyTeamMembers >> printOn: aStream [
	aStream nextPutAll: name
]

{ #category : #accessing }
MyTeamMembers >> project [ 
^project
]

{ #category : #accessing }
MyTeamMembers >> project: aProject [
project := aProject
]

{ #category : #accessing }
MyTeamMembers >> shorthand [
^shorthand

]

{ #category : #accessing }
MyTeamMembers >> shorthand: aString [
shorthand := aString
]

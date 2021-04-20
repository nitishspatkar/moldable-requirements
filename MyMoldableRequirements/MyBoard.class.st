Class {
	#name : #MyBoard,
	#superclass : #Object,
	#instVars : [
		'columns',
		'id',
		'userStories',
		'project'
	],
	#category : #'MyMoldableRequirements-Models'
}

{ #category : #accessing }
MyBoard >> asBoard [
	| board headerContainer columnContainer column |
	board := BlElement new
		layout: BlLinearLayout vertical;
		geometry: (BlRoundedRectangleGeometry cornerRadius: 10);
		margin: (BlInsets all: 10);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
			
	headerContainer := BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical exact: 50 ].
			
	columnContainer := BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
	
	headerContainer
		addChild:
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				beNormalSize;
				text: project title;
				yourself).	
board addChild: headerContainer.
				
	columns
		collect: [ :eachCol | 
		column := (BlElement new 
				layout: BlLinearLayout vertical;
				geometry: (BlRoundedRectangleGeometry cornerRadius: 10);
				aptitude: BrShadowAptitude;
				background: Color white;
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical fitContent ];
				padding: (BlInsets all: 5);
				margin: (BlInsets top: 0 left: 5 bottom: 0 right: 5);
				yourself).
		column addChild: (BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				beLargeSize;
				margin: (BlInsets top: 15 left: 15 bottom: 15 right: 0);
				text: eachCol title;
				constraintsDo: [ :c | 
			c linear vertical alignCenter.
			c linear horizontal alignCenter ]
				yourself).
		self getUserStories.
		userStories collect: [ :eachStory | eachStory status label = eachCol title 
		ifTrue: [column addChild: (eachStory asMinimalStoryCard aptitude: BrShadowAptitude;
				background: Color white;
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical fitContent ];
				padding: (BlInsets all: 5);
				yourself )]].
		columnContainer addChild: column asScrollableElement.].
	board addChild: columnContainer.
	
	^ board asScrollableElement

]

{ #category : #accessing }
MyBoard >> columns: anArray [
columns := anArray
]

{ #category : #accessing }
MyBoard >> fromRawData: aBoard [ 
^ self
	id: (aBoard at: #id);
	columns: ((aBoard at: #columns) collect: [ :columnDict | MyColumn fromRawData: columnDict])
]

{ #category : #accessing }
MyBoard >> getUserStories [
userStories := OrderedCollection new.
project epics collect: [:each | self userStories: (each userStories)]
]

{ #category : #accessing }
MyBoard >> gtBoardFor: aView [
	<gtView>
	^ aView explicit
		title: 'Story Board';
		priority: 1;
		stencil: [ self asBoard 
				margin: (BlInsets all: 10);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].]
]

{ #category : #accessing }
MyBoard >> id: aNumber [
id := aNumber
]

{ #category : #accessing }
MyBoard >> project [
^project
]

{ #category : #accessing }
MyBoard >> project: aProject [
project:= aProject
]

{ #category : #accessing }
MyBoard >> userStories [
^userStories
]

{ #category : #accessing }
MyBoard >> userStories: anArray [
anArray collect: [ :each | userStories add: each].
]

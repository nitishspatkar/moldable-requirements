Class {
	#name : 'MyBoard',
	#superclass : 'Object',
	#instVars : [
		'columns',
		'id',
		'userStories',
		'project'
	],
	#category : 'MyMoldableRequirements-Models'
}

{ #category : 'accessing' }
MyBoard >> asBoard [
	| board headerContainer columnContainer column |

	headerContainer := BrHorizontalPane new
		hMatchParent;
		vExact: 50.
			
	columnContainer := BrHorizontalPane new
		hMatchParent;
		vFitContent;
		cellSpacing: 10;
		padding: (BlInsets top: 10 bottom: 10).
	
	headerContainer addChild:
		(BrLabel new
			aptitude: BrGlamorousLabelAptitude;
			beNormalSize;
			text: project title).
				
	columnContainer addChildren: (columns
		collect: [ :eachCol | 
		column := BrVerticalPane new
				alignTopCenter;
				geometry: (BlRoundedRectangleGeometry cornerRadius: 10);
				aptitude: BrShadowAptitude;
				background: Color white;
				hMatchParent;
				vFitContent;
				padding: (BlInsets all: 5).
				
		column addChild: (BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				beLargeSize;
				margin: (BlInsets top: 15 left: 15 bottom: 15 right: 0);
				text: eachCol title;
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
		column ]).
				
	board := BrVerticalPane new
		geometry: (BlRoundedRectangleGeometry cornerRadius: 10);
		margin: (BlInsets all: 10);
		hMatchParent;
		vFitContent.			
	
	board addChild: headerContainer.
	board addChild: columnContainer.
	
	^ board asScrollableElement

]

{ #category : 'accessing' }
MyBoard >> columns: anArray [
	columns := anArray
]

{ #category : 'accessing' }
MyBoard >> fromRawData: aBoard [ 
^ self
	id: (aBoard at: #id);
	columns: ((aBoard at: #columns) collect: [ :columnDict | MyColumn fromRawData: columnDict])
]

{ #category : 'accessing' }
MyBoard >> getUserStories [
	userStories := OrderedCollection new.
	project epics collect: [:each | 
		self userStories: (each userStories) ]
]

{ #category : 'accessing' }
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

{ #category : 'accessing' }
MyBoard >> id: aNumber [
id := aNumber
]

{ #category : 'accessing' }
MyBoard >> project [
	^project
]

{ #category : 'accessing' }
MyBoard >> project: aProject [
	project:= aProject
]

{ #category : 'accessing' }
MyBoard >> userStories [
	^userStories
]

{ #category : 'accessing' }
MyBoard >> userStories: anArray [
	anArray collect: [ :each | userStories add: each].
]

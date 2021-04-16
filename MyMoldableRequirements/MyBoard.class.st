Class {
	#name : #MyBoard,
	#superclass : #Object,
	#instVars : [
		'columns',
		'id'
	],
	#category : #'MyMoldableRequirements-Models'
}

{ #category : #accessing }
MyBoard >> asBoard [
| board headerContainer columnContainer |
	board := BlElement new
		layout: BlLinearLayout vertical;
		geometry: (BlRoundedRectangleGeometry cornerRadius: 10);
		margin: (BlInsets all: 10);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent.
			 ].
	
	headerContainer := BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent.
			 ].
	
	columnContainer := BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical matchParent.
			 ].
			 
		
	^board
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
MyBoard >> id: aNumber [
id := aNumber
]

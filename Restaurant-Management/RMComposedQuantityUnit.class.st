Class {
	#name : #RMComposedQuantityUnit,
	#superclass : #RMQuantityUnit,
	#instVars : [
		'quantityUnit',
		'quantity'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #accessing }
RMComposedQuantityUnit >> asOverviewElementIn: aParentElement [	
	| containerElement className contentElement |
	containerElement := BlElement new
			constraintsDo: [ :c | 
				c vertical fitContent.
				c horizontal fitContent ];
		background: Color white;
		look: BrShadowLook;
		margin: (BlInsets all: 10);
		layout: BlLinearLayout vertical.
	aParentElement addChild: containerElement.
	className := ((self class name first isVowel ifTrue: ['an '] ifFalse: ['a ']), self class name) asRopedText foreground: Color gray; fontSize: 10.
	containerElement addChild: (BrLabel new 
		text: className; 
		constraintsDo: [ :c | 
			c vertical exact: 5.
			c horizontal fitContent ];
		look: (BrGlamorousLabelLook new fontSize: 9; padding: (BlInsets top: 5 left: 5 bottom: 0 right: 5))).
	contentElement := BlElement new
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent.
			c linear vertical alignCenter ];
		layout: BlLinearLayout horizontal.
	self quantityUnit asOverviewElementIn: contentElement.
	contentElement addChild: (BrLabel new 
		text: 'of' asRopedText; 
		look: BrGlamorousLabelLook;
		padding: (BlInsets all: 5);
		constraintsDo: [ :c | 
				c vertical fitContent.
				c horizontal fitContent.
			c linear vertical alignCenter ]).
	self quantity asOverviewElementIn: contentElement.
	containerElement addChild: contentElement.
]

{ #category : #accessing }
RMComposedQuantityUnit >> quantity [
	^ quantity
]

{ #category : #accessing }
RMComposedQuantityUnit >> quantity: anObject [
	quantity := anObject
]

{ #category : #accessing }
RMComposedQuantityUnit >> quantityUnit [
	^ quantityUnit
]

{ #category : #accessing }
RMComposedQuantityUnit >> quantityUnit: anObject [
	quantityUnit := anObject
]

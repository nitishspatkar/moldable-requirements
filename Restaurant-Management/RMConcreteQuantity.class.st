Class {
	#name : #RMConcreteQuantity,
	#superclass : #RMQuantity,
	#instVars : [
		'amount',
		'quantityUnit'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #operations }
RMConcreteQuantity >> * aNumber [ 
	^ self copy
		amount: self amount * aNumber
]

{ #category : #operations }
RMConcreteQuantity >> + anUConcreteQuantity [
	self assert: [ self quantityUnit = anUConcreteQuantity quantityUnit ]. 
	^ self copy
		amount: self amount + anUConcreteQuantity amount
]

{ #category : #comparing }
RMConcreteQuantity >> = aQuantity [
	^ (aQuantity isKindOf: RMQuantity) and: [ 
		aQuantity amount = self amount and: [ 
			aQuantity quantityUnit = self quantityUnit ] ]
]

{ #category : #accessing }
RMConcreteQuantity >> amount [
	^ amount
]

{ #category : #accessing }
RMConcreteQuantity >> amount: anObject [
	amount := anObject
]

{ #category : #ui }
RMConcreteQuantity >> asOverviewElementIn: aParentElement [
	| containerElement contentElement labelElement className |
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
		layout: BlLinearLayout horizontal;
		margin: (BlInsets bottom: 10).
	labelElement := BrLabel new
		look: BrGlamorousLabelLook new;
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent.
			c linear vertical alignCenter ];
		text: self amount gtDisplayString asRopedText;
		padding: (BlInsets all: 5).
	contentElement addChild: labelElement.
	self quantityUnit asOverviewElementIn: contentElement.
	containerElement addChild: contentElement.

]

{ #category : #scripting }
RMConcreteQuantity >> of: aQuantity [
	^ RMConcreteQuantity new
		amount: self amount;
		quantityUnit: (RMComposedQuantityUnit new quantityUnit: self quantityUnit copy; quantity: aQuantity)
]

{ #category : #accessing }
RMConcreteQuantity >> quantityUnit [
	^ quantityUnit
]

{ #category : #accessing }
RMConcreteQuantity >> quantityUnit: anObject [
	quantityUnit := anObject
]

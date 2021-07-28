Class {
	#name : #RMBasicQuantityUnit,
	#superclass : #RMQuantityUnit,
	#instVars : [
		'name',
		'symbol'
	],
	#classVars : [
		'Units'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #'class initialization' }
RMBasicQuantityUnit class >> bottle [
	^ self units at: #bottle ifAbsentPut: [ RMBasicQuantityUnit new name: 'Bottle'; symbol: 'bottle' ]
]

{ #category : #'class initialization' }
RMBasicQuantityUnit class >> gram [
	^ self units at: #gram ifAbsentPut: [ RMBasicQuantityUnit new name: 'Gram'; symbol: 'g' ]
]

{ #category : #'class initialization' }
RMBasicQuantityUnit class >> initialize [
	self reset
]

{ #category : #'class initialization' }
RMBasicQuantityUnit class >> liter [
	^ self units at: #liter ifAbsentPut: [ RMBasicQuantityUnit new name: 'Liter'; symbol: 'l' ]
]

{ #category : #'class initialization' }
RMBasicQuantityUnit class >> pack [
	^ self units at: #pack ifAbsentPut: [ RMBasicQuantityUnit new name: 'Pack'; symbol: 'pack' ]
]

{ #category : #'class initialization' }
RMBasicQuantityUnit class >> piece [
	^ self units at: #piece ifAbsentPut: [ RMBasicQuantityUnit new name: 'Piece'; symbol: 'piece' ]
]

{ #category : #'class initialization' }
RMBasicQuantityUnit class >> reset [
	Units := Dictionary new
]

{ #category : #'class initialization' }
RMBasicQuantityUnit class >> units [
	^ Units
]

{ #category : #comparing }
RMBasicQuantityUnit >> = aUnit [
	^ (aUnit isKindOf: RMBasicQuantityUnit) and: [ aUnit name = self name ]
]

{ #category : #ui }
RMBasicQuantityUnit >> asOverviewElementIn: aParentElement [
	| containerElement className contentElement labelElement |
	containerElement := BlElement new
			constraintsDo: [ :c | 
				c vertical fitContent.
				c horizontal fitContent.
				c linear vertical alignCenter ];
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
	labelElement := BrLabel new
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent.
			c linear vertical alignCenter ];
		look: BrGlamorousLabelLook new;
		text: self name asRopedText;
		padding: (BlInsets all: 5);
		margin: (BlInsets bottom: 10).
	containerElement addChild: labelElement.
	"containerElement addChild: (BrLabel new 
		text: ' '; 
		look: (BrGlamorousLabelLook new fontSize: 9))."
]

{ #category : #accessing }
RMBasicQuantityUnit >> name [
	^ name
]

{ #category : #accessing }
RMBasicQuantityUnit >> name: anObject [
	name := anObject
]

{ #category : #accessing }
RMBasicQuantityUnit >> symbol [
	^ symbol
]

{ #category : #accessing }
RMBasicQuantityUnit >> symbol: anObject [
	symbol := anObject
]

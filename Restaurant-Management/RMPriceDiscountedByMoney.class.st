Class {
	#name : #RMPriceDiscountedByMoney,
	#superclass : #RMModifiedPrice,
	#instVars : [
		'discountMoney'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #ui }
RMPriceDiscountedByMoney >> asOverviewChildrenIn: childrenElement [
	| discountElement minusElement |
	price asOverviewElementIn: childrenElement.
	minusElement := BrLabel new look: BrGlamorousLabelLook; text: '-'; constraintsDo: [:c | 
		c vertical fitContent. 
		c horizontal fitContent. 
		c linear vertical alignCenter ].
	discountElement := BrLabel new look: BrGlamorousLabelLook; text: self discountMoney gtDisplayString; constraintsDo: [:c | 
		c vertical fitContent. 
		c horizontal fitContent. 
		c linear vertical alignCenter ].
	childrenElement addChild: minusElement.
	childrenElement addChild: discountElement.
]

{ #category : #accessing }
RMPriceDiscountedByMoney >> discountMoney [
	^ discountMoney
]

{ #category : #accessing }
RMPriceDiscountedByMoney >> discountMoney: anObject [
	discountMoney := anObject
]

{ #category : #accessing }
RMPriceDiscountedByMoney >> localDisplayOn: stream [
	self discountMoney gtDisplayOn: stream.
	stream nextPutAll: ' off '.
	self price localWithPossibleParanthesesDisplayOn: stream.
	
]

{ #category : #accessing }
RMPriceDiscountedByMoney >> money [
	^ self price money - self discountMoney
]

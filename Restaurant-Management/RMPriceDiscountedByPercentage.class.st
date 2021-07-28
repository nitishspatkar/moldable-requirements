Class {
	#name : #RMPriceDiscountedByPercentage,
	#superclass : #RMModifiedPrice,
	#instVars : [
		'discountPercentage'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #ui }
RMPriceDiscountedByPercentage >> asOverviewChildrenIn: childrenElement [
	| percentageElement multiplyElement |
	percentageElement := BrLabel new look: BrGlamorousLabelLook; text: ((self discountPercentage * 100) asString, '%'); constraintsDo: [:c | 
		c vertical fitContent. 
		c horizontal fitContent. 
		c linear vertical alignCenter ].
	multiplyElement := BrLabel new look: BrGlamorousLabelLook; text: ' off '; constraintsDo: [:c | 
		c vertical fitContent. 
		c horizontal fitContent. 
		c linear vertical alignCenter ].
	childrenElement addChild: percentageElement.
	childrenElement addChild: multiplyElement.
	price asOverviewElementIn: childrenElement
]

{ #category : #accessing }
RMPriceDiscountedByPercentage >> discountPercentage [
	^ discountPercentage
]

{ #category : #accessing }
RMPriceDiscountedByPercentage >> discountPercentage: anObject [
	discountPercentage := anObject
]

{ #category : #ui }
RMPriceDiscountedByPercentage >> localDisplayOn: stream [
	stream nextPutAll: (self discountPercentage * 100) asString, '% off '.
	self price localWithPossibleParanthesesDisplayOn: stream
]

{ #category : #accessing }
RMPriceDiscountedByPercentage >> money [
	| originalMoney |
	originalMoney := self price money.
	^ originalMoney - (originalMoney * self discountPercentage)
]

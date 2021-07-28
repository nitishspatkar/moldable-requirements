Class {
	#name : #RMDividedPrice,
	#superclass : #RMModifiedPrice,
	#instVars : [
		'divisor'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #ui }
RMDividedPrice >> asOverviewChildrenIn: childrenElement [
	| multiplierElement multiplyElement |
	multiplierElement := BrLabel new look: BrGlamorousLabelLook; text: self divisor asString; constraintsDo: [:c | 
		c vertical fitContent. 
		c horizontal fitContent. 
		c linear vertical alignCenter ].
	multiplyElement := BrLabel new look: BrGlamorousLabelLook; text: '/'; constraintsDo: [:c | 
		c vertical fitContent. 
		c horizontal fitContent. 
		c linear vertical alignCenter ].
	childrenElement addChild: multiplierElement.
	childrenElement addChild: multiplyElement.
	price asOverviewElementIn: childrenElement
]

{ #category : #accessing }
RMDividedPrice >> divisor [
	^ divisor
]

{ #category : #accessing }
RMDividedPrice >> divisor: anObject [
	divisor := anObject
]

{ #category : #printing }
RMDividedPrice >> localDisplayOn: stream [
	self price localWithPossibleParanthesesDisplayOn: stream.
	stream 
		nextPutAll: ' / '; 
		nextPutAll: self divisor asString
]

{ #category : #accessing }
RMDividedPrice >> money [
	^ self price money / self divisor
]

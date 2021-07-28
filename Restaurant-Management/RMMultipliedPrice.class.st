Class {
	#name : #RMMultipliedPrice,
	#superclass : #RMModifiedPrice,
	#instVars : [
		'multiplier'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #ui }
RMMultipliedPrice >> asOverviewChildrenIn: childrenElement [
	| multiplierElement multiplyElement |
	multiplierElement := BrLabel new look: BrGlamorousLabelLook; text: self multiplier asString; constraintsDo: [:c | 
		c vertical fitContent. 
		c horizontal fitContent. 
		c linear vertical alignCenter ].
	multiplyElement := BrLabel new look: BrGlamorousLabelLook; text: '*'; constraintsDo: [:c | 
		c vertical fitContent. 
		c horizontal fitContent. 
		c linear vertical alignCenter ].
	childrenElement addChild: multiplierElement.
	childrenElement addChild: multiplyElement.
	price asOverviewElementIn: childrenElement
]

{ #category : #printing }
RMMultipliedPrice >> localDisplayOn: stream [
	self price localWithPossibleParanthesesDisplayOn: stream.
	stream 
		nextPutAll: ' * '; 
		nextPutAll: self multiplier asString
]

{ #category : #accessing }
RMMultipliedPrice >> money [
	^ self price money * multiplier
]

{ #category : #accessing }
RMMultipliedPrice >> multiplier [
	^ multiplier
]

{ #category : #accessing }
RMMultipliedPrice >> multiplier: anObject [
	multiplier := anObject
]

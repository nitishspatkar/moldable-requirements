Class {
	#name : #RMSummedPrice,
	#superclass : #RMModifiedPrice,
	#instVars : [
		'additionalPrice'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #accessing }
RMSummedPrice >> additionalPrice [
	^ additionalPrice
]

{ #category : #accessing }
RMSummedPrice >> additionalPrice: anObject [
	additionalPrice := anObject
]

{ #category : #ui }
RMSummedPrice >> asOverviewChildrenIn: childrenElement [
	| plusElement |
	price asOverviewElementIn: childrenElement.
	plusElement := BrLabel new look: BrGlamorousLabelLook; text: '+'; constraintsDo: [:c | 
		c vertical fitContent. 
		c horizontal fitContent. 
		c linear vertical alignCenter ].
	childrenElement addChild: plusElement.
	self additionalPrice asOverviewElementIn: childrenElement
]

{ #category : #accessing }
RMSummedPrice >> children [
	^ super children, { self additionalPrice }
]

{ #category : #printing }
RMSummedPrice >> localDisplayOn: stream [
	self price localWithPossibleParanthesesDisplayOn: stream.
	stream nextPutAll: ' + '.
	self additionalPrice localWithPossibleParanthesesDisplayOn: stream
]

{ #category : #accessing }
RMSummedPrice >> money [
	^ self price money + self additionalPrice money
]

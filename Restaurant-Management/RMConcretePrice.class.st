Class {
	#name : #RMConcretePrice,
	#superclass : #RMPrice,
	#instVars : [
		'money'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #ui }
RMConcretePrice >> asOverviewChildrenIn: containerElement [
	"nothing"
]

{ #category : #operations }
RMConcretePrice >> dividingPrice: aPrice [
	self assert: [ aPrice isKindOf: RMPrice ].
	^ self money / aPrice money
]

{ #category : #accessing }
RMConcretePrice >> money [
	^ money
]

{ #category : #accessing }
RMConcretePrice >> money: aMoney [
	self assert: [ money isNil ] description: 'Concrete prices are immutable'.
	self assert: [ aMoney isKindOf: RMMoney ].
	
	money := aMoney
]

{ #category : #printing }
RMConcretePrice >> printOn: stream [
	money printOn: stream
]

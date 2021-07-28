"
I am essentially a decorator that modifies a ==price==.

See ${class:UPriceExamples}$.
"
Class {
	#name : #RMModifiedPrice,
	#superclass : #RMPrice,
	#instVars : [
		'price'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #accessing }
RMModifiedPrice >> children [
	^ { self price }
]

{ #category : #printing }
RMModifiedPrice >> gtDisplayOn: stream [
	self money gtDisplayOn: stream.
	"stream nextPutAll: ' = '.
	self localDisplayOn: stream"
]

{ #category : #printing }
RMModifiedPrice >> localDisplayOn: stream [
	self subclassResponsibility
]

{ #category : #printing }
RMModifiedPrice >> localWithPossibleParanthesesDisplayOn: stream [
	stream nextPutAll: '('.
	self localDisplayOn: stream.
	stream nextPutAll: ')'
]

{ #category : #accessing }
RMModifiedPrice >> price [
	^ price
]

{ #category : #accessing }
RMModifiedPrice >> price: anObject [
	price := anObject
]

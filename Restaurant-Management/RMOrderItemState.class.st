Class {
	#name : #RMOrderItemState,
	#superclass : #RMObject,
	#instVars : [
		'orderItem',
		'previousState',
		'timestamp'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #initialization }
RMOrderItemState >> initialize [
	super initialize.
	timestamp := DateAndTime now
]

{ #category : #accessing }
RMOrderItemState >> orderItem [
	^ orderItem
]

{ #category : #accessing }
RMOrderItemState >> orderItem: anObject [
	orderItem := anObject
]

{ #category : #accessing }
RMOrderItemState >> previousState [
	^ previousState
]

{ #category : #accessing }
RMOrderItemState >> previousState: anObject [
	previousState := anObject
]

{ #category : #accessing }
RMOrderItemState >> timestamp [
	^ timestamp
]

{ #category : #accessing }
RMOrderItemState >> timestamp: anObject [
	timestamp := anObject
]
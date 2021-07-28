Class {
	#name : #RMTimestampedObject,
	#superclass : #RMObject,
	#instVars : [
		'timestamp'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #initialization }
RMTimestampedObject >> initialize [
	super initialize.
	timestamp := UTimeProvider currentTime
]

{ #category : #accessing }
RMTimestampedObject >> timestamp [
	^ timestamp
]

{ #category : #accessing }
RMTimestampedObject >> timestamp: anObject [
	timestamp := anObject
]

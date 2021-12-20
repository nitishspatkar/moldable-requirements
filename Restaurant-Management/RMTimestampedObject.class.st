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
	timestamp := DateAndTime now
]

{ #category : #accessing }
RMTimestampedObject >> timestamp [
	^ timestamp
]

{ #category : #accessing }
RMTimestampedObject >> timestamp: anObject [
	timestamp := anObject
]
Class {
	#name : #RMDerivedPrice,
	#superclass : #RMPrice,
	#instVars : [
		'reference'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #accessing }
RMDerivedPrice >> money [
	^ self subclassResponsibility
]

{ #category : #accessing }
RMDerivedPrice >> reference [
	^ reference
]

{ #category : #accessing }
RMDerivedPrice >> reference: anObject [
	reference := anObject
]

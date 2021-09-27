Class {
	#name : #SpecElementWithAttributes,
	#superclass : #Identifiable,
	#instVars : [
		'values'
	],
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
SpecElementWithAttributes >> values [
	^ values
]

{ #category : #accessing }
SpecElementWithAttributes >> values: anObject [
	values := anObject
]

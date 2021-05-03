Class {
	#name : #MyUserStoryAnnotation,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'MyMoldableRequirements-Models'
}

{ #category : #accessing }
MyUserStoryAnnotation >> name [
	^ name
]

{ #category : #accessing }
MyUserStoryAnnotation >> name: anObject [
	name := anObject
]

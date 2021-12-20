Class {
	#name : #MyUserStoryAnnotationNameChanged,
	#superclass : #Announcement,
	#instVars : [
		'userStoryAnnotation'
	],
	#category : 'MyMoldableRequirements-User Story - Events'
}

{ #category : #accessing }
MyUserStoryAnnotationNameChanged >> userStoryAnnotation [
	^ userStoryAnnotation
]

{ #category : #accessing }
MyUserStoryAnnotationNameChanged >> userStoryAnnotation: anObject [
	userStoryAnnotation := anObject
]

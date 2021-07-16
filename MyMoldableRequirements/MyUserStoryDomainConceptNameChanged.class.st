Class {
	#name : 'MyUserStoryDomainConceptNameChanged',
	#superclass : 'Announcement',
	#instVars : [
		'userStoryDomainConcept'
	],
	#category : 'MyMoldableRequirements-User Story - Events'
}

{ #category : 'accessing' }
MyUserStoryDomainConceptNameChanged >> userStoryDomainConcept [
	^ userStoryDomainConcept
]

{ #category : 'accessing' }
MyUserStoryDomainConceptNameChanged >> userStoryDomainConcept: anObject [
	userStoryDomainConcept := anObject
]

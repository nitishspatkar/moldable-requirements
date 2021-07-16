Class {
	#name : 'MyUserStoryDomainConceptStateNameChanged',
	#superclass : 'Announcement',
	#instVars : [
		'userStoryDomainConceptState'
	],
	#category : 'MyMoldableRequirements-User Story - Events'
}

{ #category : 'accessing' }
MyUserStoryDomainConceptStateNameChanged >> userStoryDomainConceptState [
	^ userStoryDomainConceptState
]

{ #category : 'accessing' }
MyUserStoryDomainConceptStateNameChanged >> userStoryDomainConceptState: anObject [
	userStoryDomainConceptState := anObject
]

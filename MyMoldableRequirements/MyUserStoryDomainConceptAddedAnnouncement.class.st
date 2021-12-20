Class {
	#name : #MyUserStoryDomainConceptAddedAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'userStoryDomainConcept'
	],
	#category : 'MyMoldableRequirements-User Story - Events'
}

{ #category : #generated }
MyUserStoryDomainConceptAddedAnnouncement >> userStoryDomainConcept [
	<objectGetter: #domainConcept>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectGetterTemplate'>

	^ userStoryDomainConcept
]

{ #category : #generated }
MyUserStoryDomainConceptAddedAnnouncement >> userStoryDomainConcept: aUserStoryDomainConcept [
	<objectSetter: #domainConcept>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectSetterTemplate'>

	userStoryDomainConcept := aUserStoryDomainConcept
]

Class {
	#name : 'MyUserStoryDomainConceptRemovedAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'userStoryDomainConcept'
	],
	#category : 'MyMoldableRequirements-User Story - Events'
}

{ #category : 'generated' }
MyUserStoryDomainConceptRemovedAnnouncement >> userStoryDomainConcept [
	<objectGetter: #domainConcept>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectGetterTemplate'>

	^ userStoryDomainConcept
]

{ #category : 'generated' }
MyUserStoryDomainConceptRemovedAnnouncement >> userStoryDomainConcept: aUserStoryDomainConcept [
	<objectSetter: #domainConcept>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectSetterTemplate'>

	userStoryDomainConcept := aUserStoryDomainConcept
]

Class {
	#name : 'MyUserStoryDomainConceptServiceRemovedAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'userStoryDomainConceptService'
	],
	#category : 'MyMoldableRequirements-User Story - Events'
}

{ #category : 'generated' }
MyUserStoryDomainConceptServiceRemovedAnnouncement >> userStoryDomainConceptService [
	<objectGetter: #domainConceptService>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectGetterTemplate'>

	^ userStoryDomainConceptService
]

{ #category : 'generated' }
MyUserStoryDomainConceptServiceRemovedAnnouncement >> userStoryDomainConceptService: aUserStoryDomainConceptService [
	<objectSetter: #domainConceptService>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectSetterTemplate'>

	userStoryDomainConceptService := aUserStoryDomainConceptService
]

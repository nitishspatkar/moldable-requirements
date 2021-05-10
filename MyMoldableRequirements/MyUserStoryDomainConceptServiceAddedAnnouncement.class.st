Class {
	#name : #MyUserStoryDomainConceptServiceAddedAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'userStoryDomainConceptService'
	],
	#category : #'MyMoldableRequirements-User Story - Events'
}

{ #category : #generated }
MyUserStoryDomainConceptServiceAddedAnnouncement >> userStoryDomainConceptService [
	<objectGetter: #domainConceptService>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectGetterTemplate'>

	^ userStoryDomainConceptService
]

{ #category : #generated }
MyUserStoryDomainConceptServiceAddedAnnouncement >> userStoryDomainConceptService: aUserStoryDomainConceptService [
	<objectSetter: #domainConceptService>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectSetterTemplate'>

	userStoryDomainConceptService := aUserStoryDomainConceptService
]

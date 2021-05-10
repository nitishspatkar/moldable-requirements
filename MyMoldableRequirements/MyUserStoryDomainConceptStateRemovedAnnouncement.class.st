Class {
	#name : #MyUserStoryDomainConceptStateRemovedAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'userStoryDomainConceptState'
	],
	#category : #'MyMoldableRequirements-User Story - Events'
}

{ #category : #generated }
MyUserStoryDomainConceptStateRemovedAnnouncement >> userStoryDomainConceptState [
	<objectGetter: #domainConceptState>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectGetterTemplate'>

	^ userStoryDomainConceptState
]

{ #category : #generated }
MyUserStoryDomainConceptStateRemovedAnnouncement >> userStoryDomainConceptState: aUserStoryDomainConceptState [
	<objectSetter: #domainConceptState>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectSetterTemplate'>

	userStoryDomainConceptState := aUserStoryDomainConceptState
]

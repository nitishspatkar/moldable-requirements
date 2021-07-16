Class {
	#name : 'MyUserStoryDomainConceptStateAddedAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'userStoryDomainConceptState'
	],
	#category : 'MyMoldableRequirements-User Story - Events'
}

{ #category : 'generated' }
MyUserStoryDomainConceptStateAddedAnnouncement >> userStoryDomainConceptState [
	<objectGetter: #domainConceptState>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectGetterTemplate'>

	^ userStoryDomainConceptState
]

{ #category : 'generated' }
MyUserStoryDomainConceptStateAddedAnnouncement >> userStoryDomainConceptState: aUserStoryDomainConceptState [
	<objectSetter: #domainConceptState>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectSetterTemplate'>

	userStoryDomainConceptState := aUserStoryDomainConceptState
]

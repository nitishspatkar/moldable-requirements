Class {
	#name : #MyUserStoryAnnotationAddedAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'userStoryAnnotation'
	],
	#category : #'MyMoldableRequirements-User Story - Events'
}

{ #category : #generated }
MyUserStoryAnnotationAddedAnnouncement >> userStoryAnnotation [
	<objectGetter: #annotation>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectGetterTemplate'>

	^ userStoryAnnotation
]

{ #category : #generated }
MyUserStoryAnnotationAddedAnnouncement >> userStoryAnnotation: aUserStoryAnnotation [
	<objectSetter: #annotation>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectSetterTemplate'>

	userStoryAnnotation := aUserStoryAnnotation
]

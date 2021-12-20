Class {
	#name : #MyUserStoryAnnotationRemovedAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'userStoryAnnotation'
	],
	#category : 'MyMoldableRequirements-User Story - Events'
}

{ #category : #generated }
MyUserStoryAnnotationRemovedAnnouncement >> userStoryAnnotation [
	<objectGetter: #annotation>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectGetterTemplate'>

	^ userStoryAnnotation
]

{ #category : #generated }
MyUserStoryAnnotationRemovedAnnouncement >> userStoryAnnotation: aUserStoryAnnotation [
	<objectSetter: #annotation>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectSetterTemplate'>

	userStoryAnnotation := aUserStoryAnnotation
]

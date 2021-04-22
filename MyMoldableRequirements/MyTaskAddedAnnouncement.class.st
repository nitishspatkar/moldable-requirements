Class {
	#name : #MyTaskAddedAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'task'
	],
	#category : #'MyMoldableRequirements-User Story - Events'
}

{ #category : #generated }
MyTaskAddedAnnouncement >> task [
	<objectGetter: #task>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectGetterTemplate'>

	^ task
]

{ #category : #generated }
MyTaskAddedAnnouncement >> task: aTask [
	<objectSetter: #task>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectSetterTemplate'>

	task := aTask
]

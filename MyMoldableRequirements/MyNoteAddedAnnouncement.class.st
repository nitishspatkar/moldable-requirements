Class {
	#name : #MyNoteAddedAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'note'
	],
	#category : #'MyMoldableRequirements-User Story - Events'
}

{ #category : #generated }
MyNoteAddedAnnouncement >> note [
	<objectGetter: #note>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectGetterTemplate'>

	^ note
]

{ #category : #generated }
MyNoteAddedAnnouncement >> note: aNote [
	<objectSetter: #note>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectSetterTemplate'>

	note := aNote
]

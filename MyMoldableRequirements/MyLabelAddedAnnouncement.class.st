Class {
	#name : #MyLabelAddedAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'label'
	],
	#category : 'MyMoldableRequirements-User Story - Events'
}

{ #category : #generated }
MyLabelAddedAnnouncement >> label [
	<objectGetter: #label>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectGetterTemplate'>

	^ label
]

{ #category : #generated }
MyLabelAddedAnnouncement >> label: aLabel [
	<objectSetter: #label>
	<generatedFrom: #'GtRobocoderMetamodelAnnouncementTemplate>>#objectSetterTemplate'>

	label := aLabel
]

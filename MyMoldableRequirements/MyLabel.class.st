Class {
	#name : 'MyLabel',
	#superclass : 'Object',
	#instVars : [
		'description',
		'color',
		'parentLabels',
		'announcer'
	],
	#category : 'MyMoldableRequirements-User Story - Models'
}

{ #category : 'api - announcer' }
MyLabel >> announce: anAnnouncement [
	<generatedFrom: #'GtRobocoderMetamodelNotifierDerive>>#announceTemplate'>
	announcer ifNotNil: [ :anAnnouncer | anAnnouncer announce: anAnnouncement ].

	"Dispatch anAnnouncement to the parent objects if they are assigned"
	self hasParentLabels
		ifTrue: [ self parentLabels announce: anAnnouncement ].
]

{ #category : 'api - color' }
MyLabel >> color [
	"Return a not-null color assigned to the receiver"
	<objectGetter: #color>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ color notNil ]
		description: [ 'color should be initialized' ].

	^ color
]

{ #category : 'api - color' }
MyLabel >> color: aColor [
	"Set a not-null color assigned to the receiver"
	<objectSetter: #color>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aColor notNil ]
		description: [ 'color must not be nil' ].

	color == aColor
		ifTrue: [ ^ self ].

	color ifNotNil: [ self unsubscribeFromColor ].
	color := aColor.

	self onColorChanged.
	self subscribeToColor.
	self onPostColorChanged
]

{ #category : 'api - description' }
MyLabel >> description [
	"Return a not-null description assigned to the receiver"
	<objectGetter: #description>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ description notNil ]
		description: [ 'description should be initialized' ].

	^ description
]

{ #category : 'api - description' }
MyLabel >> description: aDescription [
	"Set a not-null description assigned to the receiver"
	<objectSetter: #description>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aDescription notNil ]
		description: [ 'description must not be nil' ].

	description == aDescription
		ifTrue: [ ^ self ].

	description ifNotNil: [ self unsubscribeFromDescription ].
	description := aDescription.

	self onDescriptionChanged.
	self subscribeToDescription.
	self onPostDescriptionChanged
]

{ #category : 'api - color' }
MyLabel >> hasColor [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<objectTester: #color>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ color notNil
]

{ #category : 'api - description' }
MyLabel >> hasDescription [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<objectTester: #description>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ description notNil
]

{ #category : 'api - accessing' }
MyLabel >> hasParentLabels [
	"Return true if the parent object is attached"
	<return: #Boolean>
	<parentObjectTester: #labels>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectTesterTemplate'>

	^ parentLabels notNil
]

{ #category : 'api - testing' }
MyLabel >> isLabel [
	"Return true if the receiver represents Label, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ true
]

{ #category : 'api - testing' }
MyLabel >> isLabels [
	"Return true if the receiver represents Labels, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : 'api - testing' }
MyLabel >> isNote [
	"Return true if the receiver represents Note, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : 'api - testing' }
MyLabel >> isNotes [
	"Return true if the receiver represents Notes, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : 'api - testing' }
MyLabel >> isTask [
	"Return true if the receiver represents Task, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : 'api - testing' }
MyLabel >> isTasks [
	"Return true if the receiver represents Tasks, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : 'api - testing' }
MyLabel >> isUserStory [
	"Return true if the receiver represents UserStory, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : 'api - accessing' }
MyLabel >> objectName [
	"Return a symbolic name of the receiver which helps to create various type based mappings.
	Note: The symbolic name of the object is the exact name that was used
	in the metamodel declaration from which this class was generated"
	<return: #Symbol>
	<generatedFrom: #'GtRobocoderMetamodelNameDerive>>#objectNameTemplate'>

	^ #label
]

{ #category : 'api - color' }
MyLabel >> onColorChanged [
	"Is sent when a new color is assigned to the receiver.
	Note: #onColorChanged is sent before #subscribeToColor
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostColorChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : 'api - description' }
MyLabel >> onDescriptionChanged [
	"Is sent when a new description is assigned to the receiver.
	Note: #onDescriptionChanged is sent before #subscribeToDescription
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostDescriptionChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : 'api - color' }
MyLabel >> onPostColorChanged [
	"I am an optional hook method that is sent after #subscribeToColor.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : 'api - description' }
MyLabel >> onPostDescriptionChanged [
	"I am an optional hook method that is sent after #subscribeToDescription.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : 'api - accessing' }
MyLabel >> parentLabels [
	"Return a parent object which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<return: #MyLabels>
	<parentObjectGetter: #labels>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectGetterTemplate'>

	self
		assert: [ parentLabels notNil ]
		description: [ 'Parent is not assigned!' ].

	^ parentLabels
]

{ #category : 'api - accessing' }
MyLabel >> parentLabels: aMyLabels [
	"Assign a parent object (${class:MyLabels}$) which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<parentObjectSetter: #labels>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectSetterTemplate'>

	self
		assert: [ aMyLabels notNil ]
		description: [ 'Parent view model must not be nil' ].

	parentLabels := aMyLabels
]

{ #category : 'printing' }
MyLabel >> printOn: aStream [
	<generatedFrom: #'GtRobocoderMetamodelPrintDerive>>#printOnTemplate'>
	super printOn: aStream
]

{ #category : 'api - color' }
MyLabel >> subscribeToColor [
	"Is sent after a new color is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromColor if the receiver subscribes to them"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : 'api - description' }
MyLabel >> subscribeToDescription [
	"Is sent after a new description is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromDescription if the receiver subscribes to them"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : 'api - announcer' }
MyLabel >> unsubscribe: anObject [
	"Unsubscribe all subscriptions of anObject from the receiver"

	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#unsubscribeTemplate'>
	^ announcer ifNotNil: [ :anAnnouncer | anAnnouncer unsubscribe: anObject ]
]

{ #category : 'api - color' }
MyLabel >> unsubscribeFromColor [
	"Is sent before a new color is assigned to the receiver.
	Objects that subscribe to color are required to implement this method."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

{ #category : 'api - description' }
MyLabel >> unsubscribeFromDescription [
	"Is sent before a new description is assigned to the receiver.
	Objects that subscribe to description are required to implement this method."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

{ #category : 'api - announcer' }
MyLabel >> when: anAnnouncementClass do: aBlock [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenDoTemplate'>
	(announcer ifNil: [ announcer := Announcer new ])
		when: anAnnouncementClass do: aBlock
]

{ #category : 'api - announcer' }
MyLabel >> when: anAnnouncementClass send: aSelector to: anObject [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenSendToTemplate'>
	(announcer ifNil: [ announcer := Announcer new ]) weak
		when: anAnnouncementClass send: aSelector to: anObject
]

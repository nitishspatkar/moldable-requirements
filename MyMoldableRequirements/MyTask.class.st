Class {
	#name : #MyTask,
	#superclass : #Object,
	#instVars : [
		'description',
		'done',
		'parentTasks',
		'announcer'
	],
	#category : 'MyMoldableRequirements-User Story - Models'
}

{ #category : #'api - announcer' }
MyTask >> announce: anAnnouncement [
	<generatedFrom: #'GtRobocoderMetamodelNotifierDerive>>#announceTemplate'>
	announcer ifNotNil: [ :anAnnouncer | anAnnouncer announce: anAnnouncement ].

	"Dispatch anAnnouncement to the parent objects if they are assigned"
	self hasParentTasks
		ifTrue: [ self parentTasks announce: anAnnouncement ].
]

{ #category : #'api - description' }
MyTask >> description [
	"Return a not-null description assigned to the receiver"
	<objectGetter: #description>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ description notNil ]
		description: [ 'description should be initialized' ].

	^ description
]

{ #category : #'api - description' }
MyTask >> description: aDescription [
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

{ #category : #'api - done' }
MyTask >> done [
	"Return a not-null done assigned to the receiver"
	<objectGetter: #done>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ done notNil ]
		description: [ 'done should be initialized' ].

	^ done
]

{ #category : #'api - done' }
MyTask >> done: aDone [
	"Set a not-null done assigned to the receiver"
	<objectSetter: #done>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aDone notNil ]
		description: [ 'done must not be nil' ].

	done == aDone
		ifTrue: [ ^ self ].

	done ifNotNil: [ self unsubscribeFromDone ].
	done := aDone.

	self onDoneChanged.
	self subscribeToDone.
	self onPostDoneChanged
]

{ #category : #'api - description' }
MyTask >> hasDescription [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<objectTester: #description>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ description notNil
]

{ #category : #'api - done' }
MyTask >> hasDone [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<objectTester: #done>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ done notNil
]

{ #category : #'api - accessing' }
MyTask >> hasParentTasks [
	"Return true if the parent object is attached"
	<return: #Boolean>
	<parentObjectTester: #tasks>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectTesterTemplate'>

	^ parentTasks notNil
]

{ #category : #'api - testing' }
MyTask >> isLabel [
	"Return true if the receiver represents Label, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
MyTask >> isLabels [
	"Return true if the receiver represents Labels, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
MyTask >> isNote [
	"Return true if the receiver represents Note, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
MyTask >> isNotes [
	"Return true if the receiver represents Notes, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
MyTask >> isTask [
	"Return true if the receiver represents Task, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ true
]

{ #category : #'api - testing' }
MyTask >> isTasks [
	"Return true if the receiver represents Tasks, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
MyTask >> isUserStory [
	"Return true if the receiver represents UserStory, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - accessing' }
MyTask >> objectName [
	"Return a symbolic name of the receiver which helps to create various type based mappings.
	Note: The symbolic name of the object is the exact name that was used
	in the metamodel declaration from which this class was generated"
	<return: #Symbol>
	<generatedFrom: #'GtRobocoderMetamodelNameDerive>>#objectNameTemplate'>

	^ #task
]

{ #category : #'api - description' }
MyTask >> onDescriptionChanged [
	"Is sent when a new description is assigned to the receiver.
	Note: #onDescriptionChanged is sent before #subscribeToDescription
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostDescriptionChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : #'api - done' }
MyTask >> onDoneChanged [
	"Is sent when a new done is assigned to the receiver.
	Note: #onDoneChanged is sent before #subscribeToDone
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostDoneChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : #'api - description' }
MyTask >> onPostDescriptionChanged [
	"I am an optional hook method that is sent after #subscribeToDescription.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : #'api - done' }
MyTask >> onPostDoneChanged [
	"I am an optional hook method that is sent after #subscribeToDone.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : #'api - accessing' }
MyTask >> parentTasks [
	"Return a parent object which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<return: #MyTasks>
	<parentObjectGetter: #tasks>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectGetterTemplate'>

	self
		assert: [ parentTasks notNil ]
		description: [ 'Parent is not assigned!' ].

	^ parentTasks
]

{ #category : #'api - accessing' }
MyTask >> parentTasks: aMyTasks [
	"Assign a parent object (${class:MyTasks}$) which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<parentObjectSetter: #tasks>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectSetterTemplate'>

	self
		assert: [ aMyTasks notNil ]
		description: [ 'Parent view model must not be nil' ].

	parentTasks := aMyTasks
]

{ #category : #printing }
MyTask >> printOn: aStream [
	<generatedFrom: #'GtRobocoderMetamodelPrintDerive>>#printOnTemplate'>
	super printOn: aStream
]

{ #category : #'api - description' }
MyTask >> subscribeToDescription [
	"Is sent after a new description is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromDescription if the receiver subscribes to them"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : #'api - done' }
MyTask >> subscribeToDone [
	"Is sent after a new done is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromDone if the receiver subscribes to them"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : #'api - announcer' }
MyTask >> unsubscribe: anObject [
	"Unsubscribe all subscriptions of anObject from the receiver"

	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#unsubscribeTemplate'>
	^ announcer ifNotNil: [ :anAnnouncer | anAnnouncer unsubscribe: anObject ]
]

{ #category : #'api - description' }
MyTask >> unsubscribeFromDescription [
	"Is sent before a new description is assigned to the receiver.
	Objects that subscribe to description are required to implement this method."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

{ #category : #'api - done' }
MyTask >> unsubscribeFromDone [
	"Is sent before a new done is assigned to the receiver.
	Objects that subscribe to done are required to implement this method."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

{ #category : #'api - announcer' }
MyTask >> when: anAnnouncementClass do: aBlock [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenDoTemplate'>
	(announcer ifNil: [ announcer := Announcer new ])
		when: anAnnouncementClass do: aBlock
]

{ #category : #'api - announcer' }
MyTask >> when: anAnnouncementClass send: aSelector to: anObject [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenSendToTemplate'>
	(announcer ifNil: [ announcer := Announcer new ]) weak
		when: anAnnouncementClass send: aSelector to: anObject
]

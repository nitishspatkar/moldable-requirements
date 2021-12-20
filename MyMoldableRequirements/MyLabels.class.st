Class {
	#name : #MyLabels,
	#superclass : #Object,
	#instVars : [
		'labels',
		'parentUserStory',
		'announcer'
	],
	#category : 'MyMoldableRequirements-User Story - Models'
}

{ #category : #generated }
MyLabels >> addLabel: aLabel [
	"Add a given object as a child to the receiver and notify subscribers about it.
	Do nothing if an object is already one of my children."
	<objectAdder: #label>
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#addObjectTemplate'>

	(self includesLabel: aLabel)
		ifTrue: [ ^ self ].

	self labels add: aLabel.
	self onLabelAdded: aLabel
]

{ #category : #'api - announcer' }
MyLabels >> announce: anAnnouncement [
	<generatedFrom: #'GtRobocoderMetamodelNotifierDerive>>#announceTemplate'>
	announcer ifNotNil: [ :anAnnouncer | anAnnouncer announce: anAnnouncement ].

	"Dispatch anAnnouncement to the parent objects if they are assigned"
	self hasParentUserStory
		ifTrue: [ self parentUserStory announce: anAnnouncement ].
]

{ #category : #'private - instance creation' }
MyLabels >> createLabels [
	"For each child from the domain model create an object and return a resulting collection"
	<return: #Collection of: #MyLabel>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyTemplate>>#createChildObjectsTemplate'>

	^ self yourself yourself collect: [ :eachModel |
		| eachChild |
		eachChild := MyLabel new.
		eachChild parentLabels: self.
		
		eachChild ] as: OrderedCollection
]

{ #category : #'gt-extentions' }
MyLabels >> gtLabelListViewFor: aView [
	<gtView>
	<generatedFrom: #'GtRobocoderMetamodelPhlowListViewDerive>>#listForManyTemplate'>

	^ aView list
		priority: 5;
		title: 'Label';
		items: [ self labels ]
]

{ #category : #'api - labels' }
MyLabels >> hasLabels [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<objectTester: #labels>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ labels notNil
]

{ #category : #'api - accessing' }
MyLabels >> hasParentUserStory [
	"Return true if the parent object is attached"
	<return: #Boolean>
	<parentObjectTester: #userStory>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectTesterTemplate'>

	^ parentUserStory notNil
]

{ #category : #generated }
MyLabels >> includesLabel: aLabel [
	"Check and return true if a given child object exists among my children, false otherwise.
	The comparison happens by identity"
	<return: #Boolean>
	<childObjectFinder: #label>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyTemplate>>#includesObjectTemplate'>

	^ self labels anySatisfy: [ :eachLabel |
		eachLabel == aLabel ]
]

{ #category : #'api - testing' }
MyLabels >> isLabel [
	"Return true if the receiver represents Label, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
MyLabels >> isLabels [
	"Return true if the receiver represents Labels, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ true
]

{ #category : #'api - testing' }
MyLabels >> isNote [
	"Return true if the receiver represents Note, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
MyLabels >> isNotes [
	"Return true if the receiver represents Notes, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
MyLabels >> isTask [
	"Return true if the receiver represents Task, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
MyLabels >> isTasks [
	"Return true if the receiver represents Tasks, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
MyLabels >> isUserStory [
	"Return true if the receiver represents UserStory, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - accessing' }
MyLabels >> labels [
	"Return a collection of objects (${class:MyLabel}$) created for each child from the domain model.
	Note: The children are lazily instantiated."
	<return: #Collection of: #MyLabel>
	<childObjectGetter: #label>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyTemplate>>#childObjectsTemplate'>

	^  labels ifNil: [ labels := self createLabels ]
]

{ #category : #'api - labels' }
MyLabels >> labels: aLabels [
	"Set a not-null labels assigned to the receiver"
	<objectSetter: #labels>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aLabels notNil ]
		description: [ 'labels must not be nil' ].

	labels == aLabels
		ifTrue: [ ^ self ].

	labels ifNotNil: [ self unsubscribeFromLabels ].
	labels := aLabels.

	self onLabelsChanged.
	self subscribeToLabels.
	self onPostLabelsChanged
]

{ #category : #generated }
MyLabels >> notifyLabelAdded: aLabel [
	"Notifies that a given child object was added to the receiver"
	
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#notifyObjectAddedTemplate'>
	self announce: (MyLabelAddedAnnouncement new
		label: aLabel) 
]

{ #category : #generated }
MyLabels >> notifyLabelRemoved: aLabel [
	"Notifies that a given child object was removed from the receiver"
	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#notifyObjectRemovedTemplate'>
]

{ #category : #'api - accessing' }
MyLabels >> objectName [
	"Return a symbolic name of the receiver which helps to create various type based mappings.
	Note: The symbolic name of the object is the exact name that was used
	in the metamodel declaration from which this class was generated"
	<return: #Symbol>
	<generatedFrom: #'GtRobocoderMetamodelNameDerive>>#objectNameTemplate'>

	^ #labels
]

{ #category : #generated }
MyLabels >> onLabelAdded: aLabel [
	"Is sent after a given child object was added to the receiver"

	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#objectAddedHookTemplate'>
	self notifyLabelAdded: aLabel.
]

{ #category : #generated }
MyLabels >> onLabelRemoved: aLabel [
	"Is sent after a given child object was removed from the receiver"

	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#objectRemovedHookTemplate'>
	self notifyLabelRemoved: aLabel.
]

{ #category : #'api - labels' }
MyLabels >> onLabelsChanged [
	"Is sent when a new labels is assigned to the receiver.
	Note: #onLabelsChanged is sent before #subscribeToLabels
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostLabelsChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : #'api - labels' }
MyLabels >> onPostLabelsChanged [
	"I am an optional hook method that is sent after #subscribeToLabels.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : #'api - accessing' }
MyLabels >> parentUserStory [
	"Return a parent object which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<return: #MyUserStory>
	<parentObjectGetter: #userStory>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectGetterTemplate'>

	self
		assert: [ parentUserStory notNil ]
		description: [ 'Parent is not assigned!' ].

	^ parentUserStory
]

{ #category : #'api - accessing' }
MyLabels >> parentUserStory: aMyUserStory [
	"Assign a parent object (${class:MyUserStory}$) which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<parentObjectSetter: #userStory>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectSetterTemplate'>

	self
		assert: [ aMyUserStory notNil ]
		description: [ 'Parent view model must not be nil' ].

	parentUserStory := aMyUserStory
]

{ #category : #printing }
MyLabels >> printOn: aStream [
	<generatedFrom: #'GtRobocoderMetamodelPrintDerive>>#printOnTemplate'>
	super printOn: aStream
]

{ #category : #generated }
MyLabels >> removeLabel: aLabel [
	"Removed a given child object from the receiver and notify subscribers about it.
	Do nothing if an object is not one of my children."
	<objectAdder: #label>
	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#removeObjectTemplate'>

	(self includesLabel: aLabel)
		ifFalse: [ ^ self ].

	self labels remove: aLabel.
	self onLabelRemoved: aLabel
]

{ #category : #'api - labels' }
MyLabels >> subscribeToLabels [
	"Is sent after a new labels is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromLabels if the receiver subscribes to them"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : #'api - announcer' }
MyLabels >> unsubscribe: anObject [
	"Unsubscribe all subscriptions of anObject from the receiver"

	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#unsubscribeTemplate'>
	^ announcer ifNotNil: [ :anAnnouncer | anAnnouncer unsubscribe: anObject ]
]

{ #category : #'api - labels' }
MyLabels >> unsubscribeFromLabels [
	"Is sent before a new labels is assigned to the receiver.
	Objects that subscribe to labels are required to implement this method."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

{ #category : #'api - announcer' }
MyLabels >> when: anAnnouncementClass do: aBlock [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenDoTemplate'>
	(announcer ifNil: [ announcer := Announcer new ])
		when: anAnnouncementClass do: aBlock
]

{ #category : #'api - announcer' }
MyLabels >> when: anAnnouncementClass send: aSelector to: anObject [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenSendToTemplate'>
	(announcer ifNil: [ announcer := Announcer new ]) weak
		when: anAnnouncementClass send: aSelector to: anObject
]

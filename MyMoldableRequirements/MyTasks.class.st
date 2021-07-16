Class {
	#name : 'MyTasks',
	#superclass : 'Object',
	#instVars : [
		'tasks',
		'parentUserStory',
		'announcer'
	],
	#category : 'MyMoldableRequirements-User Story - Models'
}

{ #category : 'generated' }
MyTasks >> addTask: aTask [
	"Add a given object as a child to the receiver and notify subscribers about it.
	Do nothing if an object is already one of my children."
	<objectAdder: #task>
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#addObjectTemplate'>

	(self includesTask: aTask)
		ifTrue: [ ^ self ].

	self tasks add: aTask.
	self onTaskAdded: aTask
]

{ #category : 'api - announcer' }
MyTasks >> announce: anAnnouncement [
	<generatedFrom: #'GtRobocoderMetamodelNotifierDerive>>#announceTemplate'>
	announcer ifNotNil: [ :anAnnouncer | anAnnouncer announce: anAnnouncement ].

	"Dispatch anAnnouncement to the parent objects if they are assigned"
	self hasParentUserStory
		ifTrue: [ self parentUserStory announce: anAnnouncement ].
]

{ #category : 'private - instance creation' }
MyTasks >> createTasks [
	"For each child from the domain model create an object and return a resulting collection"
	<return: #Collection of: #MyTask>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyTemplate>>#createChildObjectsTemplate'>

	^ self yourself yourself collect: [ :eachModel |
		| eachChild |
		eachChild := MyTask new.
		eachChild parentTasks: self.
		
		eachChild ] as: OrderedCollection
]

{ #category : 'gt-extentions' }
MyTasks >> gtTaskListViewFor: aView [
	<gtView>
	<generatedFrom: #'GtRobocoderMetamodelPhlowListViewDerive>>#listForManyTemplate'>

	^ aView list
		priority: 5;
		title: 'Task';
		items: [ self tasks ]
]

{ #category : 'api - accessing' }
MyTasks >> hasParentUserStory [
	"Return true if the parent object is attached"
	<return: #Boolean>
	<parentObjectTester: #userStory>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectTesterTemplate'>

	^ parentUserStory notNil
]

{ #category : 'api - tasks' }
MyTasks >> hasTasks [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<objectTester: #tasks>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ tasks notNil
]

{ #category : 'generated' }
MyTasks >> includesTask: aTask [
	"Check and return true if a given child object exists among my children, false otherwise.
	The comparison happens by identity"
	<return: #Boolean>
	<childObjectFinder: #task>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyTemplate>>#includesObjectTemplate'>

	^ self tasks anySatisfy: [ :eachTask |
		eachTask == aTask ]
]

{ #category : 'api - testing' }
MyTasks >> isLabel [
	"Return true if the receiver represents Label, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : 'api - testing' }
MyTasks >> isLabels [
	"Return true if the receiver represents Labels, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : 'api - testing' }
MyTasks >> isNote [
	"Return true if the receiver represents Note, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : 'api - testing' }
MyTasks >> isNotes [
	"Return true if the receiver represents Notes, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : 'api - testing' }
MyTasks >> isTask [
	"Return true if the receiver represents Task, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : 'api - testing' }
MyTasks >> isTasks [
	"Return true if the receiver represents Tasks, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ true
]

{ #category : 'api - testing' }
MyTasks >> isUserStory [
	"Return true if the receiver represents UserStory, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : 'generated' }
MyTasks >> notifyTaskAdded: aTask [
	"Notifies that a given child object was added to the receiver"
	
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#notifyObjectAddedTemplate'>
	self announce: (MyTaskAddedAnnouncement new
		task: aTask) 
]

{ #category : 'generated' }
MyTasks >> notifyTaskRemoved: aTask [
	"Notifies that a given child object was removed from the receiver"
	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#notifyObjectRemovedTemplate'>
]

{ #category : 'api - accessing' }
MyTasks >> objectName [
	"Return a symbolic name of the receiver which helps to create various type based mappings.
	Note: The symbolic name of the object is the exact name that was used
	in the metamodel declaration from which this class was generated"
	<return: #Symbol>
	<generatedFrom: #'GtRobocoderMetamodelNameDerive>>#objectNameTemplate'>

	^ #tasks
]

{ #category : 'api - tasks' }
MyTasks >> onPostTasksChanged [
	"I am an optional hook method that is sent after #subscribeToTasks.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : 'generated' }
MyTasks >> onTaskAdded: aTask [
	"Is sent after a given child object was added to the receiver"

	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#objectAddedHookTemplate'>
	self notifyTaskAdded: aTask.
]

{ #category : 'generated' }
MyTasks >> onTaskRemoved: aTask [
	"Is sent after a given child object was removed from the receiver"

	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#objectRemovedHookTemplate'>
	self notifyTaskRemoved: aTask.
]

{ #category : 'api - tasks' }
MyTasks >> onTasksChanged [
	"Is sent when a new tasks is assigned to the receiver.
	Note: #onTasksChanged is sent before #subscribeToTasks
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostTasksChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : 'api - accessing' }
MyTasks >> parentUserStory [
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

{ #category : 'api - accessing' }
MyTasks >> parentUserStory: aMyUserStory [
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

{ #category : 'printing' }
MyTasks >> printOn: aStream [
	<generatedFrom: #'GtRobocoderMetamodelPrintDerive>>#printOnTemplate'>
	super printOn: aStream
]

{ #category : 'generated' }
MyTasks >> removeTask: aTask [
	"Removed a given child object from the receiver and notify subscribers about it.
	Do nothing if an object is not one of my children."
	<objectAdder: #task>
	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#removeObjectTemplate'>

	(self includesTask: aTask)
		ifFalse: [ ^ self ].

	self tasks remove: aTask.
	self onTaskRemoved: aTask
]

{ #category : 'api - tasks' }
MyTasks >> subscribeToTasks [
	"Is sent after a new tasks is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromTasks if the receiver subscribes to them"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : 'api - accessing' }
MyTasks >> tasks [
	"Return a collection of objects (${class:MyTask}$) created for each child from the domain model.
	Note: The children are lazily instantiated."
	<return: #Collection of: #MyTask>
	<childObjectGetter: #task>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyTemplate>>#childObjectsTemplate'>

	^  tasks ifNil: [ tasks := self createTasks ]
]

{ #category : 'api - tasks' }
MyTasks >> tasks: aTasks [
	"Set a not-null tasks assigned to the receiver"
	<objectSetter: #tasks>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aTasks notNil ]
		description: [ 'tasks must not be nil' ].

	tasks == aTasks
		ifTrue: [ ^ self ].

	tasks ifNotNil: [ self unsubscribeFromTasks ].
	tasks := aTasks.

	self onTasksChanged.
	self subscribeToTasks.
	self onPostTasksChanged
]

{ #category : 'api - announcer' }
MyTasks >> unsubscribe: anObject [
	"Unsubscribe all subscriptions of anObject from the receiver"

	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#unsubscribeTemplate'>
	^ announcer ifNotNil: [ :anAnnouncer | anAnnouncer unsubscribe: anObject ]
]

{ #category : 'api - tasks' }
MyTasks >> unsubscribeFromTasks [
	"Is sent before a new tasks is assigned to the receiver.
	Objects that subscribe to tasks are required to implement this method."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

{ #category : 'api - announcer' }
MyTasks >> when: anAnnouncementClass do: aBlock [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenDoTemplate'>
	(announcer ifNil: [ announcer := Announcer new ])
		when: anAnnouncementClass do: aBlock
]

{ #category : 'api - announcer' }
MyTasks >> when: anAnnouncementClass send: aSelector to: anObject [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenSendToTemplate'>
	(announcer ifNil: [ announcer := Announcer new ]) weak
		when: anAnnouncementClass send: aSelector to: anObject
]

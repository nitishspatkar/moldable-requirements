Trait {
	#name : #TMyWithTasks,
	#instVars : [
		'tasks'
	],
	#category : 'MyMoldableRequirements-User Story - Support'
}

{ #category : #'api - tasks' }
TMyWithTasks >> hasTasks [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<objectTester: #tasks>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ tasks notNil
]

{ #category : #'api - tasks' }
TMyWithTasks >> onPostTasksChanged [
	"I am an optional hook method that is sent after #subscribeToTasks.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : #'api - tasks' }
TMyWithTasks >> onTasksChanged [
	"Is sent when a new tasks is assigned to the receiver.
	Note: #onTasksChanged is sent before #subscribeToTasks
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostTasksChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : #'api - tasks' }
TMyWithTasks >> subscribeToTasks [
	"Is sent after a new tasks is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromTasks if the receiver subscribes to them"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : #'api - tasks' }
TMyWithTasks >> tasks [
	"Return a not-null tasks assigned to the receiver"
	<objectGetter: #tasks>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ tasks notNil ]
		description: [ 'tasks should be initialized' ].

	^ tasks
]

{ #category : #'api - tasks' }
TMyWithTasks >> tasks: aTasks [
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

{ #category : #'api - tasks' }
TMyWithTasks >> unsubscribeFromTasks [
	"Is sent before a new tasks is assigned to the receiver.
	Objects that subscribe to tasks are required to implement this method."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

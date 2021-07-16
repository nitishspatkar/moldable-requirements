Trait {
	#name : 'TMyWithTask',
	#instVars : [
		'task'
	],
	#category : 'MyMoldableRequirements-User Story - Support'
}

{ #category : 'api - task' }
TMyWithTask >> hasTask [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<objectTester: #task>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ task notNil
]

{ #category : 'api - task' }
TMyWithTask >> onPostTaskChanged [
	"I am an optional hook method that is sent after #subscribeToTask.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : 'api - task' }
TMyWithTask >> onTaskChanged [
	"Is sent when a new task is assigned to the receiver.
	Note: #onTaskChanged is sent before #subscribeToTask
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostTaskChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : 'api - task' }
TMyWithTask >> subscribeToTask [
	"Is sent after a new task is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromTask if the receiver subscribes to them"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : 'api - task' }
TMyWithTask >> task [
	"Return a not-null task assigned to the receiver"
	<objectGetter: #task>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ task notNil ]
		description: [ 'task should be initialized' ].

	^ task
]

{ #category : 'api - task' }
TMyWithTask >> task: aTask [
	"Set a not-null task assigned to the receiver"
	<objectSetter: #task>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aTask notNil ]
		description: [ 'task must not be nil' ].

	task == aTask
		ifTrue: [ ^ self ].

	task ifNotNil: [ self unsubscribeFromTask ].
	task := aTask.

	self onTaskChanged.
	self subscribeToTask.
	self onPostTaskChanged
]

{ #category : 'api - task' }
TMyWithTask >> unsubscribeFromTask [
	"Is sent before a new task is assigned to the receiver.
	Objects that subscribe to task are required to implement this method."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

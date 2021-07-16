Trait {
	#name : 'TMyWithUserStoryAnnotations',
	#instVars : [
		'userStoryAnnotations'
	],
	#category : 'MyMoldableRequirements-User Story - Support'
}

{ #category : 'api - user story annotations' }
TMyWithUserStoryAnnotations >> hasUserStoryAnnotations [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<modelTester: #annotations>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ userStoryAnnotations notNil
]

{ #category : 'api - user story annotations' }
TMyWithUserStoryAnnotations >> onPostUserStoryAnnotationsChanged [
	"I am an optional hook method that is sent after #subscribeToUserStoryAnnotations.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : 'api - user story annotations' }
TMyWithUserStoryAnnotations >> onUserStoryAnnotationsChanged [
	"Is sent when a new userStoryAnnotations is assigned to the receiver.
	Note: #onUserStoryAnnotationsChanged is sent before #subscribeToUserStoryAnnotations
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostUserStoryAnnotationsChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : 'api - user story annotations' }
TMyWithUserStoryAnnotations >> subscribeToUserStoryAnnotations [
	"Is sent after a new userStoryAnnotations is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromUserStoryAnnotations if the receiver subscribes to them"
	<modelSubscriber: #annotations>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : 'api - user story annotations' }
TMyWithUserStoryAnnotations >> unsubscribeFromUserStoryAnnotations [
	"Is sent before a new userStoryAnnotations is assigned to the receiver.
	Objects that subscribe to userStoryAnnotations are required to implement this method."
	<modelUnsubscriber: #annotations>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

{ #category : 'api - user story annotations' }
TMyWithUserStoryAnnotations >> userStoryAnnotations [
	"Return a not-null userStoryAnnotations assigned to the receiver"
	<modelGetter: #annotations>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ userStoryAnnotations notNil ]
		description: [ 'userStoryAnnotations should be initialized' ].

	^ userStoryAnnotations
]

{ #category : 'api - user story annotations' }
TMyWithUserStoryAnnotations >> userStoryAnnotations: aUserStoryAnnotations [
	"Set a not-null userStoryAnnotations assigned to the receiver"
	<modelSetter: #annotations>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aUserStoryAnnotations notNil ]
		description: [ 'userStoryAnnotations must not be nil' ].

	userStoryAnnotations == aUserStoryAnnotations
		ifTrue: [ ^ self ].

	userStoryAnnotations ifNotNil: [ self unsubscribeFromUserStoryAnnotations ].
	userStoryAnnotations := aUserStoryAnnotations.

	self onUserStoryAnnotationsChanged.
	self subscribeToUserStoryAnnotations.
	self onPostUserStoryAnnotationsChanged
]

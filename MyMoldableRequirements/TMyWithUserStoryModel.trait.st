Trait {
	#name : #TMyWithUserStoryModel,
	#instVars : [
		'userStoryModel'
	],
	#category : #'MyMoldableRequirements-Models'
}

{ #category : #'api - user story model' }
TMyWithUserStoryModel >> hasUserStoryModel [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<objectTester: #userStoryModel>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ userStoryModel notNil
]

{ #category : #'api - user story model' }
TMyWithUserStoryModel >> onPostUserStoryModelChanged [
	"I am an optional hook method that is sent after #subscribeToUserStoryModel.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : #'api - user story model' }
TMyWithUserStoryModel >> onUserStoryModelChanged [
	"Is sent when a new userStoryModel is assigned to the receiver.
	Note: #onUserStoryModelChanged is sent before #subscribeToUserStoryModel
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostUserStoryModelChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : #'api - user story model' }
TMyWithUserStoryModel >> subscribeToUserStoryModel [
	"Is sent after a new userStoryModel is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromUserStoryModel if the receiver subscribes to them"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : #'api - user story model' }
TMyWithUserStoryModel >> unsubscribeFromUserStoryModel [
	"Is sent before a new userStoryModel is assigned to the receiver.
	Objects that subscribe to userStoryModel are required to implement this method."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

{ #category : #'api - user story model' }
TMyWithUserStoryModel >> userStoryModel [
	"Return a not-null userStoryModel assigned to the receiver"
	<objectGetter: #userStoryModel>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ userStoryModel notNil ]
		description: [ 'userStoryModel should be initialized' ].

	^ userStoryModel
]

{ #category : #'api - user story model' }
TMyWithUserStoryModel >> userStoryModel: aUserStoryModel [
	"Set a not-null userStoryModel assigned to the receiver"
	<objectSetter: #userStoryModel>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aUserStoryModel notNil ]
		description: [ 'userStoryModel must not be nil' ].

	userStoryModel == aUserStoryModel
		ifTrue: [ ^ self ].

	userStoryModel ifNotNil: [ self unsubscribeFromUserStoryModel ].
	userStoryModel := aUserStoryModel.

	self onUserStoryModelChanged.
	self subscribeToUserStoryModel.
	self onPostUserStoryModelChanged
]

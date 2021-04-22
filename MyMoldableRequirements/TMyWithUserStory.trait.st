Trait {
	#name : #TMyWithUserStory,
	#instVars : [
		'userStory'
	],
	#category : #'MyMoldableRequirements-User Story - Support'
}

{ #category : #'api - user story' }
TMyWithUserStory >> hasUserStory [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<objectTester: #userStory>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ userStory notNil
]

{ #category : #'api - user story' }
TMyWithUserStory >> onPostUserStoryChanged [
	"I am an optional hook method that is sent after #subscribeToUserStory.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : #'api - user story' }
TMyWithUserStory >> onUserStoryChanged [
	"Is sent when a new userStory is assigned to the receiver.
	Note: #onUserStoryChanged is sent before #subscribeToUserStory
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostUserStoryChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : #'api - user story' }
TMyWithUserStory >> subscribeToUserStory [
	"Is sent after a new userStory is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromUserStory if the receiver subscribes to them"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : #'api - user story' }
TMyWithUserStory >> unsubscribeFromUserStory [
	"Is sent before a new userStory is assigned to the receiver.
	Objects that subscribe to userStory are required to implement this method."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

{ #category : #'api - user story' }
TMyWithUserStory >> userStory [
	"Return a not-null userStory assigned to the receiver"
	<objectGetter: #userStory>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ userStory notNil ]
		description: [ 'userStory should be initialized' ].

	^ userStory
]

{ #category : #'api - user story' }
TMyWithUserStory >> userStory: aUserStory [
	"Set a not-null userStory assigned to the receiver"
	<objectSetter: #userStory>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aUserStory notNil ]
		description: [ 'userStory must not be nil' ].

	userStory == aUserStory
		ifTrue: [ ^ self ].

	userStory ifNotNil: [ self unsubscribeFromUserStory ].
	userStory := aUserStory.

	self onUserStoryChanged.
	self subscribeToUserStory.
	self onPostUserStoryChanged
]

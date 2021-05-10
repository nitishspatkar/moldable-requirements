Trait {
	#name : #TMyWithUserStoryDomainConceptState,
	#instVars : [
		'userStoryDomainConceptState'
	],
	#category : #'MyMoldableRequirements-User Story - Support'
}

{ #category : #'api - user story domain concept state' }
TMyWithUserStoryDomainConceptState >> hasUserStoryDomainConceptState [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<modelTester: #domainConceptState>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ userStoryDomainConceptState notNil
]

{ #category : #'api - user story domain concept state' }
TMyWithUserStoryDomainConceptState >> onPostUserStoryDomainConceptStateChanged [
	"I am an optional hook method that is sent after #subscribeToUserStoryDomainConceptState.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : #'api - user story domain concept state' }
TMyWithUserStoryDomainConceptState >> onUserStoryDomainConceptStateChanged [
	"Is sent when a new userStoryDomainConceptState is assigned to the receiver.
	Note: #onUserStoryDomainConceptStateChanged is sent before #subscribeToUserStoryDomainConceptState
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostUserStoryDomainConceptStateChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : #'api - user story domain concept state' }
TMyWithUserStoryDomainConceptState >> subscribeToUserStoryDomainConceptState [
	"Is sent after a new userStoryDomainConceptState is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromUserStoryDomainConceptState if the receiver subscribes to them"
	<modelSubscriber: #domainConceptState>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : #'api - user story domain concept state' }
TMyWithUserStoryDomainConceptState >> unsubscribeFromUserStoryDomainConceptState [
	"Is sent before a new userStoryDomainConceptState is assigned to the receiver.
	Objects that subscribe to userStoryDomainConceptState are required to implement this method."
	<modelUnsubscriber: #domainConceptState>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

{ #category : #'api - user story domain concept state' }
TMyWithUserStoryDomainConceptState >> userStoryDomainConceptState [
	"Return a not-null userStoryDomainConceptState assigned to the receiver"
	<modelGetter: #domainConceptState>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ userStoryDomainConceptState notNil ]
		description: [ 'userStoryDomainConceptState should be initialized' ].

	^ userStoryDomainConceptState
]

{ #category : #'api - user story domain concept state' }
TMyWithUserStoryDomainConceptState >> userStoryDomainConceptState: aUserStoryDomainConceptState [
	"Set a not-null userStoryDomainConceptState assigned to the receiver"
	<modelSetter: #domainConceptState>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aUserStoryDomainConceptState notNil ]
		description: [ 'userStoryDomainConceptState must not be nil' ].

	userStoryDomainConceptState == aUserStoryDomainConceptState
		ifTrue: [ ^ self ].

	userStoryDomainConceptState ifNotNil: [ self unsubscribeFromUserStoryDomainConceptState ].
	userStoryDomainConceptState := aUserStoryDomainConceptState.

	self onUserStoryDomainConceptStateChanged.
	self subscribeToUserStoryDomainConceptState.
	self onPostUserStoryDomainConceptStateChanged
]

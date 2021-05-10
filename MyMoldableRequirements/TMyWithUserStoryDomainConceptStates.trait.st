Trait {
	#name : #TMyWithUserStoryDomainConceptStates,
	#instVars : [
		'userStoryDomainConceptStates'
	],
	#category : #'MyMoldableRequirements-User Story - Support'
}

{ #category : #'api - user story domain concept states' }
TMyWithUserStoryDomainConceptStates >> hasUserStoryDomainConceptStates [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<modelTester: #domainConceptStates>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ userStoryDomainConceptStates notNil
]

{ #category : #'api - user story domain concept states' }
TMyWithUserStoryDomainConceptStates >> onPostUserStoryDomainConceptStatesChanged [
	"I am an optional hook method that is sent after #subscribeToUserStoryDomainConceptStates.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : #'api - user story domain concept states' }
TMyWithUserStoryDomainConceptStates >> onUserStoryDomainConceptStatesChanged [
	"Is sent when a new userStoryDomainConceptStates is assigned to the receiver.
	Note: #onUserStoryDomainConceptStatesChanged is sent before #subscribeToUserStoryDomainConceptStates
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostUserStoryDomainConceptStatesChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : #'api - user story domain concept states' }
TMyWithUserStoryDomainConceptStates >> subscribeToUserStoryDomainConceptStates [
	"Is sent after a new userStoryDomainConceptStates is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromUserStoryDomainConceptStates if the receiver subscribes to them"
	<modelSubscriber: #domainConceptStates>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : #'api - user story domain concept states' }
TMyWithUserStoryDomainConceptStates >> unsubscribeFromUserStoryDomainConceptStates [
	"Is sent before a new userStoryDomainConceptStates is assigned to the receiver.
	Objects that subscribe to userStoryDomainConceptStates are required to implement this method."
	<modelUnsubscriber: #domainConceptStates>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

{ #category : #'api - user story domain concept states' }
TMyWithUserStoryDomainConceptStates >> userStoryDomainConceptStates [
	"Return a not-null userStoryDomainConceptStates assigned to the receiver"
	<modelGetter: #domainConceptStates>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ userStoryDomainConceptStates notNil ]
		description: [ 'userStoryDomainConceptStates should be initialized' ].

	^ userStoryDomainConceptStates
]

{ #category : #'api - user story domain concept states' }
TMyWithUserStoryDomainConceptStates >> userStoryDomainConceptStates: aUserStoryDomainConceptStates [
	"Set a not-null userStoryDomainConceptStates assigned to the receiver"
	<modelSetter: #domainConceptStates>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aUserStoryDomainConceptStates notNil ]
		description: [ 'userStoryDomainConceptStates must not be nil' ].

	userStoryDomainConceptStates == aUserStoryDomainConceptStates
		ifTrue: [ ^ self ].

	userStoryDomainConceptStates ifNotNil: [ self unsubscribeFromUserStoryDomainConceptStates ].
	userStoryDomainConceptStates := aUserStoryDomainConceptStates.

	self onUserStoryDomainConceptStatesChanged.
	self subscribeToUserStoryDomainConceptStates.
	self onPostUserStoryDomainConceptStatesChanged
]

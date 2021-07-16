Trait {
	#name : 'TMyWithUserStoryDomainConcepts',
	#instVars : [
		'userStoryDomainConcepts'
	],
	#category : 'MyMoldableRequirements-User Story - Support'
}

{ #category : 'api - user story domain concepts' }
TMyWithUserStoryDomainConcepts >> hasUserStoryDomainConcepts [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<modelTester: #domainConcepts>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ userStoryDomainConcepts notNil
]

{ #category : 'api - user story domain concepts' }
TMyWithUserStoryDomainConcepts >> onPostUserStoryDomainConceptsChanged [
	"I am an optional hook method that is sent after #subscribeToUserStoryDomainConcepts.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : 'api - user story domain concepts' }
TMyWithUserStoryDomainConcepts >> onUserStoryDomainConceptsChanged [
	"Is sent when a new userStoryDomainConcepts is assigned to the receiver.
	Note: #onUserStoryDomainConceptsChanged is sent before #subscribeToUserStoryDomainConcepts
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostUserStoryDomainConceptsChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : 'api - user story domain concepts' }
TMyWithUserStoryDomainConcepts >> subscribeToUserStoryDomainConcepts [
	"Is sent after a new userStoryDomainConcepts is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromUserStoryDomainConcepts if the receiver subscribes to them"
	<modelSubscriber: #domainConcepts>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : 'api - user story domain concepts' }
TMyWithUserStoryDomainConcepts >> unsubscribeFromUserStoryDomainConcepts [
	"Is sent before a new userStoryDomainConcepts is assigned to the receiver.
	Objects that subscribe to userStoryDomainConcepts are required to implement this method."
	<modelUnsubscriber: #domainConcepts>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

{ #category : 'api - user story domain concepts' }
TMyWithUserStoryDomainConcepts >> userStoryDomainConcepts [
	"Return a not-null userStoryDomainConcepts assigned to the receiver"
	<modelGetter: #domainConcepts>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ userStoryDomainConcepts notNil ]
		description: [ 'userStoryDomainConcepts should be initialized' ].

	^ userStoryDomainConcepts
]

{ #category : 'api - user story domain concepts' }
TMyWithUserStoryDomainConcepts >> userStoryDomainConcepts: aUserStoryDomainConcepts [
	"Set a not-null userStoryDomainConcepts assigned to the receiver"
	<modelSetter: #domainConcepts>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aUserStoryDomainConcepts notNil ]
		description: [ 'userStoryDomainConcepts must not be nil' ].

	userStoryDomainConcepts == aUserStoryDomainConcepts
		ifTrue: [ ^ self ].

	userStoryDomainConcepts ifNotNil: [ self unsubscribeFromUserStoryDomainConcepts ].
	userStoryDomainConcepts := aUserStoryDomainConcepts.

	self onUserStoryDomainConceptsChanged.
	self subscribeToUserStoryDomainConcepts.
	self onPostUserStoryDomainConceptsChanged
]

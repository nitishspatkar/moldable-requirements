Trait {
	#name : #TMyWithUserStoryDomainConcept,
	#instVars : [
		'userStoryDomainConcept'
	],
	#category : #'MyMoldableRequirements-User Story - Support'
}

{ #category : #'api - user story domain concept' }
TMyWithUserStoryDomainConcept >> hasUserStoryDomainConcept [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<modelTester: #domainConcept>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ userStoryDomainConcept notNil
]

{ #category : #'api - user story domain concept' }
TMyWithUserStoryDomainConcept >> onPostUserStoryDomainConceptChanged [
	"I am an optional hook method that is sent after #subscribeToUserStoryDomainConcept.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : #'api - user story domain concept' }
TMyWithUserStoryDomainConcept >> onUserStoryDomainConceptChanged [
	"Is sent when a new userStoryDomainConcept is assigned to the receiver.
	Note: #onUserStoryDomainConceptChanged is sent before #subscribeToUserStoryDomainConcept
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostUserStoryDomainConceptChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : #'api - user story domain concept' }
TMyWithUserStoryDomainConcept >> subscribeToUserStoryDomainConcept [
	"Is sent after a new userStoryDomainConcept is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromUserStoryDomainConcept if the receiver subscribes to them"
	<modelSubscriber: #domainConcept>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : #'api - user story domain concept' }
TMyWithUserStoryDomainConcept >> unsubscribeFromUserStoryDomainConcept [
	"Is sent before a new userStoryDomainConcept is assigned to the receiver.
	Objects that subscribe to userStoryDomainConcept are required to implement this method."
	<modelUnsubscriber: #domainConcept>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

{ #category : #'api - user story domain concept' }
TMyWithUserStoryDomainConcept >> userStoryDomainConcept [
	"Return a not-null userStoryDomainConcept assigned to the receiver"
	<modelGetter: #domainConcept>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ userStoryDomainConcept notNil ]
		description: [ 'userStoryDomainConcept should be initialized' ].

	^ userStoryDomainConcept
]

{ #category : #'api - user story domain concept' }
TMyWithUserStoryDomainConcept >> userStoryDomainConcept: aUserStoryDomainConcept [
	"Set a not-null userStoryDomainConcept assigned to the receiver"
	<modelSetter: #domainConcept>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aUserStoryDomainConcept notNil ]
		description: [ 'userStoryDomainConcept must not be nil' ].

	userStoryDomainConcept == aUserStoryDomainConcept
		ifTrue: [ ^ self ].

	userStoryDomainConcept ifNotNil: [ self unsubscribeFromUserStoryDomainConcept ].
	userStoryDomainConcept := aUserStoryDomainConcept.

	self onUserStoryDomainConceptChanged.
	self subscribeToUserStoryDomainConcept.
	self onPostUserStoryDomainConceptChanged
]

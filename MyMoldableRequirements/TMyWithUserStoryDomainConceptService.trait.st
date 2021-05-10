Trait {
	#name : #TMyWithUserStoryDomainConceptService,
	#instVars : [
		'userStoryDomainConceptService'
	],
	#category : #'MyMoldableRequirements-User Story - Support'
}

{ #category : #'api - user story domain concept service' }
TMyWithUserStoryDomainConceptService >> hasUserStoryDomainConceptService [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<modelTester: #domainConceptService>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ userStoryDomainConceptService notNil
]

{ #category : #'api - user story domain concept service' }
TMyWithUserStoryDomainConceptService >> onPostUserStoryDomainConceptServiceChanged [
	"I am an optional hook method that is sent after #subscribeToUserStoryDomainConceptService.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : #'api - user story domain concept service' }
TMyWithUserStoryDomainConceptService >> onUserStoryDomainConceptServiceChanged [
	"Is sent when a new userStoryDomainConceptService is assigned to the receiver.
	Note: #onUserStoryDomainConceptServiceChanged is sent before #subscribeToUserStoryDomainConceptService
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostUserStoryDomainConceptServiceChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : #'api - user story domain concept service' }
TMyWithUserStoryDomainConceptService >> subscribeToUserStoryDomainConceptService [
	"Is sent after a new userStoryDomainConceptService is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromUserStoryDomainConceptService if the receiver subscribes to them"
	<modelSubscriber: #domainConceptService>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : #'api - user story domain concept service' }
TMyWithUserStoryDomainConceptService >> unsubscribeFromUserStoryDomainConceptService [
	"Is sent before a new userStoryDomainConceptService is assigned to the receiver.
	Objects that subscribe to userStoryDomainConceptService are required to implement this method."
	<modelUnsubscriber: #domainConceptService>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

{ #category : #'api - user story domain concept service' }
TMyWithUserStoryDomainConceptService >> userStoryDomainConceptService [
	"Return a not-null userStoryDomainConceptService assigned to the receiver"
	<modelGetter: #domainConceptService>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ userStoryDomainConceptService notNil ]
		description: [ 'userStoryDomainConceptService should be initialized' ].

	^ userStoryDomainConceptService
]

{ #category : #'api - user story domain concept service' }
TMyWithUserStoryDomainConceptService >> userStoryDomainConceptService: aUserStoryDomainConceptService [
	"Set a not-null userStoryDomainConceptService assigned to the receiver"
	<modelSetter: #domainConceptService>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aUserStoryDomainConceptService notNil ]
		description: [ 'userStoryDomainConceptService must not be nil' ].

	userStoryDomainConceptService == aUserStoryDomainConceptService
		ifTrue: [ ^ self ].

	userStoryDomainConceptService ifNotNil: [ self unsubscribeFromUserStoryDomainConceptService ].
	userStoryDomainConceptService := aUserStoryDomainConceptService.

	self onUserStoryDomainConceptServiceChanged.
	self subscribeToUserStoryDomainConceptService.
	self onPostUserStoryDomainConceptServiceChanged
]

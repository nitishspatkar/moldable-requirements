Trait {
	#name : #TMyWithUserStoryDomainConceptServices,
	#instVars : [
		'userStoryDomainConceptServices'
	],
	#category : 'MyMoldableRequirements-User Story - Support'
}

{ #category : #'api - user story domain concept services' }
TMyWithUserStoryDomainConceptServices >> hasUserStoryDomainConceptServices [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<modelTester: #domainConceptServices>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ userStoryDomainConceptServices notNil
]

{ #category : #'api - user story domain concept services' }
TMyWithUserStoryDomainConceptServices >> onPostUserStoryDomainConceptServicesChanged [
	"I am an optional hook method that is sent after #subscribeToUserStoryDomainConceptServices.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : #'api - user story domain concept services' }
TMyWithUserStoryDomainConceptServices >> onUserStoryDomainConceptServicesChanged [
	"Is sent when a new userStoryDomainConceptServices is assigned to the receiver.
	Note: #onUserStoryDomainConceptServicesChanged is sent before #subscribeToUserStoryDomainConceptServices
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostUserStoryDomainConceptServicesChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : #'api - user story domain concept services' }
TMyWithUserStoryDomainConceptServices >> subscribeToUserStoryDomainConceptServices [
	"Is sent after a new userStoryDomainConceptServices is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromUserStoryDomainConceptServices if the receiver subscribes to them"
	<modelSubscriber: #domainConceptServices>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : #'api - user story domain concept services' }
TMyWithUserStoryDomainConceptServices >> unsubscribeFromUserStoryDomainConceptServices [
	"Is sent before a new userStoryDomainConceptServices is assigned to the receiver.
	Objects that subscribe to userStoryDomainConceptServices are required to implement this method."
	<modelUnsubscriber: #domainConceptServices>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

{ #category : #'api - user story domain concept services' }
TMyWithUserStoryDomainConceptServices >> userStoryDomainConceptServices [
	"Return a not-null userStoryDomainConceptServices assigned to the receiver"
	<modelGetter: #domainConceptServices>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ userStoryDomainConceptServices notNil ]
		description: [ 'userStoryDomainConceptServices should be initialized' ].

	^ userStoryDomainConceptServices
]

{ #category : #'api - user story domain concept services' }
TMyWithUserStoryDomainConceptServices >> userStoryDomainConceptServices: aUserStoryDomainConceptServices [
	"Set a not-null userStoryDomainConceptServices assigned to the receiver"
	<modelSetter: #domainConceptServices>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aUserStoryDomainConceptServices notNil ]
		description: [ 'userStoryDomainConceptServices must not be nil' ].

	userStoryDomainConceptServices == aUserStoryDomainConceptServices
		ifTrue: [ ^ self ].

	userStoryDomainConceptServices ifNotNil: [ self unsubscribeFromUserStoryDomainConceptServices ].
	userStoryDomainConceptServices := aUserStoryDomainConceptServices.

	self onUserStoryDomainConceptServicesChanged.
	self subscribeToUserStoryDomainConceptServices.
	self onPostUserStoryDomainConceptServicesChanged
]

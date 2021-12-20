Trait {
	#name : #TMyWithUserStoryAnnotation,
	#instVars : [
		'userStoryAnnotation'
	],
	#category : 'MyMoldableRequirements-User Story - Support'
}

{ #category : #'api - user story annotation' }
TMyWithUserStoryAnnotation >> hasUserStoryAnnotation [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<modelTester: #annotation>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ userStoryAnnotation notNil
]

{ #category : #'api - user story annotation' }
TMyWithUserStoryAnnotation >> onPostUserStoryAnnotationChanged [
	"I am an optional hook method that is sent after #subscribeToUserStoryAnnotation.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : #'api - user story annotation' }
TMyWithUserStoryAnnotation >> onUserStoryAnnotationChanged [
	"Is sent when a new userStoryAnnotation is assigned to the receiver.
	Note: #onUserStoryAnnotationChanged is sent before #subscribeToUserStoryAnnotation
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostUserStoryAnnotationChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : #'api - user story annotation' }
TMyWithUserStoryAnnotation >> subscribeToUserStoryAnnotation [
	"Is sent after a new userStoryAnnotation is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromUserStoryAnnotation if the receiver subscribes to them"
	<modelSubscriber: #annotation>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : #'api - user story annotation' }
TMyWithUserStoryAnnotation >> unsubscribeFromUserStoryAnnotation [
	"Is sent before a new userStoryAnnotation is assigned to the receiver.
	Objects that subscribe to userStoryAnnotation are required to implement this method."
	<modelUnsubscriber: #annotation>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

{ #category : #'api - user story annotation' }
TMyWithUserStoryAnnotation >> userStoryAnnotation [
	"Return a not-null userStoryAnnotation assigned to the receiver"
	<modelGetter: #annotation>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ userStoryAnnotation notNil ]
		description: [ 'userStoryAnnotation should be initialized' ].

	^ userStoryAnnotation
]

{ #category : #'api - user story annotation' }
TMyWithUserStoryAnnotation >> userStoryAnnotation: aUserStoryAnnotation [
	"Set a not-null userStoryAnnotation assigned to the receiver"
	<modelSetter: #annotation>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aUserStoryAnnotation notNil ]
		description: [ 'userStoryAnnotation must not be nil' ].

	userStoryAnnotation == aUserStoryAnnotation
		ifTrue: [ ^ self ].

	userStoryAnnotation ifNotNil: [ self unsubscribeFromUserStoryAnnotation ].
	userStoryAnnotation := aUserStoryAnnotation.

	self onUserStoryAnnotationChanged.
	self subscribeToUserStoryAnnotation.
	self onPostUserStoryAnnotationChanged
]

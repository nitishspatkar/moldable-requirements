Trait {
	#name : 'TMyWithLabel',
	#instVars : [
		'label'
	],
	#category : 'MyMoldableRequirements-User Story - Support'
}

{ #category : 'api - label' }
TMyWithLabel >> hasLabel [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<objectTester: #label>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ label notNil
]

{ #category : 'api - label' }
TMyWithLabel >> label [
	"Return a not-null label assigned to the receiver"
	<objectGetter: #label>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ label notNil ]
		description: [ 'label should be initialized' ].

	^ label
]

{ #category : 'api - label' }
TMyWithLabel >> label: aLabel [
	"Set a not-null label assigned to the receiver"
	<objectSetter: #label>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aLabel notNil ]
		description: [ 'label must not be nil' ].

	label == aLabel
		ifTrue: [ ^ self ].

	label ifNotNil: [ self unsubscribeFromLabel ].
	label := aLabel.

	self onLabelChanged.
	self subscribeToLabel.
	self onPostLabelChanged
]

{ #category : 'api - label' }
TMyWithLabel >> onLabelChanged [
	"Is sent when a new label is assigned to the receiver.
	Note: #onLabelChanged is sent before #subscribeToLabel
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostLabelChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : 'api - label' }
TMyWithLabel >> onPostLabelChanged [
	"I am an optional hook method that is sent after #subscribeToLabel.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : 'api - label' }
TMyWithLabel >> subscribeToLabel [
	"Is sent after a new label is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromLabel if the receiver subscribes to them"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : 'api - label' }
TMyWithLabel >> unsubscribeFromLabel [
	"Is sent before a new label is assigned to the receiver.
	Objects that subscribe to label are required to implement this method."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

Trait {
	#name : #TMyWithLabels,
	#instVars : [
		'labels'
	],
	#category : 'MyMoldableRequirements-User Story - Support'
}

{ #category : #'api - labels' }
TMyWithLabels >> hasLabels [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<objectTester: #labels>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ labels notNil
]

{ #category : #'api - labels' }
TMyWithLabels >> labels [
	"Return a not-null labels assigned to the receiver"
	<objectGetter: #labels>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ labels notNil ]
		description: [ 'labels should be initialized' ].

	^ labels
]

{ #category : #'api - labels' }
TMyWithLabels >> labels: aLabels [
	"Set a not-null labels assigned to the receiver"
	<objectSetter: #labels>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aLabels notNil ]
		description: [ 'labels must not be nil' ].

	labels == aLabels
		ifTrue: [ ^ self ].

	labels ifNotNil: [ self unsubscribeFromLabels ].
	labels := aLabels.

	self onLabelsChanged.
	self subscribeToLabels.
	self onPostLabelsChanged
]

{ #category : #'api - labels' }
TMyWithLabels >> onLabelsChanged [
	"Is sent when a new labels is assigned to the receiver.
	Note: #onLabelsChanged is sent before #subscribeToLabels
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostLabelsChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : #'api - labels' }
TMyWithLabels >> onPostLabelsChanged [
	"I am an optional hook method that is sent after #subscribeToLabels.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : #'api - labels' }
TMyWithLabels >> subscribeToLabels [
	"Is sent after a new labels is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromLabels if the receiver subscribes to them"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : #'api - labels' }
TMyWithLabels >> unsubscribeFromLabels [
	"Is sent before a new labels is assigned to the receiver.
	Objects that subscribe to labels are required to implement this method."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

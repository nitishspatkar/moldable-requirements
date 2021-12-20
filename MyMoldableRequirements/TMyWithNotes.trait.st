Trait {
	#name : #TMyWithNotes,
	#instVars : [
		'notes'
	],
	#category : 'MyMoldableRequirements-User Story - Support'
}

{ #category : #'api - notes' }
TMyWithNotes >> hasNotes [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<objectTester: #notes>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ notes notNil
]

{ #category : #'api - notes' }
TMyWithNotes >> notes [
	"Return a not-null notes assigned to the receiver"
	<objectGetter: #notes>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ notes notNil ]
		description: [ 'notes should be initialized' ].

	^ notes
]

{ #category : #'api - notes' }
TMyWithNotes >> notes: aNotes [
	"Set a not-null notes assigned to the receiver"
	<objectSetter: #notes>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aNotes notNil ]
		description: [ 'notes must not be nil' ].

	notes == aNotes
		ifTrue: [ ^ self ].

	notes ifNotNil: [ self unsubscribeFromNotes ].
	notes := aNotes.

	self onNotesChanged.
	self subscribeToNotes.
	self onPostNotesChanged
]

{ #category : #'api - notes' }
TMyWithNotes >> onNotesChanged [
	"Is sent when a new notes is assigned to the receiver.
	Note: #onNotesChanged is sent before #subscribeToNotes
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostNotesChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : #'api - notes' }
TMyWithNotes >> onPostNotesChanged [
	"I am an optional hook method that is sent after #subscribeToNotes.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : #'api - notes' }
TMyWithNotes >> subscribeToNotes [
	"Is sent after a new notes is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromNotes if the receiver subscribes to them"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : #'api - notes' }
TMyWithNotes >> unsubscribeFromNotes [
	"Is sent before a new notes is assigned to the receiver.
	Objects that subscribe to notes are required to implement this method."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

Trait {
	#name : 'TMyWithNote',
	#instVars : [
		'note'
	],
	#category : 'MyMoldableRequirements-User Story - Support'
}

{ #category : 'api - note' }
TMyWithNote >> hasNote [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<objectTester: #note>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ note notNil
]

{ #category : 'api - note' }
TMyWithNote >> note [
	"Return a not-null note assigned to the receiver"
	<objectGetter: #note>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ note notNil ]
		description: [ 'note should be initialized' ].

	^ note
]

{ #category : 'api - note' }
TMyWithNote >> note: aNote [
	"Set a not-null note assigned to the receiver"
	<objectSetter: #note>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aNote notNil ]
		description: [ 'note must not be nil' ].

	note == aNote
		ifTrue: [ ^ self ].

	note ifNotNil: [ self unsubscribeFromNote ].
	note := aNote.

	self onNoteChanged.
	self subscribeToNote.
	self onPostNoteChanged
]

{ #category : 'api - note' }
TMyWithNote >> onNoteChanged [
	"Is sent when a new note is assigned to the receiver.
	Note: #onNoteChanged is sent before #subscribeToNote
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostNoteChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : 'api - note' }
TMyWithNote >> onPostNoteChanged [
	"I am an optional hook method that is sent after #subscribeToNote.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : 'api - note' }
TMyWithNote >> subscribeToNote [
	"Is sent after a new note is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromNote if the receiver subscribes to them"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : 'api - note' }
TMyWithNote >> unsubscribeFromNote [
	"Is sent before a new note is assigned to the receiver.
	Objects that subscribe to note are required to implement this method."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

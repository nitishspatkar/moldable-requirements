Class {
	#name : 'MyUserStoryNotesElement',
	#superclass : 'BrVerticalPane',
	#traits : 'TMyWithNotes',
	#classTraits : 'TMyWithNotes classTrait',
	#instVars : [
		'list'
	],
	#category : 'MyMoldableRequirements-User Story - Views'
}

{ #category : 'initialization' }
MyUserStoryNotesElement >> initialize [
	super initialize.
	
	self matchParent.
	self padding: (BlInsets bottom: 20).
	
	list := BrSimpleList new
		itemStencil: [
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				beNormalSize;
				hMatchParent) ];

		itemDataBinder: [ :eachLabelElement :eachNoteModel |
			eachLabelElement text: eachNoteModel author , ' says: ' , eachNoteModel description ].
		
	self addChild:
		list.
	
]

{ #category : 'api - notes' }
MyUserStoryNotesElement >> onNotesChanged [
	"Is sent when a new notes is assigned to the receiver.
	Note: #onNotesChanged is sent before #subscribeToNotes
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostNotesChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
	
	list items: self notes notes
]

{ #category : 'api - user story model' }
MyUserStoryNotesElement >> onUserStoryModelChanged [
	"Is sent when a new userStoryModel is assigned to the receiver.
	Note: #onUserStoryModelChanged is sent before #subscribeToUserStoryModel
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostUserStoryModelChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
	notes notes: self userStoryModel notes
]

{ #category : 'api - notes' }
MyUserStoryNotesElement >> subscribeToNotes [
	"Is sent after a new notes is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromNotes if the receiver subscribes to them"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
	
	self notes
		when: MyNoteAddedAnnouncement
		send: #onNotesChanged
		to: self
]

{ #category : 'api - notes' }
MyUserStoryNotesElement >> unsubscribeFromNotes [
	"Is sent before a new notes is assigned to the receiver.
	Objects that subscribe to notes are required to implement this method."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
	
	self notes unsubscribe: self
]

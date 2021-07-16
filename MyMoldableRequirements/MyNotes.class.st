Class {
	#name : 'MyNotes',
	#superclass : 'Object',
	#instVars : [
		'notes',
		'parentUserStory',
		'announcer'
	],
	#category : 'MyMoldableRequirements-User Story - Models'
}

{ #category : 'generated' }
MyNotes >> addNote: aNote [
	"Add a given object as a child to the receiver and notify subscribers about it.
	Do nothing if an object is already one of my children."
	<objectAdder: #note>
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#addObjectTemplate'>

	(self includesNote: aNote)
		ifTrue: [ ^ self ].

	self notes add: aNote.
	self onNoteAdded: aNote
]

{ #category : 'api - announcer' }
MyNotes >> announce: anAnnouncement [
	<generatedFrom: #'GtRobocoderMetamodelNotifierDerive>>#announceTemplate'>
	announcer ifNotNil: [ :anAnnouncer | anAnnouncer announce: anAnnouncement ].

	"Dispatch anAnnouncement to the parent objects if they are assigned"
	self hasParentUserStory
		ifTrue: [ self parentUserStory announce: anAnnouncement ].
]

{ #category : 'private - instance creation' }
MyNotes >> createNotes [
	"For each child from the domain model create an object and return a resulting collection"
	<return: #Collection of: #MyNote>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyTemplate>>#createChildObjectsTemplate'>

	^ self yourself yourself collect: [ :eachModel |
		| eachChild |
		eachChild := MyNote new.
		eachChild parentNotes: self.
		
		eachChild ] as: OrderedCollection
]

{ #category : 'gt-extentions' }
MyNotes >> gtNoteListViewFor: aView [
	<gtView>
	<generatedFrom: #'GtRobocoderMetamodelPhlowListViewDerive>>#listForManyTemplate'>

	^ aView list
		priority: 5;
		title: 'Note';
		items: [ self notes ]
]

{ #category : 'api - notes' }
MyNotes >> hasNotes [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<objectTester: #notes>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ notes notNil
]

{ #category : 'api - accessing' }
MyNotes >> hasParentUserStory [
	"Return true if the parent object is attached"
	<return: #Boolean>
	<parentObjectTester: #userStory>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectTesterTemplate'>

	^ parentUserStory notNil
]

{ #category : 'generated' }
MyNotes >> includesNote: aNote [
	"Check and return true if a given child object exists among my children, false otherwise.
	The comparison happens by identity"
	<return: #Boolean>
	<childObjectFinder: #note>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyTemplate>>#includesObjectTemplate'>

	^ self notes anySatisfy: [ :eachNote |
		eachNote == aNote ]
]

{ #category : 'initialization' }
MyNotes >> initialize [
	super initialize.
	
	notes := OrderedCollection new
]

{ #category : 'api - testing' }
MyNotes >> isLabel [
	"Return true if the receiver represents Label, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : 'api - testing' }
MyNotes >> isLabels [
	"Return true if the receiver represents Labels, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : 'api - testing' }
MyNotes >> isNote [
	"Return true if the receiver represents Note, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : 'api - testing' }
MyNotes >> isNotes [
	"Return true if the receiver represents Notes, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ true
]

{ #category : 'api - testing' }
MyNotes >> isTask [
	"Return true if the receiver represents Task, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : 'api - testing' }
MyNotes >> isTasks [
	"Return true if the receiver represents Tasks, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : 'api - testing' }
MyNotes >> isUserStory [
	"Return true if the receiver represents UserStory, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : 'api - accessing' }
MyNotes >> notes [
	"Return a collection of objects (${class:MyNote}$) created for each child from the domain model.
	Note: The children are lazily instantiated."
	<return: #Collection of: #MyNote>
	<childObjectGetter: #note>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyTemplate>>#childObjectsTemplate'>

	^  notes ifNil: [ notes := self createNotes ]
]

{ #category : 'api - notes' }
MyNotes >> notes: aNotes [
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

{ #category : 'generated' }
MyNotes >> notifyNoteAdded: aNote [
	"Notifies that a given child object was added to the receiver"
	
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#notifyObjectAddedTemplate'>
	self announce: (MyNoteAddedAnnouncement new
		note: aNote) 
]

{ #category : 'generated' }
MyNotes >> notifyNoteRemoved: aNote [
	"Notifies that a given child object was removed from the receiver"
	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#notifyObjectRemovedTemplate'>
]

{ #category : 'api - accessing' }
MyNotes >> objectName [
	"Return a symbolic name of the receiver which helps to create various type based mappings.
	Note: The symbolic name of the object is the exact name that was used
	in the metamodel declaration from which this class was generated"
	<return: #Symbol>
	<generatedFrom: #'GtRobocoderMetamodelNameDerive>>#objectNameTemplate'>

	^ #notes
]

{ #category : 'generated' }
MyNotes >> onNoteAdded: aNote [
	"Is sent after a given child object was added to the receiver"

	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#objectAddedHookTemplate'>
	self notifyNoteAdded: aNote.
	aNote parentNotes: self
]

{ #category : 'generated' }
MyNotes >> onNoteRemoved: aNote [
	"Is sent after a given child object was removed from the receiver"

	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#objectRemovedHookTemplate'>
	self notifyNoteRemoved: aNote.
]

{ #category : 'api - notes' }
MyNotes >> onNotesChanged [
	"Is sent when a new notes is assigned to the receiver.
	Note: #onNotesChanged is sent before #subscribeToNotes
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostNotesChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : 'api - notes' }
MyNotes >> onPostNotesChanged [
	"I am an optional hook method that is sent after #subscribeToNotes.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : 'api - accessing' }
MyNotes >> parentUserStory [
	"Return a parent object which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<return: #MyUserStory>
	<parentObjectGetter: #userStory>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectGetterTemplate'>

	self
		assert: [ parentUserStory notNil ]
		description: [ 'Parent is not assigned!' ].

	^ parentUserStory
]

{ #category : 'api - accessing' }
MyNotes >> parentUserStory: aMyUserStory [
	"Assign a parent object (${class:MyUserStory}$) which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<parentObjectSetter: #userStory>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectSetterTemplate'>

	self
		assert: [ aMyUserStory notNil ]
		description: [ 'Parent view model must not be nil' ].

	parentUserStory := aMyUserStory
]

{ #category : 'printing' }
MyNotes >> printOn: aStream [
	<generatedFrom: #'GtRobocoderMetamodelPrintDerive>>#printOnTemplate'>
	super printOn: aStream
]

{ #category : 'generated' }
MyNotes >> removeNote: aNote [
	"Removed a given child object from the receiver and notify subscribers about it.
	Do nothing if an object is not one of my children."
	<objectAdder: #note>
	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#removeObjectTemplate'>

	(self includesNote: aNote)
		ifFalse: [ ^ self ].

	self notes remove: aNote.
	self onNoteRemoved: aNote
]

{ #category : 'api - notes' }
MyNotes >> subscribeToNotes [
	"Is sent after a new notes is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromNotes if the receiver subscribes to them"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : 'api - announcer' }
MyNotes >> unsubscribe: anObject [
	"Unsubscribe all subscriptions of anObject from the receiver"

	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#unsubscribeTemplate'>
	^ announcer ifNotNil: [ :anAnnouncer | anAnnouncer unsubscribe: anObject ]
]

{ #category : 'api - notes' }
MyNotes >> unsubscribeFromNotes [
	"Is sent before a new notes is assigned to the receiver.
	Objects that subscribe to notes are required to implement this method."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

{ #category : 'api - announcer' }
MyNotes >> when: anAnnouncementClass do: aBlock [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenDoTemplate'>
	(announcer ifNil: [ announcer := Announcer new ])
		when: anAnnouncementClass do: aBlock
]

{ #category : 'api - announcer' }
MyNotes >> when: anAnnouncementClass send: aSelector to: anObject [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenSendToTemplate'>
	(announcer ifNil: [ announcer := Announcer new ]) weak
		when: anAnnouncementClass send: aSelector to: anObject
]

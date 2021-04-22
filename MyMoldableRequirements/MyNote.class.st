Class {
	#name : #MyNote,
	#superclass : #Object,
	#instVars : [
		'id',
		'author',
		'description',
		'parentNotes',
		'announcer'
	],
	#category : #'MyMoldableRequirements-User Story - Models'
}

{ #category : #'instance creation' }
MyNote class >> fromRawData: notesDict [ 
	^ self
		id: (notesDict at: #id)
		description: (notesDict at: #description)
		author: (notesDict at: #author)
]

{ #category : #'instance creation' }
MyNote class >> id: aNumber description: aString author: anotherString [
	^ self new
		id: aNumber;
		description: aString;
		author: anotherString;
		yourself 
]

{ #category : #'api - announcer' }
MyNote >> announce: anAnnouncement [
	<generatedFrom: #'GtRobocoderMetamodelNotifierDerive>>#announceTemplate'>
	announcer ifNotNil: [ :anAnnouncer | anAnnouncer announce: anAnnouncement ].

	"Dispatch anAnnouncement to the parent objects if they are assigned"
	self hasParentNotes
		ifTrue: [ self parentNotes announce: anAnnouncement ].
]

{ #category : #converting }
MyNote >> asFormElement: aBlock [
	"an epic presents itself as a form to be filled and save as an object"

	| label textElementDescription authorElementDescription |
	textElementDescription := GtDocument new asElementWithoutSaveAction
		vFitContent;
		hMatchParent;
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 2);
		padding: (BlInsets all: 3);
		margin: (BlInsets top: 3 bottom: 3);
		geometry: (BlRectangle cornerRadius: 5).
	authorElementDescription := GtDocument new asElementWithoutSaveAction
		vFitContent;
		hMatchParent;
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 2);
		padding: (BlInsets all: 3);
		margin: (BlInsets top: 3 bottom: 3);
		geometry: (BlRectangle cornerRadius: 5).
	^ BlElement new
		layout: BlLinearLayout vertical;
		padding: (BlInsets all: 5);
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal exact: 300 ];
		addChild:
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				text: 'Note:';
				beNormalSize);
		addChild: textElementDescription;
		addChild:
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				text: 'Your Name:';
				beNormalSize);
		addChild: authorElementDescription;
		addChild:
			(BrButton new
				aptitude: BrGlamorousButtonWithIconAptitude;
				icon: BrGlamorousVectorIcons accept;
				beSmallSize;
				label: 'Save';
				action: [ 
				description := textElementDescription document text asString.
				author := authorElementDescription document text asString.
				self assert:[author notEmpty].
					"The following line means that when we click the save button, the arguement i.e., aBlock is evaluated"
					aBlock value ];
				yourself);
		yourself
]

{ #category : #'api - accessing' }
MyNote >> author [
	^ author
]

{ #category : #accessing }
MyNote >> author: anObject [
	author := anObject
]

{ #category : #'api - description' }
MyNote >> description [
	"Return a not-null description assigned to the receiver"
	<objectGetter: #description>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectGetterTemplate'>
	self
		assert: [ description notNil ]
		description: [ 'description should be initialized' ].

	^ description
]

{ #category : #'api - description' }
MyNote >> description: aDescription [
	"Set a not-null description assigned to the receiver"
	<objectSetter: #description>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#objectSetterTemplate'>
	self
		assert: [ aDescription notNil ]
		description: [ 'description must not be nil' ].

	description == aDescription
		ifTrue: [ ^ self ].

	description ifNotNil: [ self unsubscribeFromDescription ].
	description := aDescription.

	self onDescriptionChanged.
	self subscribeToDescription.
	self onPostDescriptionChanged
]

{ #category : #'api - description' }
MyNote >> hasDescription [
	"Return a true if nil is assigned to the receiver, false otherwise"
	<return: #Boolean>
	<objectTester: #description>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#hasObjectTemplate'>

	^ description notNil
]

{ #category : #'api - accessing' }
MyNote >> hasParentNotes [
	"Return true if the parent object is attached"
	<return: #Boolean>
	<parentObjectTester: #notes>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectTesterTemplate'>

	^ parentNotes notNil
]

{ #category : #accessing }
MyNote >> id [
	^ id
]

{ #category : #accessing }
MyNote >> id: anObject [
	id := anObject
]

{ #category : #initialization }
MyNote >> initialize [
	super initialize.
	
	description := ''.
	author := 'Unknown Author'
]

{ #category : #'api - testing' }
MyNote >> isLabel [
	"Return true if the receiver represents Label, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
MyNote >> isLabels [
	"Return true if the receiver represents Labels, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
MyNote >> isNote [
	"Return true if the receiver represents Note, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ true
]

{ #category : #'api - testing' }
MyNote >> isNotes [
	"Return true if the receiver represents Notes, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
MyNote >> isTask [
	"Return true if the receiver represents Task, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
MyNote >> isTasks [
	"Return true if the receiver represents Tasks, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
MyNote >> isUserStory [
	"Return true if the receiver represents UserStory, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - accessing' }
MyNote >> objectName [
	"Return a symbolic name of the receiver which helps to create various type based mappings.
	Note: The symbolic name of the object is the exact name that was used
	in the metamodel declaration from which this class was generated"
	<return: #Symbol>
	<generatedFrom: #'GtRobocoderMetamodelNameDerive>>#objectNameTemplate'>

	^ #note
]

{ #category : #'api - description' }
MyNote >> onDescriptionChanged [
	"Is sent when a new description is assigned to the receiver.
	Note: #onDescriptionChanged is sent before #subscribeToDescription
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostDescriptionChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
]

{ #category : #'api - description' }
MyNote >> onPostDescriptionChanged [
	"I am an optional hook method that is sent after #subscribeToDescription.
	I do nothing by default but allow users to perform update operations when a receiver object is already
	subscribed to announcements."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onPostObjectChangedTemplate'>
]

{ #category : #'api - accessing' }
MyNote >> parentNotes [
	"Return a parent object which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<return: #MyNotes>
	<parentObjectGetter: #notes>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectGetterTemplate'>

	self
		assert: [ parentNotes notNil ]
		description: [ 'Parent is not assigned!' ].

	^ parentNotes
]

{ #category : #'api - accessing' }
MyNote >> parentNotes: aMyNotes [
	"Assign a parent object (${class:MyNotes}$) which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<parentObjectSetter: #notes>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectSetterTemplate'>

	self
		assert: [ aMyNotes notNil ]
		description: [ 'Parent view model must not be nil' ].

	parentNotes := aMyNotes
]

{ #category : #printing }
MyNote >> printOn: aStream [
	aStream nextPutAll: description
]

{ #category : #'api - description' }
MyNote >> subscribeToDescription [
	"Is sent after a new description is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromDescription if the receiver subscribes to them"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
]

{ #category : #'api - announcer' }
MyNote >> unsubscribe: anObject [
	"Unsubscribe all subscriptions of anObject from the receiver"

	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#unsubscribeTemplate'>
	^ announcer ifNotNil: [ :anAnnouncer | anAnnouncer unsubscribe: anObject ]
]

{ #category : #'api - description' }
MyNote >> unsubscribeFromDescription [
	"Is sent before a new description is assigned to the receiver.
	Objects that subscribe to description are required to implement this method."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
]

{ #category : #'api - announcer' }
MyNote >> when: anAnnouncementClass do: aBlock [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenDoTemplate'>
	(announcer ifNil: [ announcer := Announcer new ])
		when: anAnnouncementClass do: aBlock
]

{ #category : #'api - announcer' }
MyNote >> when: anAnnouncementClass send: aSelector to: anObject [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenSendToTemplate'>
	(announcer ifNil: [ announcer := Announcer new ]) weak
		when: anAnnouncementClass send: aSelector to: anObject
]

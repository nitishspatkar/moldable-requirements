Class {
	#name : #MyUserStoryDomainConceptStates,
	#superclass : #Object,
	#instVars : [
		'parentUserStoryDomainConcept',
		'userStoryDomainConceptStates',
		'announcer'
	],
	#category : #'MyMoldableRequirements-User Story - Models'
}

{ #category : #'api - adding' }
MyUserStoryDomainConceptStates >> addUserStoryDomainConceptState: aUserStoryDomainConceptState [
	"Add a given object as a child to the receiver and notify subscribers about it.
	Do nothing if an object is already one of my children."
	<objectAdder: #domainConceptState>
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#addObjectTemplate'>

	(self includesUserStoryDomainConceptStates: aUserStoryDomainConceptState)
		ifTrue: [ ^ self ].
	
	
	self userStoryDomainConceptStates add: aUserStoryDomainConceptState.
	self onUserStoryDomainConceptStateAdded: aUserStoryDomainConceptState
]

{ #category : #'api - announcer' }
MyUserStoryDomainConceptStates >> announce: anAnnouncement [
	<generatedFrom: #'GtRobocoderMetamodelNotifierDerive>>#announceTemplate'>
	announcer ifNotNil: [ :anAnnouncer | anAnnouncer announce: anAnnouncement ].

	"Dispatch anAnnouncement to the parent objects if they are assigned"
	self hasParentUserStoryDomainConcept
		ifTrue: [ self parentUserStoryDomainConcept announce: anAnnouncement ].
]

{ #category : #'gt-extentions' }
MyUserStoryDomainConceptStates >> gtDomainConceptStateListViewFor: aView [
	<gtView>
	<generatedFrom: #'GtRobocoderMetamodelPhlowListViewDerive>>#listForManyTemplate'>

	^ aView list
		priority: 5;
		title: 'DomainConceptState';
		items: [ self userStoryDomainConceptStates ]
]

{ #category : #'api - testing' }
MyUserStoryDomainConceptStates >> hasParentUserStoryDomainConcept [
	"Return true if the parent object is attached"
	<return: #Boolean>
	<parentObjectTester: #domainConcept>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectTesterTemplate'>

	^ parentUserStoryDomainConcept notNil
]

{ #category : #'api - testing' }
MyUserStoryDomainConceptStates >> includesUserStoryDomainConceptStates: aUserStoryDomainConceptStates [
	"Check and return true if a given child object exists among my children, false otherwise.
	The comparison happens by identity"
	<return: #Boolean>
	<childObjectFinder: #domainConceptState>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithoutModelTemplate>>#includesObjectTemplate'>

	^ self userStoryDomainConceptStates anySatisfy: [ :eachUserStoryDomainConceptStates |
		eachUserStoryDomainConceptStates == aUserStoryDomainConceptStates ]
]

{ #category : #'private - notifying' }
MyUserStoryDomainConceptStates >> notifyUserStoryDomainConceptStateAdded: aUserStoryDomainConceptState [
	"Notifies that a given child object was added to the receiver"
	
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#notifyObjectAddedTemplate'>
	self announce: (MyUserStoryDomainConceptStateAddedAnnouncement new
		userStoryDomainConceptState: aUserStoryDomainConceptState) 
]

{ #category : #'private - notifying' }
MyUserStoryDomainConceptStates >> notifyUserStoryDomainConceptStateRemoved: aUserStoryDomainConceptState [
	"Notifies that a given child object was removed from the receiver"
	
	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#notifyObjectRemovedTemplate'>
	self announce: (MyUserStoryDomainConceptStateRemovedAnnouncement new
		userStoryDomainConceptState: aUserStoryDomainConceptState) 
]

{ #category : #'api - adding' }
MyUserStoryDomainConceptStates >> onUserStoryDomainConceptStateAdded: aUserStoryDomainConceptState [
	"Is sent after a given child object was added to the receiver"
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#objectAddedHookTemplate'>
	aUserStoryDomainConceptState parentUserStoryDomainConceptStates: self.
	self notifyUserStoryDomainConceptStateAdded: aUserStoryDomainConceptState.
]

{ #category : #'api - adding' }
MyUserStoryDomainConceptStates >> onUserStoryDomainConceptStateRemoved: aUserStoryDomainConceptState [
	"Is sent after a given child object was removed from the receiver"

	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#objectRemovedHookTemplate'>
	self notifyUserStoryDomainConceptStateRemoved: aUserStoryDomainConceptState.
]

{ #category : #'api - accessing' }
MyUserStoryDomainConceptStates >> parentUserStoryDomainConcept [
	"Return a parent object which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<return: #MyUserStoryDomainConcept>
	<parentObjectGetter: #domainConcept>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectGetterTemplate'>

	self
		assert: [ parentUserStoryDomainConcept notNil ]
		description: [ 'Parent is not assigned!' ].

	^ parentUserStoryDomainConcept
]

{ #category : #'api - accessing' }
MyUserStoryDomainConceptStates >> parentUserStoryDomainConcept: aMyUserStoryDomainConcept [
	"Assign a parent object (${class:MyUserStoryDomainConcept}$) which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<parentObjectSetter: #domainConcept>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectSetterTemplate'>

	self
		assert: [ aMyUserStoryDomainConcept notNil ]
		description: [ 'Parent view model must not be nil' ].

	parentUserStoryDomainConcept := aMyUserStoryDomainConcept
]

{ #category : #printing }
MyUserStoryDomainConceptStates >> printOn: aStream [
	<generatedFrom: #'GtRobocoderMetamodelPrintDerive>>#printOnTemplate'>
	super printOn: aStream
]

{ #category : #'api - adding' }
MyUserStoryDomainConceptStates >> removeUserStoryDomainConceptState: aUserStoryDomainConceptState [
	"Remove a given object as a child to the receiver and notify subscribers about it.
	Do nothing if an object is already one of my children."
	<objectAdder: #domainConceptState>
	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#removeObjectTemplate'>

	(self includesUserStoryDomainConceptStates: aUserStoryDomainConceptState)
		ifFalse: [ ^ self ].
	
	
	self userStoryDomainConceptStates
		remove: aUserStoryDomainConceptState
		ifAbsent: [ ^ self ].
	self onUserStoryDomainConceptStateRemoved: aUserStoryDomainConceptState
]

{ #category : #'api - announcer' }
MyUserStoryDomainConceptStates >> unsubscribe: anObject [
	"Unsubscribe all subscriptions of anObject from the receiver"

	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#unsubscribeTemplate'>
	^ announcer ifNotNil: [ :anAnnouncer | anAnnouncer unsubscribe: anObject ]
]

{ #category : #'api - accessing' }
MyUserStoryDomainConceptStates >> userStoryDomainConceptStates [
	"Return a collection of objects (${class:MyUserStoryDomainConceptState}$) created for each child from the domain model.
	Note: The children are lazily instantiated."
	<return: #Collection of: #MyUserStoryDomainConceptState>
	<childObjectGetter: #domainConceptState>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithoutModelTemplate>>#childObjectsGetterTemplate'>

	^  userStoryDomainConceptStates ifNil: [ userStoryDomainConceptStates := OrderedCollection new ]
]

{ #category : #'api - accessing' }
MyUserStoryDomainConceptStates >> userStoryDomainConceptStates: aCollectionOfMyUserStoryDomainConceptState [
	"Silently assign a collection of given objects as my children without triggering any event. This is part of the #initialization protocol."
	<modelSetter: #domainConceptStates>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithoutModelTemplate>>#childObjectsSetterTemplate'>
	
	userStoryDomainConceptStates := aCollectionOfMyUserStoryDomainConceptState asOrderedCollection.
	userStoryDomainConceptStates do: [ :eachMyUserStoryDomainConceptState |
		eachMyUserStoryDomainConceptState parentUserStoryDomainConceptStates: self ]
]

{ #category : #'api - announcer' }
MyUserStoryDomainConceptStates >> when: anAnnouncementClass do: aBlock [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenDoTemplate'>
	^ (announcer ifNil: [ announcer := Announcer new ])
		when: anAnnouncementClass do: aBlock
]

{ #category : #'api - announcer' }
MyUserStoryDomainConceptStates >> when: anAnnouncementClass send: aSelector to: anObject [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenSendToTemplate'>
	^ (announcer ifNil: [ announcer := Announcer new ]) weak
		when: anAnnouncementClass send: aSelector to: anObject
]

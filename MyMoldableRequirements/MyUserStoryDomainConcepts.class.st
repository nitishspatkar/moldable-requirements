Class {
	#name : #MyUserStoryDomainConcepts,
	#superclass : #Object,
	#instVars : [
		'userStoryDomainConcepts',
		'announcer'
	],
	#category : #'MyMoldableRequirements-User Story - Models'
}

{ #category : #'api - adding' }
MyUserStoryDomainConcepts >> addUserStoryDomainConcept: aUserStoryDomainConcept [
	"Add a given object as a child to the receiver and notify subscribers about it.
	Do nothing if an object is already one of my children."
	<objectAdder: #domainConcept>
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#addObjectTemplate'>

	(self includesUserStoryDomainConcepts: aUserStoryDomainConcept)
		ifTrue: [ ^ self ].
	
	
	self userStoryDomainConcepts add: aUserStoryDomainConcept.
	self onUserStoryDomainConceptAdded: aUserStoryDomainConcept
]

{ #category : #'api - announcer' }
MyUserStoryDomainConcepts >> announce: anAnnouncement [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#announceTemplate'>
	announcer ifNotNil: [ :anAnnouncer | anAnnouncer announce: anAnnouncement ]
]

{ #category : #'gt-extentions' }
MyUserStoryDomainConcepts >> gtDomainConceptListViewFor: aView [
	<gtView>
	<generatedFrom: #'GtRobocoderMetamodelPhlowListViewDerive>>#listForManyTemplate'>

	^ aView list
		priority: 5;
		title: 'DomainConcept';
		items: [ self userStoryDomainConcepts ]
]

{ #category : #'api - testing' }
MyUserStoryDomainConcepts >> includesUserStoryDomainConcepts: aUserStoryDomainConcepts [
	"Check and return true if a given child object exists among my children, false otherwise.
	The comparison happens by identity"
	<return: #Boolean>
	<childObjectFinder: #domainConcept>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithoutModelTemplate>>#includesObjectTemplate'>

	^ self userStoryDomainConcepts anySatisfy: [ :eachUserStoryDomainConcepts |
		eachUserStoryDomainConcepts == aUserStoryDomainConcepts ]
]

{ #category : #'private - notifying' }
MyUserStoryDomainConcepts >> notifyUserStoryDomainConceptAdded: aUserStoryDomainConcept [
	"Notifies that a given child object was added to the receiver"
	
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#notifyObjectAddedTemplate'>
	self announce: (MyUserStoryDomainConceptAddedAnnouncement new
		userStoryDomainConcept: aUserStoryDomainConcept) 
]

{ #category : #'private - notifying' }
MyUserStoryDomainConcepts >> notifyUserStoryDomainConceptRemoved: aUserStoryDomainConcept [
	"Notifies that a given child object was removed from the receiver"
	
	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#notifyObjectRemovedTemplate'>
	self announce: (MyUserStoryDomainConceptRemovedAnnouncement new
		userStoryDomainConcept: aUserStoryDomainConcept) 
]

{ #category : #'api - adding' }
MyUserStoryDomainConcepts >> onUserStoryDomainConceptAdded: aUserStoryDomainConcept [
	"Is sent after a given child object was added to the receiver"

	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#objectAddedHookTemplate'>
	self notifyUserStoryDomainConceptAdded: aUserStoryDomainConcept.
]

{ #category : #'api - adding' }
MyUserStoryDomainConcepts >> onUserStoryDomainConceptRemoved: aUserStoryDomainConcept [
	"Is sent after a given child object was removed from the receiver"

	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#objectRemovedHookTemplate'>
	self notifyUserStoryDomainConceptRemoved: aUserStoryDomainConcept.
]

{ #category : #printing }
MyUserStoryDomainConcepts >> printOn: aStream [
	<generatedFrom: #'GtRobocoderMetamodelPrintDerive>>#printOnTemplate'>
	super printOn: aStream
]

{ #category : #'api - adding' }
MyUserStoryDomainConcepts >> removeUserStoryDomainConcept: aUserStoryDomainConcept [
	"Remove a given object as a child to the receiver and notify subscribers about it.
	Do nothing if an object is already one of my children."
	<objectAdder: #domainConcept>
	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#removeObjectTemplate'>

	(self includesUserStoryDomainConcepts: aUserStoryDomainConcept)
		ifFalse: [ ^ self ].
	
	
	self userStoryDomainConcepts
		remove: aUserStoryDomainConcept
		ifAbsent: [ ^ self ].
	self onUserStoryDomainConceptRemoved: aUserStoryDomainConcept
]

{ #category : #'api - announcer' }
MyUserStoryDomainConcepts >> unsubscribe: anObject [
	"Unsubscribe all subscriptions of anObject from the receiver"

	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#unsubscribeTemplate'>
	^ announcer ifNotNil: [ :anAnnouncer | anAnnouncer unsubscribe: anObject ]
]

{ #category : #'api - accessing' }
MyUserStoryDomainConcepts >> userStoryDomainConcepts [
	"Return a collection of objects (${class:MyUserStoryDomainConcept}$) created for each child from the domain model.
	Note: The children are lazily instantiated."
	<return: #Collection of: #MyUserStoryDomainConcept>
	<childObjectGetter: #domainConcept>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithoutModelTemplate>>#childObjectsGetterTemplate'>

	^  userStoryDomainConcepts ifNil: [ userStoryDomainConcepts := OrderedCollection new ]
]

{ #category : #'api - accessing' }
MyUserStoryDomainConcepts >> userStoryDomainConcepts: aCollectionOfMyUserStoryDomainConcept [
	"Silently assign a collection of given objects as my children without triggering any event. This is part of the #initialization protocol."
	<modelSetter: #domainConcepts>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithoutModelTemplate>>#childObjectsSetterTemplate'>
	
	userStoryDomainConcepts := aCollectionOfMyUserStoryDomainConcept asOrderedCollection.
	
]

{ #category : #'api - announcer' }
MyUserStoryDomainConcepts >> when: anAnnouncementClass do: aBlock [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenDoTemplate'>
	^ (announcer ifNil: [ announcer := Announcer new ])
		when: anAnnouncementClass do: aBlock
]

{ #category : #'api - announcer' }
MyUserStoryDomainConcepts >> when: anAnnouncementClass send: aSelector to: anObject [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenSendToTemplate'>
	^ (announcer ifNil: [ announcer := Announcer new ]) weak
		when: anAnnouncementClass send: aSelector to: anObject
]

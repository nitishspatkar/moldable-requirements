Class {
	#name : 'MyUserStoryDomainConceptServices',
	#superclass : 'Object',
	#instVars : [
		'parentUserStoryDomainConcept',
		'userStoryDomainConceptServices',
		'announcer'
	],
	#category : 'MyMoldableRequirements-User Story - Models'
}

{ #category : 'api - adding' }
MyUserStoryDomainConceptServices >> addUserStoryDomainConceptService: aUserStoryDomainConceptService [
	"Add a given object as a child to the receiver and notify subscribers about it.
	Do nothing if an object is already one of my children."
	<objectAdder: #domainConceptService>
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#addObjectTemplate'>

	(self includesUserStoryDomainConceptServices: aUserStoryDomainConceptService)
		ifTrue: [ ^ self ].
	
	
	self userStoryDomainConceptServices add: aUserStoryDomainConceptService.
	self onUserStoryDomainConceptServiceAdded: aUserStoryDomainConceptService
]

{ #category : 'api - announcer' }
MyUserStoryDomainConceptServices >> announce: anAnnouncement [
	<generatedFrom: #'GtRobocoderMetamodelNotifierDerive>>#announceTemplate'>
	announcer ifNotNil: [ :anAnnouncer | anAnnouncer announce: anAnnouncement ].

	"Dispatch anAnnouncement to the parent objects if they are assigned"
	self hasParentUserStoryDomainConcept
		ifTrue: [ self parentUserStoryDomainConcept announce: anAnnouncement ].
]

{ #category : 'gt-extentions' }
MyUserStoryDomainConceptServices >> gtDomainConceptServiceListViewFor: aView [
	<gtView>
	<generatedFrom: #'GtRobocoderMetamodelPhlowListViewDerive>>#listForManyTemplate'>

	^ aView list
		priority: 5;
		title: 'DomainConceptService';
		items: [ self userStoryDomainConceptServices ]
]

{ #category : 'api - testing' }
MyUserStoryDomainConceptServices >> hasParentUserStoryDomainConcept [
	"Return true if the parent object is attached"
	<return: #Boolean>
	<parentObjectTester: #domainConcept>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectTesterTemplate'>

	^ parentUserStoryDomainConcept notNil
]

{ #category : 'api - testing' }
MyUserStoryDomainConceptServices >> includesUserStoryDomainConceptServices: aUserStoryDomainConceptServices [
	"Check and return true if a given child object exists among my children, false otherwise.
	The comparison happens by identity"
	<return: #Boolean>
	<childObjectFinder: #domainConceptService>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithoutModelTemplate>>#includesObjectTemplate'>

	^ self userStoryDomainConceptServices anySatisfy: [ :eachUserStoryDomainConceptServices |
		eachUserStoryDomainConceptServices == aUserStoryDomainConceptServices ]
]

{ #category : 'private - notifying' }
MyUserStoryDomainConceptServices >> notifyUserStoryDomainConceptServiceAdded: aUserStoryDomainConceptService [
	"Notifies that a given child object was added to the receiver"
	
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#notifyObjectAddedTemplate'>
	self announce: (MyUserStoryDomainConceptServiceAddedAnnouncement new
		userStoryDomainConceptService: aUserStoryDomainConceptService) 
]

{ #category : 'private - notifying' }
MyUserStoryDomainConceptServices >> notifyUserStoryDomainConceptServiceRemoved: aUserStoryDomainConceptService [
	"Notifies that a given child object was removed from the receiver"
	
	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#notifyObjectRemovedTemplate'>
	self announce: (MyUserStoryDomainConceptServiceRemovedAnnouncement new
		userStoryDomainConceptService: aUserStoryDomainConceptService) 
]

{ #category : 'api - adding' }
MyUserStoryDomainConceptServices >> onUserStoryDomainConceptServiceAdded: aUserStoryDomainConceptService [
	"Is sent after a given child object was added to the receiver"
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#objectAddedHookTemplate'>
	aUserStoryDomainConceptService parentUserStoryDomainConceptServices: self.
	self notifyUserStoryDomainConceptServiceAdded: aUserStoryDomainConceptService
]

{ #category : 'api - adding' }
MyUserStoryDomainConceptServices >> onUserStoryDomainConceptServiceRemoved: aUserStoryDomainConceptService [
	"Is sent after a given child object was removed from the receiver"

	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#objectRemovedHookTemplate'>
	self notifyUserStoryDomainConceptServiceRemoved: aUserStoryDomainConceptService.
]

{ #category : 'api - accessing' }
MyUserStoryDomainConceptServices >> parentUserStoryDomainConcept [
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

{ #category : 'api - accessing' }
MyUserStoryDomainConceptServices >> parentUserStoryDomainConcept: aMyUserStoryDomainConcept [
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

{ #category : 'printing' }
MyUserStoryDomainConceptServices >> printOn: aStream [
	<generatedFrom: #'GtRobocoderMetamodelPrintDerive>>#printOnTemplate'>
	super printOn: aStream
]

{ #category : 'api - adding' }
MyUserStoryDomainConceptServices >> removeUserStoryDomainConceptService: aUserStoryDomainConceptService [
	"Remove a given object as a child to the receiver and notify subscribers about it.
	Do nothing if an object is already one of my children."
	<objectAdder: #domainConceptService>
	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#removeObjectTemplate'>

	(self includesUserStoryDomainConceptServices: aUserStoryDomainConceptService)
		ifFalse: [ ^ self ].
	
	
	self userStoryDomainConceptServices
		remove: aUserStoryDomainConceptService
		ifAbsent: [ ^ self ].
	self onUserStoryDomainConceptServiceRemoved: aUserStoryDomainConceptService
]

{ #category : 'api - announcer' }
MyUserStoryDomainConceptServices >> unsubscribe: anObject [
	"Unsubscribe all subscriptions of anObject from the receiver"

	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#unsubscribeTemplate'>
	^ announcer ifNotNil: [ :anAnnouncer | anAnnouncer unsubscribe: anObject ]
]

{ #category : 'api - accessing' }
MyUserStoryDomainConceptServices >> userStoryDomainConceptServices [
	"Return a collection of objects (${class:MyUserStoryDomainConceptService}$) created for each child from the domain model.
	Note: The children are lazily instantiated."
	<return: #Collection of: #MyUserStoryDomainConceptService>
	<childObjectGetter: #domainConceptService>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithoutModelTemplate>>#childObjectsGetterTemplate'>

	^  userStoryDomainConceptServices ifNil: [ userStoryDomainConceptServices := OrderedCollection new ]
]

{ #category : 'api - accessing' }
MyUserStoryDomainConceptServices >> userStoryDomainConceptServices: aCollectionOfMyUserStoryDomainConceptService [
	"Silently assign a collection of given objects as my children without triggering any event. This is part of the #initialization protocol."
	<modelSetter: #domainConceptServices>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithoutModelTemplate>>#childObjectsSetterTemplate'>
	
	userStoryDomainConceptServices := aCollectionOfMyUserStoryDomainConceptService asOrderedCollection.
	userStoryDomainConceptServices do: [ :eachMyUserStoryDomainConceptService |
		eachMyUserStoryDomainConceptService parentUserStoryDomainConceptServices: self ]
]

{ #category : 'api - announcer' }
MyUserStoryDomainConceptServices >> when: anAnnouncementClass do: aBlock [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenDoTemplate'>
	^ (announcer ifNil: [ announcer := Announcer new ])
		when: anAnnouncementClass do: aBlock
]

{ #category : 'api - announcer' }
MyUserStoryDomainConceptServices >> when: anAnnouncementClass send: aSelector to: anObject [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenSendToTemplate'>
	^ (announcer ifNil: [ announcer := Announcer new ]) weak
		when: anAnnouncementClass send: aSelector to: anObject
]

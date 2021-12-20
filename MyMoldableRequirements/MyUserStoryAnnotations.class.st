"
annotation(s) {
	@derive add,
	@derive remove
}.

annotation {
	@derive property (name: name)
}

"
Class {
	#name : #MyUserStoryAnnotations,
	#superclass : #Object,
	#instVars : [
		'announcer',
		'userStoryAnnotations'
	],
	#category : 'MyMoldableRequirements-User Story - Models'
}

{ #category : #'api - adding' }
MyUserStoryAnnotations >> addUserStoryAnnotation: aUserStoryAnnotation [
	"Add a given object as a child to the receiver and notify subscribers about it.
	Do nothing if an object is already one of my children."
	<objectAdder: #annotation>
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#addObjectTemplate'>

	(self includesUserStoryAnnotation: aUserStoryAnnotation)
		ifTrue: [ ^ self ].
	
	
	self userStoryAnnotations add: aUserStoryAnnotation.
	self onUserStoryAnnotationAdded: aUserStoryAnnotation
]

{ #category : #'api - announcer' }
MyUserStoryAnnotations >> announce: anAnnouncement [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#announceTemplate'>
	announcer ifNotNil: [ :anAnnouncer | anAnnouncer announce: anAnnouncement ]
]

{ #category : #converting }
MyUserStoryAnnotations >> asDomainConcepts [
	| theDomainConcepts |
	
	theDomainConcepts := MyUserStoryDomainConcepts new.
	self userStoryAnnotations
		do: [ :eachUserStoryAnnotation | theDomainConcepts addUserStoryDomainConcept:  eachUserStoryAnnotation asDomainConcept ].
	^ theDomainConcepts
]

{ #category : #'gt-extentions' }
MyUserStoryAnnotations >> gtAnnotationListViewFor: aView [
	<gtView>
	<generatedFrom: #'GtRobocoderMetamodelPhlowListViewDerive>>#listForManyTemplate'>

	^ aView list
		priority: 5;
		title: 'Annotation';
		items: [ self userStoryAnnotations ]
]

{ #category : #'api - testing' }
MyUserStoryAnnotations >> includesUserStoryAnnotation: aUserStoryAnnotation [
	"Check and return true if a given child object exists among my children, false otherwise.
	The comparison happens by identity"
	<return: #Boolean>
	<childObjectFinder: #annotation>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithoutModelTemplate>>#includesObjectTemplate'>

	^ self userStoryAnnotations anySatisfy: [ :eachUserStoryAnnotation |
		eachUserStoryAnnotation == aUserStoryAnnotation ]
]

{ #category : #'api - testing' }
MyUserStoryAnnotations >> isUserStoryAnnotation [
	"Return true if the receiver represents userStoryAnnotation, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - testing' }
MyUserStoryAnnotations >> isUserStoryAnnotations [
	"Return true if the receiver represents userStoryAnnotations, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ true
]

{ #category : #'private - notifying' }
MyUserStoryAnnotations >> notifyUserStoryAnnotationAdded: aUserStoryAnnotation [
	"Notifies that a given child object was added to the receiver"
	
	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#notifyObjectAddedTemplate'>
	self announce: (MyUserStoryAnnotationAddedAnnouncement new
		userStoryAnnotation: aUserStoryAnnotation) 
]

{ #category : #'private - notifying' }
MyUserStoryAnnotations >> notifyUserStoryAnnotationRemoved: aUserStoryAnnotation [
	"Notifies that a given child object was removed from the receiver"
	
	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#notifyObjectRemovedTemplate'>
	self announce: (MyUserStoryAnnotationRemovedAnnouncement new
		userStoryAnnotation: aUserStoryAnnotation) 
]

{ #category : #'api - accessing' }
MyUserStoryAnnotations >> objectName [
	"Return a symbolic name of the receiver which helps to create various type based mappings.
	Note: The symbolic name of the object is the exact name that was used
	in the metamodel declaration from which this class was generated"
	<return: #Symbol>
	<generatedFrom: #'GtRobocoderMetamodelNameDerive>>#objectNameTemplate'>

	^ #annotations
]

{ #category : #'api - adding' }
MyUserStoryAnnotations >> onUserStoryAnnotationAdded: aUserStoryAnnotation [
	"Is sent after a given child object was added to the receiver"

	<generatedFrom: #'TGtRobocoderMetamodelAdditionForManyTemplate>>#objectAddedHookTemplate'>
	self notifyUserStoryAnnotationAdded: aUserStoryAnnotation.
]

{ #category : #'api - adding' }
MyUserStoryAnnotations >> onUserStoryAnnotationRemoved: aUserStoryAnnotation [
	"Is sent after a given child object was removed from the receiver"

	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#objectRemovedHookTemplate'>
	self notifyUserStoryAnnotationRemoved: aUserStoryAnnotation.
]

{ #category : #printing }
MyUserStoryAnnotations >> printOn: aStream [
	<generatedFrom: #'GtRobocoderMetamodelPrintDerive>>#printOnTemplate'>
	super printOn: aStream
]

{ #category : #'api - adding' }
MyUserStoryAnnotations >> removeUserStoryAnnotation: aUserStoryAnnotation [
	"Remove a given object as a child to the receiver and notify subscribers about it.
	Do nothing if an object is already one of my children."
	<objectAdder: #annotation>
	<generatedFrom: #'TGtRobocoderMetamodelRemovalForManyTemplate>>#removeObjectTemplate'>

	(self includesUserStoryAnnotation: aUserStoryAnnotation)
		ifFalse: [ ^ self ].
	
	
	self userStoryAnnotations
		remove: aUserStoryAnnotation
		ifAbsent: [ ^ self ].
	self onUserStoryAnnotationRemoved: aUserStoryAnnotation
]

{ #category : #'api - announcer' }
MyUserStoryAnnotations >> unsubscribe: anObject [
	"Unsubscribe all subscriptions of anObject from the receiver"

	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#unsubscribeTemplate'>
	^ announcer ifNotNil: [ :anAnnouncer | anAnnouncer unsubscribe: anObject ]
]

{ #category : #'api - accessing' }
MyUserStoryAnnotations >> userStoryAnnotations [
	"Return a collection of objects (${class:MyUserStoryAnnotation}$) created for each child from the domain model.
	Note: The children are lazily instantiated."
	<return: #Collection of: #MyUserStoryAnnotation>
	<childObjectGetter: #annotation>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithoutModelTemplate>>#childObjectsGetterTemplate'>

	^  userStoryAnnotations ifNil: [ userStoryAnnotations := OrderedCollection new ]
]

{ #category : #'api - accessing' }
MyUserStoryAnnotations >> userStoryAnnotations: aCollectionOfMyUserStoryAnnotation [
	"Silently assign a collection of given objects as my children without triggering any event. This is part of the #initialization protocol."
	<modelSetter: #annotations>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForManyWithoutModelTemplate>>#childObjectsSetterTemplate'>
	
	userStoryAnnotations := aCollectionOfMyUserStoryAnnotation asOrderedCollection.
	userStoryAnnotations do: [ :eachMyUserStoryAnnotation |
		eachMyUserStoryAnnotation parentUserStoryAnnotations: self ]
]

{ #category : #'api - announcer' }
MyUserStoryAnnotations >> when: anAnnouncementClass do: aBlock [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenDoTemplate'>
	^ (announcer ifNil: [ announcer := Announcer new ])
		when: anAnnouncementClass do: aBlock
]

{ #category : #'api - announcer' }
MyUserStoryAnnotations >> when: anAnnouncementClass send: aSelector to: anObject [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenSendToTemplate'>
	^ (announcer ifNil: [ announcer := Announcer new ]) weak
		when: anAnnouncementClass send: aSelector to: anObject
]

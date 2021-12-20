Class {
	#name : #MyUserStoryDomainConceptService,
	#superclass : #Object,
	#instVars : [
		'parentUserStoryDomainConceptServices',
		'name',
		'announcer'
	],
	#category : 'MyMoldableRequirements-User Story - Models'
}

{ #category : #'api - announcer' }
MyUserStoryDomainConceptService >> announce: anAnnouncement [
	<generatedFrom: #'GtRobocoderMetamodelNotifierDerive>>#announceTemplate'>
	announcer ifNotNil: [ :anAnnouncer | anAnnouncer announce: anAnnouncement ].

	"Dispatch anAnnouncement to the parent objects if they are assigned"
	self hasParentUserStoryDomainConceptServices
		ifTrue: [ self parentUserStoryDomainConceptServices announce: anAnnouncement ].
]

{ #category : #'api - name' }
MyUserStoryDomainConceptService >> hasName [
	<return: #Boolean>
	<propertyTester: #name>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#propertyTesterTemplate'>

	^ name notNil
]

{ #category : #'api - testing' }
MyUserStoryDomainConceptService >> hasParentUserStoryDomainConceptServices [
	"Return true if the parent object is attached"
	<return: #Boolean>
	<parentObjectTester: #domainConceptServices>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectTesterTemplate'>

	^ parentUserStoryDomainConceptServices notNil
]

{ #category : #'api - name' }
MyUserStoryDomainConceptService >> name [
	<return: #Object>
	<propertyGetter: #name>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#propertyGetterTemplate'>

	^ name
]

{ #category : #'api - name' }
MyUserStoryDomainConceptService >> name: aNewName [
	<propertySetter: #name>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#propertySetterTemplate'>

	(self hasName
		and: [ self name = aNewName ])
			ifTrue: [ ^ self ].
	
	self hasName
		ifTrue: [
			| aPreviousName |
			aPreviousName := name.
			name := nil.
			self onPreviousNameUnset: aPreviousName ].
	name := aNewName.
	self onNewNameSet: aNewName.
	self notifyNameChanged
]

{ #category : #'api - name' }
MyUserStoryDomainConceptService >> notifyNameChanged [
	"Override this notify method to announce changes to the property"
	<propertyChangeNotifier: #name>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#notifyPropertyChangedTemplate'>
]

{ #category : #'api - name' }
MyUserStoryDomainConceptService >> onNewNameSet: aNewName [
	"Is sent after a new value of the name is assigned"
	<propertySetHook: #name>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#onNewPropertySetHookTemplate'>
]

{ #category : #'api - name' }
MyUserStoryDomainConceptService >> onPreviousNameUnset: aPreviousName [
	"Is sent after a previous value of the name is de-assigned"
	<propertyUnsetHook: #name>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#onPreviousPropertyUnsetHookTemplate'>
]

{ #category : #'api - accessing' }
MyUserStoryDomainConceptService >> parentUserStoryDomainConceptServices [
	"Return a parent object which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<return: #MyUserStoryDomainConceptServices>
	<parentObjectGetter: #domainConceptServices>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectGetterTemplate'>

	self
		assert: [ parentUserStoryDomainConceptServices notNil ]
		description: [ 'Parent is not assigned!' ].

	^ parentUserStoryDomainConceptServices
]

{ #category : #'api - accessing' }
MyUserStoryDomainConceptService >> parentUserStoryDomainConceptServices: aMyUserStoryDomainConceptServices [
	"Assign a parent object (${class:MyUserStoryDomainConceptServices}$) which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<parentObjectSetter: #domainConceptServices>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectSetterTemplate'>

	self
		assert: [ aMyUserStoryDomainConceptServices notNil ]
		description: [ 'Parent view model must not be nil' ].

	parentUserStoryDomainConceptServices := aMyUserStoryDomainConceptServices
]

{ #category : #printing }
MyUserStoryDomainConceptService >> printOn: aStream [
	<generatedFrom: #'GtRobocoderMetamodelPrintDerive>>#printOnTemplate'>
	super printOn: aStream
]

{ #category : #'api - name' }
MyUserStoryDomainConceptService >> unsetName [
	<propertyUnsetter: #name>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#propertyUnsetterTemplate'>
	| aPreviousName |

	self hasName
		ifFalse: [ ^ self ].

	aPreviousName := name.
	name := nil.
	self onPreviousNameUnset: aPreviousName.
	self notifyNameChanged
]

{ #category : #'api - announcer' }
MyUserStoryDomainConceptService >> unsubscribe: anObject [
	"Unsubscribe all subscriptions of anObject from the receiver"

	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#unsubscribeTemplate'>
	^ announcer ifNotNil: [ :anAnnouncer | anAnnouncer unsubscribe: anObject ]
]

{ #category : #'api - announcer' }
MyUserStoryDomainConceptService >> when: anAnnouncementClass do: aBlock [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenDoTemplate'>
	^ (announcer ifNil: [ announcer := Announcer new ])
		when: anAnnouncementClass do: aBlock
]

{ #category : #'api - announcer' }
MyUserStoryDomainConceptService >> when: anAnnouncementClass send: aSelector to: anObject [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenSendToTemplate'>
	^ (announcer ifNil: [ announcer := Announcer new ]) weak
		when: anAnnouncementClass send: aSelector to: anObject
]

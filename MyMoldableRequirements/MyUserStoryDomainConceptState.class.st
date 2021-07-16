Class {
	#name : 'MyUserStoryDomainConceptState',
	#superclass : 'Object',
	#instVars : [
		'parentUserStoryDomainConceptStates',
		'name',
		'announcer'
	],
	#category : 'MyMoldableRequirements-User Story - Models'
}

{ #category : 'api - announcer' }
MyUserStoryDomainConceptState >> announce: anAnnouncement [
	<generatedFrom: #'GtRobocoderMetamodelNotifierDerive>>#announceTemplate'>
	announcer ifNotNil: [ :anAnnouncer | anAnnouncer announce: anAnnouncement ].

	"Dispatch anAnnouncement to the parent objects if they are assigned"
	self hasParentUserStoryDomainConceptStates
		ifTrue: [ self parentUserStoryDomainConceptStates announce: anAnnouncement ].
]

{ #category : 'api - name' }
MyUserStoryDomainConceptState >> hasName [
	<return: #Boolean>
	<propertyTester: #name>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#propertyTesterTemplate'>

	^ name notNil
]

{ #category : 'api - testing' }
MyUserStoryDomainConceptState >> hasParentUserStoryDomainConceptStates [
	"Return true if the parent object is attached"
	<return: #Boolean>
	<parentObjectTester: #domainConceptStates>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectTesterTemplate'>

	^ parentUserStoryDomainConceptStates notNil
]

{ #category : 'api - name' }
MyUserStoryDomainConceptState >> name [
	<return: #Object>
	<propertyGetter: #name>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#propertyGetterTemplate'>

	^ name
]

{ #category : 'api - name' }
MyUserStoryDomainConceptState >> name: aNewName [
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

{ #category : 'api - name' }
MyUserStoryDomainConceptState >> notifyNameChanged [
	"Override this notify method to announce changes to the property"
	<propertyChangeNotifier: #name>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#notifyPropertyChangedTemplate'>
	
	self announce: (MyUserStoryDomainConceptStateNameChanged new userStoryDomainConceptState: self)
]

{ #category : 'api - name' }
MyUserStoryDomainConceptState >> onNewNameSet: aNewName [
	"Is sent after a new value of the name is assigned"
	<propertySetHook: #name>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#onNewPropertySetHookTemplate'>
]

{ #category : 'api - name' }
MyUserStoryDomainConceptState >> onPreviousNameUnset: aPreviousName [
	"Is sent after a previous value of the name is de-assigned"
	<propertyUnsetHook: #name>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#onPreviousPropertyUnsetHookTemplate'>
]

{ #category : 'api - accessing' }
MyUserStoryDomainConceptState >> parentUserStoryDomainConceptStates [
	"Return a parent object which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<return: #MyUserStoryDomainConceptStates>
	<parentObjectGetter: #domainConceptStates>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectGetterTemplate'>

	self
		assert: [ parentUserStoryDomainConceptStates notNil ]
		description: [ 'Parent is not assigned!' ].

	^ parentUserStoryDomainConceptStates
]

{ #category : 'api - accessing' }
MyUserStoryDomainConceptState >> parentUserStoryDomainConceptStates: aMyUserStoryDomainConceptStates [
	"Assign a parent object (${class:MyUserStoryDomainConceptStates}$) which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<parentObjectSetter: #domainConceptStates>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectSetterTemplate'>

	self
		assert: [ aMyUserStoryDomainConceptStates notNil ]
		description: [ 'Parent view model must not be nil' ].

	parentUserStoryDomainConceptStates := aMyUserStoryDomainConceptStates
]

{ #category : 'printing' }
MyUserStoryDomainConceptState >> printOn: aStream [
	<generatedFrom: #'GtRobocoderMetamodelPrintDerive>>#printOnTemplate'>
	super printOn: aStream
]

{ #category : 'api - name' }
MyUserStoryDomainConceptState >> unsetName [
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

{ #category : 'api - announcer' }
MyUserStoryDomainConceptState >> unsubscribe: anObject [
	"Unsubscribe all subscriptions of anObject from the receiver"

	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#unsubscribeTemplate'>
	^ announcer ifNotNil: [ :anAnnouncer | anAnnouncer unsubscribe: anObject ]
]

{ #category : 'api - announcer' }
MyUserStoryDomainConceptState >> when: anAnnouncementClass do: aBlock [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenDoTemplate'>
	^ (announcer ifNil: [ announcer := Announcer new ])
		when: anAnnouncementClass do: aBlock
]

{ #category : 'api - announcer' }
MyUserStoryDomainConceptState >> when: anAnnouncementClass send: aSelector to: anObject [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenSendToTemplate'>
	^ (announcer ifNil: [ announcer := Announcer new ]) weak
		when: anAnnouncementClass send: aSelector to: anObject
]

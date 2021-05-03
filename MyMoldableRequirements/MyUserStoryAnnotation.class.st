Class {
	#name : #MyUserStoryAnnotation,
	#superclass : #Object,
	#instVars : [
		'name',
		'parentUserStoryAnnotations',
		'announcer'
	],
	#category : #'MyMoldableRequirements-User Story - Models'
}

{ #category : #'api - announcer' }
MyUserStoryAnnotation >> announce: anAnnouncement [
	<generatedFrom: #'GtRobocoderMetamodelNotifierDerive>>#announceTemplate'>
	announcer ifNotNil: [ :anAnnouncer | anAnnouncer announce: anAnnouncement ].

	"Dispatch anAnnouncement to the parent objects if they are assigned"
	self hasParentUserStoryAnnotations
		ifTrue: [ self parentUserStoryAnnotations announce: anAnnouncement ].
]

{ #category : #'api - name' }
MyUserStoryAnnotation >> hasName [
	<return: #Boolean>
	<propertyTester: #name>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#propertyTesterTemplate'>

	^ name notNil
]

{ #category : #'api - testing' }
MyUserStoryAnnotation >> hasParentUserStoryAnnotations [
	"Return true if the parent object is attached"
	<return: #Boolean>
	<parentObjectTester: #annotations>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectTesterTemplate'>

	^ parentUserStoryAnnotations notNil
]

{ #category : #'api - testing' }
MyUserStoryAnnotation >> isUserStoryAnnotation [
	"Return true if the receiver represents userStoryAnnotation, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ true
]

{ #category : #'api - testing' }
MyUserStoryAnnotation >> isUserStoryAnnotations [
	"Return true if the receiver represents userStoryAnnotations, false otherwise"
	<return: #Boolean>
	<generatedFrom: #'GtRobocoderMetamodelTypeTestDerive>>#typeTesterTemplate'>

	^ false
]

{ #category : #'api - name' }
MyUserStoryAnnotation >> name [
	<return: #Object>
	<propertyGetter: #name>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#propertyGetterTemplate'>

	^ name
]

{ #category : #'api - name' }
MyUserStoryAnnotation >> name: aNewName [
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
MyUserStoryAnnotation >> notifyNameChanged [
	"Override this notify method to announce changes to the property"
	<propertyChangeNotifier: #name>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#notifyPropertyChangedTemplate'>
	
	self announce: (MyUserStoryAnnotationNameChanged new userStoryAnnotation: self)
]

{ #category : #'api - accessing' }
MyUserStoryAnnotation >> objectName [
	"Return a symbolic name of the receiver which helps to create various type based mappings.
	Note: The symbolic name of the object is the exact name that was used
	in the metamodel declaration from which this class was generated"
	<return: #Symbol>
	<generatedFrom: #'GtRobocoderMetamodelNameDerive>>#objectNameTemplate'>

	^ #annotation
]

{ #category : #'api - name' }
MyUserStoryAnnotation >> onNewNameSet: aNewName [
	"Is sent after a new value of the name is assigned"
	<propertySetHook: #name>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#onNewPropertySetHookTemplate'>
]

{ #category : #'api - name' }
MyUserStoryAnnotation >> onPreviousNameUnset: aPreviousName [
	"Is sent after a previous value of the name is de-assigned"
	<propertyUnsetHook: #name>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#onPreviousPropertyUnsetHookTemplate'>
]

{ #category : #'api - accessing' }
MyUserStoryAnnotation >> parentUserStoryAnnotations [
	"Return a parent object which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<return: #MyUserStoryAnnotations>
	<parentObjectGetter: #annotations>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectGetterTemplate'>

	self
		assert: [ parentUserStoryAnnotations notNil ]
		description: [ 'Parent is not assigned!' ].

	^ parentUserStoryAnnotations
]

{ #category : #'api - accessing' }
MyUserStoryAnnotation >> parentUserStoryAnnotations: aMyUserStoryAnnotations [
	"Assign a parent object (${class:MyUserStoryAnnotations}$) which is used to access various state properties,
	for example parent may be responsible for knowing a selected child object.
	In order for the child to know if it is selected, that child should know the parent object."
	<parentObjectSetter: #annotations>
	<generatedFrom: #'TGtRobocoderMetamodelParentAccessorTemplate>>#parentObjectSetterTemplate'>

	self
		assert: [ aMyUserStoryAnnotations notNil ]
		description: [ 'Parent view model must not be nil' ].

	parentUserStoryAnnotations := aMyUserStoryAnnotations
]

{ #category : #printing }
MyUserStoryAnnotation >> printOn: aStream [
	<generatedFrom: #'GtRobocoderMetamodelPrintDerive>>#printOnTemplate'>
	
	aStream print: self name
]

{ #category : #'api - name' }
MyUserStoryAnnotation >> unsetName [
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
MyUserStoryAnnotation >> unsubscribe: anObject [
	"Unsubscribe all subscriptions of anObject from the receiver"

	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#unsubscribeTemplate'>
	^ announcer ifNotNil: [ :anAnnouncer | anAnnouncer unsubscribe: anObject ]
]

{ #category : #'api - announcer' }
MyUserStoryAnnotation >> when: anAnnouncementClass do: aBlock [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenDoTemplate'>
	^ (announcer ifNil: [ announcer := Announcer new ])
		when: anAnnouncementClass do: aBlock
]

{ #category : #'api - announcer' }
MyUserStoryAnnotation >> when: anAnnouncementClass send: aSelector to: anObject [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenSendToTemplate'>
	^ (announcer ifNil: [ announcer := Announcer new ]) weak
		when: anAnnouncementClass send: aSelector to: anObject
]

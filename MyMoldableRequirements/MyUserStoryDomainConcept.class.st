Class {
	#name : #MyUserStoryDomainConcept,
	#superclass : #Object,
	#instVars : [
		'userStoryDomainConcept',
		'userStoryDomainConceptStates',
		'userStoryDomainConceptServices',
		'name',
		'announcer'
	],
	#category : #'MyMoldableRequirements-User Story - Models'
}

{ #category : #'api - announcer' }
MyUserStoryDomainConcept >> announce: anAnnouncement [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#announceTemplate'>
	announcer ifNotNil: [ :anAnnouncer | anAnnouncer announce: anAnnouncement ]
]

{ #category : #'private - instance creation' }
MyUserStoryDomainConcept >> createUserStoryDomainConcept [
	"Create a nested child object for a domain child (or children) and return the result"
	<return: #MyUserStoryDomainConcept>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForOneTemplate>>#createChildObjectsTemplate'>
	| childObject |

	childObject := MyUserStoryDomainConcept new.
	
	
	^ childObject
]

{ #category : #'private - instance creation' }
MyUserStoryDomainConcept >> createUserStoryDomainConceptServices [
	"Create a nested child object for a domain child (or children) and return the result"
	<return: #MyUserStoryDomainConceptServices>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForOneTemplate>>#createChildObjectsTemplate'>
	| childObject |

	childObject := MyUserStoryDomainConceptServices new.
	childObject parentUserStoryDomainConcept: self.
	childObject userStoryDomainConceptServices: #().
	^ childObject
]

{ #category : #'private - instance creation' }
MyUserStoryDomainConcept >> createUserStoryDomainConceptStates [
	"Create a nested child object for a domain child (or children) and return the result"
	<return: #MyUserStoryDomainConceptStates>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForOneTemplate>>#createChildObjectsTemplate'>
	| childObject |

	childObject := MyUserStoryDomainConceptStates new.
	childObject parentUserStoryDomainConcept: self.
	childObject userStoryDomainConceptStates: #().
	^ childObject
]

{ #category : #'gt-extentions' }
MyUserStoryDomainConcept >> gtDomainConceptServicesListViewFor: aView [
	<gtView>
	<generatedFrom: #'GtRobocoderMetamodelPhlowListViewDerive>>#listForOneTemplate'>

	^ aView list
		priority: 5;
		title: 'DomainConceptServices';
		items: [ self userStoryDomainConceptServices userStoryDomainConceptServices ]
]

{ #category : #'gt-extentions' }
MyUserStoryDomainConcept >> gtDomainConceptStatesListViewFor: aView [
	<gtView>
	<generatedFrom: #'GtRobocoderMetamodelPhlowListViewDerive>>#listForOneTemplate'>

	^ aView list
		priority: 5;
		title: 'DomainConceptStates';
		items: [ self userStoryDomainConceptStates userStoryDomainConceptStates ]
]

{ #category : #'gt-extentions' }
MyUserStoryDomainConcept >> gtServicesListViewFor: aView [
	<gtView>
	<generatedFrom: #'GtRobocoderMetamodelPhlowListViewDerive>>#listForOneTemplate'>

	^ aView list
		priority: 5;
		title: 'Services';
		items: [ self conceptKind userStoryServices ]
]

{ #category : #'api - name' }
MyUserStoryDomainConcept >> hasName [
	<return: #Boolean>
	<propertyTester: #name>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#propertyTesterTemplate'>

	^ name notNil
]

{ #category : #'api - name' }
MyUserStoryDomainConcept >> name [
	<return: #Object>
	<propertyGetter: #name>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#propertyGetterTemplate'>

	^ name
]

{ #category : #'api - name' }
MyUserStoryDomainConcept >> name: aNewName [
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
MyUserStoryDomainConcept >> notifyNameChanged [
	"Override this notify method to announce changes to the property"
	<propertyChangeNotifier: #name>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#notifyPropertyChangedTemplate'>
	
	self announce: (MyUserStoryDomainConceptNameChanged new userStoryDomainConcept: self)
]

{ #category : #'api - name' }
MyUserStoryDomainConcept >> onNewNameSet: aNewName [
	"Is sent after a new value of the name is assigned"
	<propertySetHook: #name>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#onNewPropertySetHookTemplate'>
]

{ #category : #'api - name' }
MyUserStoryDomainConcept >> onPreviousNameUnset: aPreviousName [
	"Is sent after a previous value of the name is de-assigned"
	<propertyUnsetHook: #name>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#onPreviousPropertyUnsetHookTemplate'>
]

{ #category : #printing }
MyUserStoryDomainConcept >> printOn: aStream [
	<generatedFrom: #'GtRobocoderMetamodelPrintDerive>>#printOnTemplate'>
	super printOn: aStream
]

{ #category : #'api - name' }
MyUserStoryDomainConcept >> unsetName [
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
MyUserStoryDomainConcept >> unsubscribe: anObject [
	"Unsubscribe all subscriptions of anObject from the receiver"

	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#unsubscribeTemplate'>
	^ announcer ifNotNil: [ :anAnnouncer | anAnnouncer unsubscribe: anObject ]
]

{ #category : #'api - accessing' }
MyUserStoryDomainConcept >> userStoryDomainConcept [
	"Return a composite object (${class:nil}$) created for a collection of children from the domain model.
	Note: The object is lazily instantiated."
	<return: #MyUserStoryDomainConcept>
	<childObjectGetter: #domainConcept>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForOneTemplate>>#childObjectsTemplate'>

	^ userStoryDomainConcept ifNil: [ userStoryDomainConcept := self createUserStoryDomainConcept ]
]

{ #category : #'api - accessing' }
MyUserStoryDomainConcept >> userStoryDomainConceptServices [
	"Return a composite object (${class:nil}$) created for a collection of children from the domain model.
	Note: The object is lazily instantiated."
	<return: #MyUserStoryDomainConceptServices>
	<childObjectGetter: #domainConceptServices>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForOneTemplate>>#childObjectsTemplate'>

	^ userStoryDomainConceptServices ifNil: [ userStoryDomainConceptServices := self createUserStoryDomainConceptServices ]
]

{ #category : #'api - accessing' }
MyUserStoryDomainConcept >> userStoryDomainConceptStates [
	"Return a composite object (${class:nil}$) created for a collection of children from the domain model.
	Note: The object is lazily instantiated."
	<return: #MyUserStoryDomainConceptStates>
	<childObjectGetter: #domainConceptStates>
	<generatedFrom: #'TGtRobocoderMetamodelChildrenForOneTemplate>>#childObjectsTemplate'>

	^ userStoryDomainConceptStates ifNil: [ userStoryDomainConceptStates := self createUserStoryDomainConceptStates ]
]

{ #category : #'api - announcer' }
MyUserStoryDomainConcept >> when: anAnnouncementClass do: aBlock [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenDoTemplate'>
	^ (announcer ifNil: [ announcer := Announcer new ])
		when: anAnnouncementClass do: aBlock
]

{ #category : #'api - announcer' }
MyUserStoryDomainConcept >> when: anAnnouncementClass send: aSelector to: anObject [
	<generatedFrom: #'TGtRobocoderAnnouncerTemplate>>#whenSendToTemplate'>
	^ (announcer ifNil: [ announcer := Announcer new ]) weak
		when: anAnnouncementClass send: aSelector to: anObject
]

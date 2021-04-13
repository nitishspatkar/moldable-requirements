Class {
	#name : #RequirementClassAdditionInterface,
	#superclass : #BlElement,
	#instVars : [
		'element',
		'coderContent',
		'navigationModel',
		'futureClassName'
	],
	#category : #'Epic-Model'
}

{ #category : #ui }
RequirementClassAdditionInterface >> buildAddButton [
	| aptitude |
	^BrButton new
		label: 'Add class';
		aptitude:
			BrGlamorousButtonWithIconAptitude
				+
					(aptitude := BrGlamorousWithDropdownAptitude
						handle: [ BrButton new
								aptitude:
									BrGlamorousButtonWithIconAptitude - BrGlamorousWithLabelTooltipAptitude
										- BrGlamorousButtonExteriorAptitude;
								icon: BrGlamorousVectorIcons add;
								yourself ]
						content: [ | element |
							element := BlElement new.
							element
								constraintsDo: [ :c | 
									c horizontal exact: 400.
									c vertical exact: 300 ].
							element addChild: (self buildAddInterface: aptitude).
							element ]);
		icon: BrGlamorousVectorIcons add;
		yourself.
]

{ #category : #ui }
RequirementClassAdditionInterface >> buildAddInterface: aptitude [
	| contentTabs tab |
	contentTabs := BrTabGroup new.
	contentTabs aptitude: BrGlamorousTabGroupAptitude new.
	contentTabs
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
	tab := BrTab new
		aptitude: BrGlamorousTabAptitude new;
		label: 'Class';
		stencil: [ | el |
			el := GtPharoCreateBehaviorElement new.
			el
				behaviorBlock: [ :cls | 
					aptitude hide.
					navigationModel selectClass: cls ].
			el forClassDefinitionWithName: futureClassName.
			navigationModel
				selectedPackageDo: [ :package | el forPackage: package ].
			navigationModel
				selectedTagDo: [ :tag | el forPackageTag: tag ].
			navigationModel
				selectedClassDo: [ :cls | el forSuperclass: cls ].
			el ].
	contentTabs addTab: tab.
	^ contentTabs
]

{ #category : #accessing }
RequirementClassAdditionInterface >> element: anObject [
	element := anObject.
]

{ #category : #initialization }
RequirementClassAdditionInterface >> initialize [ 
	super initialize.
	self initializeNavigationModel.
	self initializeMainContent.
	self initializeElement.
]

{ #category : #initialization }
RequirementClassAdditionInterface >> initializeElement [
	self addChild: self buildAddButton
]

{ #category : #initialization }
RequirementClassAdditionInterface >> initializeMainContent [
	coderContent := BlElement new
		layout: BlFrameLayout new;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ].
]

{ #category : #initialization }
RequirementClassAdditionInterface >> initializeNavigationModel [
	navigationModel := GtCoderNavigationPackagesTagsClassesModel new.
	element ifNotNil: [ navigationModel when: GtCoderNavigationAnnouncement send: #updateElement to: self ].
	
	
]

{ #category : #initialization }
RequirementClassAdditionInterface >> initializeWithElement: anElement [
	self element: anElement.
	self initialize.
]

{ #category : #initialization }
RequirementClassAdditionInterface >> initializeWithFutureClassName: aString [
	futureClassName := aString.
	self initialize.
]

{ #category : #initialization }
RequirementClassAdditionInterface >> initializeWithFutureClassName: aString andElement: anElement [
	element := anElement.
	futureClassName := aString.
	self initialize.
]

{ #category : #accessing }
RequirementClassAdditionInterface >> navigationModel [
	^navigationModel
]

{ #category : #'api - spawning' }
RequirementClassAdditionInterface >> updateElement [
	element announcer announce: ERequirementStateChangedAnnouncement.
]

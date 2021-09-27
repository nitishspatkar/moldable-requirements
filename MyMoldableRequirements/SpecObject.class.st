Class {
	#name : #SpecObject,
	#superclass : #SpecElementWithAttributes,
	#instVars : [
		'coreContent',
		'type'
	],
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
SpecObject class >> fromRawData: specObjectData coreContent: aCoreContentObject [
	| valuesCollection values value typeRef type specObject |
	
	typeRef := ((specObjectData elementAt: 'TYPE') contentStringAt: 'SPEC-OBJECT-TYPE-REF').
	type := ((aCoreContentObject specTypes) at: typeRef).
	valuesCollection := OrderedCollection new.
	
	specObject := self
		identifier: (specObjectData attributeAt: 'IDENTIFIER')
		longName: (specObjectData attributeAt: 'LONG-NAME')
		desc: (specObjectData attributeAt: 'DESC')
		lastChange: (specObjectData attributeAt: 'LAST-CHANGE')
		values: valuesCollection	
		type: type
		coreContent: aCoreContentObject.
	
	values := (specObjectData elementAt: 'VALUES').
		
	valuesCollection := OrderedCollection new.
	values elementsDo:
		[ :aValue |
			value := ((Mapper classForTag: (aValue name)) fromRawData: aValue forSpecEl: specObject).
			valuesCollection add: value.
		].
	
	specObject values: valuesCollection.
	
	^ specObject
]

{ #category : #accessing }
SpecObject class >> identifier: anIdString longName: aNameString desc: aDescString lastChange: aDateString values: aCollection type: aTypeString coreContent: aCoreContentObject [
	^ self new
		identifier: anIdString;
		longName: aNameString;
		desc: aDescString;
		lastChange: aDateString;
		values: aCollection;
		type: aTypeString;
		coreContent: aCoreContentObject;
		yourself
]

{ #category : #accessing }
SpecObject >> addNewSpecObject: aType [
	| aSpecObject anId valuesCollection valueObject phlow |
	aSpecObject := SpecObject new.
	anId := UUIDGenerator next asString.
	
	valuesCollection := OrderedCollection new. 
	aType specAttributes do: [ :specAttr | 
		valueObject := (Mapper valueObjectForDefinition: (specAttr class)) newForDefinition: specAttr forSpecEl: aType.
		valuesCollection add: valueObject.
	].
					
	aSpecObject identifier: anId.
	aSpecObject longName: ''.
	aSpecObject desc: ''.
	aSpecObject type: aType.
	aSpecObject lastChange: LastChangeDateTimeGenerator dateTimeString.
	aSpecObject values: valuesCollection.					
					
	coreContent ifNotNil: [ :aCoreContent |
		aCoreContent specObjects add: anId -> aSpecObject.
		aCoreContent documentRoot announcer announce: (SpecObjectChanged new) ].
]

{ #category : #accessing }
SpecObject >> addNewSpecObject: aType callback: aBlock [
	| aSpecObject anId valuesCollection valueObject |
	aSpecObject := SpecObject new.
	anId := UUIDGenerator next asString.
	
	valuesCollection := OrderedCollection new. 
	aType specAttributes do: [ :specAttr | 
		valueObject := (Mapper valueObjectForDefinition: (specAttr class)) newForDefinition: specAttr forSpecEl: aType.
		valuesCollection add: valueObject.
	].
					
	aSpecObject identifier: anId.
	aSpecObject longName: ''.
	aSpecObject desc: ''.
	aSpecObject type: aType.
	aSpecObject lastChange: LastChangeDateTimeGenerator dateTimeString.
	aSpecObject values: valuesCollection.	
	aSpecObject coreContent: self coreContent.				
					
	self coreContent ifNotNil: [ :aCoreContent |
		aCoreContent specObjects add: anId -> aSpecObject.
		aCoreContent documentRoot announcer announce: (ReqIFChanged new) ].
		
	aBlock value.
]

{ #category : #accessing }
SpecObject >> asEditView [
	| container lineContainer |
	
	container := BlElement new
		layout: BlLinearLayout vertical;
		margin: (BlInsets left: 10);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent].

	"dynamic fields"
	self values do: [ :anAttributeValueObject | 
		container addChild: (anAttributeValueObject asEditView).
	].
	
	"default fields"
	lineContainer := BlElement new
		layout: BlLinearLayout horizontal;
		margin: (BlInsets top: 10);
		background: Color white;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent].
	lineContainer addChild:
		(BrLabel new
			aptitude: BrGlamorousLabelAptitude;
			beLargeSize;
			margin: (BlInsets right: 20);
			text: 'Long name';
			yourself).
	lineContainer addChild: 
		(BrEditableLabel new
		aptitude: BrGlamorousEditableLabelAptitude new glamorousRegularFontAndSize;
		text: longName;
		when: BrEditorAcceptWish do: [ :aWish | 
			longName := aWish text asString. 
			(self coreContent) documentRoot announcer announce: (ReqIFChanged new) ];
		yourself).
	
	container addChild: lineContainer.
	
	
	lineContainer := BlElement new
		layout: BlLinearLayout horizontal;
		margin: (BlInsets top: 10);
		background: Color white;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent].
	lineContainer addChild:
		(BrLabel new
			aptitude: BrGlamorousLabelAptitude;
			beLargeSize;
			margin: (BlInsets right: 20);
			text: 'Desc';
			yourself).
	lineContainer addChild: 
		(BrEditableLabel new
		aptitude: BrGlamorousEditableLabelAptitude new glamorousRegularFontAndSize;
		text: desc;
		when: BrEditorAcceptWish do: [ :aWish | 
			desc := aWish text asString. 
			(self coreContent) documentRoot announcer announce: (ReqIFChanged new) ];
		yourself).
	
	container addChild: lineContainer.
	
	^ container
]

{ #category : #accessing }
SpecObject >> asTypeSelector: aBlock [
	"a spec object presents a list of spec types to create a new object"
	| selector |	
	selector := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent ];
		padding: (BlInsets all: 5);
		
		addChild:
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				beLargeSize;
				text: 'Choose type:';
				yourself).

	self getAvailableTypes collect: [ :aType |
		selector addChild:
			(BlElement new
				layout: BlLinearLayout vertical;
				constraintsDo: [ :c | 
					c vertical fitContent.
					c horizontal fitContent ];
				padding: (BlInsets top: 5 bottom: 5);
				addChild:
					(BrButton new
						aptitude: BrGlamorousButtonWithLabelAptitude;
						label: (aType longName);
						action: [ :aButton | self addNewSpecObject: aType callback: aBlock ];
						yourself) 
			yourself )].
		
	^ selector yourself	
]

{ #category : #accessing }
SpecObject >> coreContent [
	^ coreContent
]

{ #category : #accessing }
SpecObject >> coreContent: anObject [
	coreContent := anObject
]

{ #category : #accessing }
SpecObject >> getAvailableTypes [
	| specObjectTypes |
	specObjectTypes := OrderedCollection new.
	
	coreContent specTypes collect: [ :aSpecType | 
		(aSpecType class asString = 'SpecObjectType')
			ifTrue: [ specObjectTypes add: aSpecType ] 
	].
	
	^ specObjectTypes
]

{ #category : #accessing }
SpecObject >> gtSpecObjectDetailFor: aView [
	<gtView>
	^ aView columnedList
		title: ((self type) longName), ' values';
		priority: 1;
		items: [ self values ];
		column: 'Property' text: [ :anAttributeValue | anAttributeValue attributeName ];
		column: 'Value' text: [ :anAttributeValue | anAttributeValue theValue ];
		updateWhen: ReqIFChanged in: [ (self coreContent) documentRoot announcer ]
]

{ #category : #accessing }
SpecObject >> gtSpecObjectEditorFor: aView [
	<gtView>
	^ aView explicit
		title: 'Edit object';
		priority: 2;
		stencil: [
			self asEditView
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical fitContent ];
				yourself
		]
]

{ #category : #accessing }
SpecObject >> printOn: aStream [
	aStream nextPutAll: (self type longName)
]

{ #category : #accessing }
SpecObject >> type [
	^ type
]

{ #category : #accessing }
SpecObject >> type: anObject [
	type := anObject
]

{ #category : #accessing }
SpecObject >> writeOn: aWriter [
	aWriter tag
		name: 'SPEC-OBJECT';
		attributeAt: 'IDENTIFIER' put: (self identifier);
		attributeAt: 'LONG-NAME' put: (self longName);
		attributeAt: 'DESC' put: (self desc);
		attributeAt: 'LAST-CHANGE' put: (self lastChange);
		with: [
			aWriter tag: 'VALUES' with: [
				values do: [ :anAttributeValue |
					anAttributeValue writeOn: aWriter
				]
			].
			
			aWriter tag: 'TYPE' with: [
				aWriter tag: 'SPEC-OBJECT-TYPE-REF' with: ((self type) identifier)
			].
		].
]

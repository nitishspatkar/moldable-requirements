Class {
	#name : #SpecHierarchy,
	#superclass : #AccessControlledElement,
	#instVars : [
		'isTableInternal',
		'children',
		'editableAtts',
		'parent',
		'root',
		'object'
	],
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
SpecHierarchy class >> fromRawData: aSpecHierarchy root: aSpecification parent: aParent [
	| instance childrenCollection specHierarchy  children specObjectRef object |
	
	childrenCollection := OrderedCollection new.
	
	specObjectRef := ((aSpecHierarchy elementAt: 'OBJECT') contentStringAt: 'SPEC-OBJECT-REF').
	object := (((aSpecification coreContent) specObjects) at: specObjectRef).
	
	instance := self 
		identifier: (aSpecHierarchy attributeAt: 'IDENTIFIER')
		longName: (aSpecHierarchy attributeAt: 'LONG-NAME')
		desc: (aSpecHierarchy attributeAt: 'DESC')
		lastChange: (aSpecHierarchy attributeAt: 'LAST-CHANGE')
		isEditable: (aSpecHierarchy attributeAt: 'IS-EDITABLE')
		isTableInternal: (aSpecHierarchy attributeAt: 'IS-TABLE-INTERNAL')
		object: object
		children: childrenCollection
		parent: aParent
		root: aSpecification.
		
	children := (aSpecHierarchy elementAt: 'CHILDREN').
	(children isNil) ifFalse: [
		children elementsDo: [ :aChild |
			specHierarchy := (SpecHierarchy fromRawData: aChild root: aSpecification parent: instance).
			childrenCollection add: specHierarchy.
		].
	].
	
	(instance children: childrenCollection).
	
	^ instance
]

{ #category : #accessing }
SpecHierarchy class >> identifier: anIdString longName: aNameString desc: aDescString lastChange: aDateString isEditable: aIsEditableBoolean isTableInternal: aIsTableInternalBoolean object: aSpecObject children: aCollection parent: aParent root: aSpecification [
 	^ self new
		identifier: anIdString;
		longName: aNameString;
		desc: aDescString;
		lastChange: aDateString;
		isEditable: aIsEditableBoolean;
		isTableInternal: aIsTableInternalBoolean;
		object: aSpecObject;
		children: aCollection;
		parent: aParent;
		root: aSpecification;
		yourself
]

{ #category : #accessing }
SpecHierarchy >> children [
	^ children
]

{ #category : #accessing }
SpecHierarchy >> children: anObject [
	children := anObject
]

{ #category : #accessing }
SpecHierarchy >> editableAtts [
	^ editableAtts
]

{ #category : #accessing }
SpecHierarchy >> editableAtts: anObject [
	editableAtts := anObject
]

{ #category : #accessing }
SpecHierarchy >> gtSpecHierarchyChildrenFor: aView [
	<gtView>
	(self children isNil) ifTrue: [^ aView empty].
	(self children isEmpty) ifTrue: [^ aView empty].
	^ aView list
		title: 'Children';
		priority: 2;
		items: [ self children ];
		itemText: [:aSpecHierarchy | ((aSpecHierarchy object) type) longName]
]

{ #category : #accessing }
SpecHierarchy >> gtSpecHierarchyObjectFor: aView [
	<gtView>
	(self children isNil) ifTrue: [^ aView empty].
	^ aView columnedList
		title: ((self object) type) longName , ' values';
		priority: 1;
		items: [ ((self object) values) ];
		column: 'Property' text: [ :anAttributeValue | (anAttributeValue definition) longName ];
		column: 'Value' text: [ :anAttributeValue | anAttributeValue theValue ]
]

{ #category : #accessing }
SpecHierarchy >> isTableInternal [
	^ isTableInternal
]

{ #category : #accessing }
SpecHierarchy >> isTableInternal: anObject [
	isTableInternal := anObject
]

{ #category : #accessing }
SpecHierarchy >> object [
	^ object
]

{ #category : #accessing }
SpecHierarchy >> object: anObject [
	object := anObject
]

{ #category : #accessing }
SpecHierarchy >> parent [
	^ parent
]

{ #category : #accessing }
SpecHierarchy >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
SpecHierarchy >> printOn: aStream [
	aStream nextPutAll: (self object type longName)
]

{ #category : #accessing }
SpecHierarchy >> root [
	^ root
]

{ #category : #accessing }
SpecHierarchy >> root: anObject [
	root := anObject
]

{ #category : #accessing }
SpecHierarchy >> writeOn: aWriter [
	aWriter tag
		name: 'SPEC-HIERARCHY';
		attributeAt: 'IDENTIFIER' put: (self identifier);
		attributeAt: 'LAST-CHANGE' put: (self lastChange);
		attributeAt: 'IS-EDITABLE' put: (self isEditable);
		with: [			
			aWriter tag: 'OBJECT' with: [
				aWriter tag: 'SPEC-OBJECT-REF' with: ((self object) identifier)
			].
			
			aWriter tag: 'CHILDREN' with: [
				children do: [ :aSpecHierarchy |
					aSpecHierarchy writeOn: aWriter
				]
			].
		].
]

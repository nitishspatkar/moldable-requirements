Class {
	#name : #Specification,
	#superclass : #SpecElementWithAttributes,
	#instVars : [
		'children',
		'coreContent',
		'type'
	],
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
Specification class >> fromRawData: specificationData coreContent: aCoreContentObject [
	| specification typeRef type values valuesCollection value children childrenCollection specHierarchy |
	
	typeRef := ((specificationData elementAt: 'TYPE') contentStringAt: 'SPECIFICATION-TYPE-REF').
	type := ((aCoreContentObject specTypes) at: typeRef).
	
	valuesCollection := OrderedCollection new.
	childrenCollection := OrderedCollection new.
	
	specification := self
		identifier: (specificationData attributeAt: 'IDENTIFIER')
		longName: (specificationData attributeAt: 'LONG-NAME')
		desc: (specificationData attributeAt: 'DESC')
		lastChange: (specificationData attributeAt: 'LAST-CHANGE')
		values: valuesCollection
		type: type
		coreContent: aCoreContentObject
		children: childrenCollection.
	
	values := (specificationData elementAt: 'VALUES').
	values elementsDo:
		[ :aValue |
			value := ((Mapper classForTag: (aValue name)) fromRawData: aValue forSpecEl: specification).
			valuesCollection add: value.
		].
		
	specification values: valuesCollection.	
	
	children := (specificationData elementAt: 'CHILDREN').
	children elementsDo: 
		[ :aChild |
			specHierarchy := (SpecHierarchy fromRawData: aChild root: specification parent: nil).
			childrenCollection add: specHierarchy.
		].
	
	specification children: childrenCollection.
	
	^ specification
]

{ #category : #accessing }
Specification class >> identifier: anIdString longName: aNameString desc: aDescString lastChange: aDateString values: aValuesCollection type: aTypeString coreContent: aCoreContentObject children: aChildrenCollection [
	^ self new
		identifier: anIdString;
		longName: aNameString;
		desc: aDescString;
		lastChange: aDateString;
		values: aValuesCollection;
		type: aTypeString;
		coreContent: aCoreContentObject;
		children: aChildrenCollection;
		yourself
]

{ #category : #accessing }
Specification >> children [
	^ children
]

{ #category : #accessing }
Specification >> children: anObject [
	children := anObject
]

{ #category : #accessing }
Specification >> coreContent [
	^ coreContent
]

{ #category : #accessing }
Specification >> coreContent: anObject [
	coreContent := anObject
]

{ #category : #accessing }
Specification >> gtSpecificationChildrenFor: aView [
	<gtView>
	(self children isNil) ifTrue: [^ aView empty].
	^ aView list
		title: 'Children';
		priority: 2;
		items: [ self children ];
		itemText: [:aSpecHierarchy | ((aSpecHierarchy object) type) longName]
]

{ #category : #accessing }
Specification >> gtSpecificationValuesFor: aView [
	<gtView>
	^ aView columnedList
		title: ((self type) longName), ' values';
		priority: 1;
		items: [ self values ];
		column: 'Property' text: [ :anAttributeValue | (anAttributeValue definition) longName ];
		column: 'Value' text: [ :anAttributeValue | anAttributeValue theValue ]
]

{ #category : #accessing }
Specification >> printOn: aStream [
	aStream nextPutAll: (self type longName)
]

{ #category : #accessing }
Specification >> type [
	^ type
]

{ #category : #accessing }
Specification >> type: anObject [
	type := anObject
]

{ #category : #accessing }
Specification >> writeOn: aWriter [
	aWriter tag
		name: 'SPECIFICATION';
		attributeAt: 'IDENTIFIER' put: (self identifier);
		attributeAt: 'LAST-CHANGE' put: (self lastChange);
		attributeAt: 'LONG-NAME' put: (self longName);
		with: [
			aWriter tag: 'VALUES' with: [
				values do: [ :anAttributeValue |
					anAttributeValue writeOn: aWriter
				]
			].
			
			aWriter tag: 'TYPE' with: [
				aWriter tag: 'SPECIFICATION-TYPE-REF' with: ((self type) identifier)
			].
			
			aWriter tag: 'CHILDREN' with: [
				children do: [ :aSpecHierarchy |
					aSpecHierarchy writeOn: aWriter
				]
			].
		].
]

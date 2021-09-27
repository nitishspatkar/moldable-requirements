Class {
	#name : #DatatypeDefinitionEnumeration,
	#superclass : #DatatypeDefinition,
	#instVars : [
		'specifiedValues'
	],
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
DatatypeDefinitionEnumeration class >> fromRawData: datatype coreContent: aCoreContentObject [
	| specifiedValues valuesCollection key value |
	
	valuesCollection := Dictionary new.
	specifiedValues := (datatype elementAt: 'SPECIFIED-VALUES').
	specifiedValues elementsDo:
		[ :aSpecifiedValue |
			key := (aSpecifiedValue attributeAt: 'IDENTIFIER').
			value := (EnumValue fromRawData: aSpecifiedValue).
			valuesCollection add: (key -> value)
		].
	
	^ self 
		identifier: (datatype attributeAt: 'IDENTIFIER')
		longName: (datatype attributeAt: 'LONG-NAME')
		desc: (datatype attributeAt: 'DESC')
		lastChange: (datatype attributeAt: 'LAST-CHANGE')
		coreContent: aCoreContentObject
		specifiedValues: valuesCollection
]

{ #category : #accessing }
DatatypeDefinitionEnumeration class >> identifier: anIdString longName: aNameString desc: aDescString lastChange: aDateString coreContent: aCoreContentObject specifiedValues: aValuesCollection [
	^ self new
		identifier: anIdString;
		longName: aNameString;
		desc: aDescString;
		lastChange: aDateString;
		coreContent: aCoreContentObject;
		specifiedValues: aValuesCollection;
		yourself
]

{ #category : #accessing }
DatatypeDefinitionEnumeration >> printOn: aStream [
	aStream nextPutAll: (self longName)
]

{ #category : #accessing }
DatatypeDefinitionEnumeration >> specifiedValues [
	^ specifiedValues
]

{ #category : #accessing }
DatatypeDefinitionEnumeration >> specifiedValues: anObject [
	specifiedValues := anObject
]

{ #category : #accessing }
DatatypeDefinitionEnumeration >> type [
	^ 'Enumeration'
]

{ #category : #accessing }
DatatypeDefinitionEnumeration >> writeOn: aWriter [
	aWriter tag
		name: 'DATATYPE-DEFINITION-ENUMERATION';
		attributeAt: 'IDENTIFIER' put: (self identifier);
		attributeAt: 'LAST-CHANGE' put: (self lastChange);
		attributeAt: 'LONG-NAME' put: (self longName);
		with: [
			aWriter tag: 'SPECIFIED-VALUES' with: [
				specifiedValues do: [ :enumValue |
					enumValue writeOn: aWriter
				]
			]
		]
]

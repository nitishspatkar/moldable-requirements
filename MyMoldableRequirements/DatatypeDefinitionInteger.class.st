Class {
	#name : #DatatypeDefinitionInteger,
	#superclass : #DatatypeDefinitionSimple,
	#instVars : [
		'max',
		'min'
	],
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
DatatypeDefinitionInteger class >> fromRawData: datatype coreContent: aCoreContentObject [
	^ self 
		identifier: (datatype attributeAt: 'IDENTIFIER')
		longName: (datatype attributeAt: 'LONG-NAME')
		desc: (datatype attributeAt: 'DESC')
		lastChange: (datatype attributeAt: 'LAST-CHANGE')
		min: (datatype attributeAt: 'MIN')
		max: (datatype attributeAt: 'MAX')
		coreContent: aCoreContentObject
]

{ #category : #accessing }
DatatypeDefinitionInteger class >> identifier: anIdString longName: aNameString desc: aDescString lastChange: aDateString min: aMinString max: aMaxString coreContent: aCoreContentObject [
	^ self new
		identifier: anIdString;
		longName: aNameString;
		desc: aDescString;
		lastChange: aDateString;
		min: aMinString;
		max: aMaxString;
		coreContent: aCoreContentObject;
		yourself
]

{ #category : #accessing }
DatatypeDefinitionInteger >> max [
	^ max
]

{ #category : #accessing }
DatatypeDefinitionInteger >> max: anObject [
	max := anObject
]

{ #category : #accessing }
DatatypeDefinitionInteger >> min [
	^ min
]

{ #category : #accessing }
DatatypeDefinitionInteger >> min: anObject [
	min := anObject
]

{ #category : #accessing }
DatatypeDefinitionInteger >> printOn: aStream [
	aStream nextPutAll: (self longName)
]

{ #category : #accessing }
DatatypeDefinitionInteger >> type [
	^ 'Integer'
]

{ #category : #accessing }
DatatypeDefinitionInteger >> writeOn: aWriter [
	aWriter tag
		name: 'DATATYPE-DEFINITION-INTEGER';
		attributeAt: 'IDENTIFIER' put: (self identifier);
		attributeAt: 'LAST-CHANGE' put: (self lastChange);
		attributeAt: 'LONG-NAME' put: (self longName);
		attributeAt: 'MIN' put: (self min);
		attributeAt: 'MAX' put: (self max).
]

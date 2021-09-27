Class {
	#name : #DatatypeDefinitionReal,
	#superclass : #DatatypeDefinitionSimple,
	#instVars : [
		'max',
		'min',
		'accuracy'
	],
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
DatatypeDefinitionReal class >> fromRawData: datatype coreContent: aCoreContentObject [
	^ self 
		identifier: (datatype attributeAt: 'IDENTIFIER')
		longName: (datatype attributeAt: 'LONG-NAME')
		desc: (datatype attributeAt: 'DESC')
		lastChange: (datatype attributeAt: 'LAST-CHANGE')
		accuracy: (datatype attributeAt: 'ACCURACY')
		min: (datatype attributeAt: 'MIN')
		max: (datatype attributeAt: 'MAX')
		coreContent: aCoreContentObject
]

{ #category : #accessing }
DatatypeDefinitionReal class >> identifier: anIdString longName: aNameString desc: aDescString lastChange: aDateString accuracy: anAccuracy min: aMin max: aMax coreContent: aCoreContentObject [
	^ self new
		identifier: anIdString;
		longName: aNameString;
		desc: aDescString;
		lastChange: aDateString;
		accuracy: anAccuracy;
		min: aMin;
		max: aMax;
		coreContent: aCoreContentObject;
		yourself
]

{ #category : #accessing }
DatatypeDefinitionReal >> accuracy [
	^ accuracy
]

{ #category : #accessing }
DatatypeDefinitionReal >> accuracy: anObject [
	accuracy := anObject
]

{ #category : #accessing }
DatatypeDefinitionReal >> max [
	^ max
]

{ #category : #accessing }
DatatypeDefinitionReal >> max: anObject [
	max := anObject
]

{ #category : #accessing }
DatatypeDefinitionReal >> min [
	^ min
]

{ #category : #accessing }
DatatypeDefinitionReal >> min: anObject [
	min := anObject
]

{ #category : #accessing }
DatatypeDefinitionReal >> printOn: aStream [
	aStream nextPutAll: (self longName)
]

{ #category : #accessing }
DatatypeDefinitionReal >> type [
	^ 'Integer'
]

{ #category : #accessing }
DatatypeDefinitionReal >> writeOn: aWriter [
	aWriter tag
		name: 'DATATYPE-DEFINITION-REAL';
		attributeAt: 'IDENTIFIER' put: (self identifier);
		attributeAt: 'LAST-CHANGE' put: (self lastChange);
		attributeAt: 'LONG-NAME' put: (self longName);
		attributeAt: 'ACCURACY' put: (self accuracy);
		attributeAt: 'MIN' put: (self min);
		attributeAt: 'MAX' put: (self max).
]

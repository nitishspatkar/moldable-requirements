Class {
	#name : #DatatypeDefinitionString,
	#superclass : #DatatypeDefinitionSimple,
	#instVars : [
		'maxLength'
	],
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
DatatypeDefinitionString class >> fromRawData: datatype coreContent: aCoreContentObject [
	^ self 
		identifier: (datatype attributeAt: 'IDENTIFIER')
		longName: (datatype attributeAt: 'LONG-NAME')
		desc: (datatype attributeAt: 'DESC')
		lastChange: (datatype attributeAt: 'LAST-CHANGE')
		maxLength: (datatype attributeAt: 'MAX-LENGTH')
		coreContent: aCoreContentObject
]

{ #category : #accessing }
DatatypeDefinitionString class >> identifier: anIdString longName: aNameString desc: aDescString lastChange: aDateString maxLength: aLengthString coreContent: aCoreContentObject [
	^ self new
		identifier: anIdString;
		longName: aNameString;
		desc: aDescString;
		lastChange: aDateString;
		maxLength: aLengthString;
		coreContent: aCoreContentObject;
		yourself		
]

{ #category : #accessing }
DatatypeDefinitionString >> maxLength [
	^ maxLength
]

{ #category : #accessing }
DatatypeDefinitionString >> maxLength: aString [
	maxLength := aString
]

{ #category : #accessing }
DatatypeDefinitionString >> printOn: aStream [
	aStream nextPutAll: (self longName)
]

{ #category : #accessing }
DatatypeDefinitionString >> type [
	^ 'String'
]

{ #category : #accessing }
DatatypeDefinitionString >> writeOn: aWriter [
	aWriter tag
		name: 'DATATYPE-DEFINITION-STRING';
		attributeAt: 'IDENTIFIER' put: (self identifier);
		attributeAt: 'LAST-CHANGE' put: (self lastChange);
		attributeAt: 'LONG-NAME' put: (self longName);
		attributeAt: 'MAX-LENGTH' put: (self maxLength).
]

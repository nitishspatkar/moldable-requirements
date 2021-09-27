Class {
	#name : #DatatypeDefinitionDate,
	#superclass : #DatatypeDefinitionSimple,
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
DatatypeDefinitionDate class >> fromRawData: datatype coreContent: aCoreContentObject [
	^ self 
		identifier: (datatype attributeAt: 'IDENTIFIER')
		longName: (datatype attributeAt: 'LONG-NAME')
		desc: (datatype attributeAt: 'DESC')
		lastChange: (datatype attributeAt: 'LAST-CHANGE')
		coreContent: aCoreContentObject
]

{ #category : #accessing }
DatatypeDefinitionDate class >> identifier: anIdString longName: aNameString desc: aDescString lastChange: aDateString coreContent: aCoreContentObject [
	^ self new
		identifier: anIdString;
		longName: aNameString;
		desc: aDescString;
		lastChange: aDateString;
		coreContent: aCoreContentObject;
		yourself
]

{ #category : #accessing }
DatatypeDefinitionDate >> printOn: aStream [
	aStream nextPutAll: (self longName)
]

{ #category : #accessing }
DatatypeDefinitionDate >> type [
	^ 'Integer'
]

{ #category : #accessing }
DatatypeDefinitionDate >> writeOn: aWriter [
	aWriter tag
		name: 'DATATYPE-DEFINITION-DATE';
		attributeAt: 'IDENTIFIER' put: (self identifier);
		attributeAt: 'LAST-CHANGE' put: (self lastChange);
		attributeAt: 'LONG-NAME' put: (self longName).
]

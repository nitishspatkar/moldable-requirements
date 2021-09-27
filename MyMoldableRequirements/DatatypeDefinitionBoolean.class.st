Class {
	#name : #DatatypeDefinitionBoolean,
	#superclass : #DatatypeDefinitionSimple,
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
DatatypeDefinitionBoolean class >> fromRawData: datatype coreContent: aCoreContentObject [
	^ self 
		identifier: (datatype attributeAt: 'IDENTIFIER')
		longName: (datatype attributeAt: 'LONG-NAME')
		desc: (datatype attributeAt: 'DESC')
		lastChange: (datatype attributeAt: 'LAST-CHANGE')
		coreContent: aCoreContentObject
]

{ #category : #accessing }
DatatypeDefinitionBoolean class >> identifier: anIdString longName: aNameString desc: aDescString lastChange: aDateString coreContent: aCoreContentObject [
	^ self new
		identifier: anIdString;
		longName: aNameString;
		desc: aDescString;
		lastChange: aDateString;
		coreContent: aCoreContentObject;
		yourself
]

{ #category : #accessing }
DatatypeDefinitionBoolean >> printOn: aStream [
	aStream nextPutAll: (self longName)
]

{ #category : #accessing }
DatatypeDefinitionBoolean >> type [
	^ 'Integer'
]

{ #category : #accessing }
DatatypeDefinitionBoolean >> writeOn: aWriter [
	aWriter tag
		name: 'DATATYPE-DEFINITION-BOOLEAN';
		attributeAt: 'IDENTIFIER' put: (self identifier);
		attributeAt: 'LAST-CHANGE' put: (self lastChange);
		attributeAt: 'LONG-NAME' put: (self longName).
]

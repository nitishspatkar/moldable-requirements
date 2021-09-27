Class {
	#name : #AttributeDefinitionReal,
	#superclass : #AttributeDefinitionSimple,
	#instVars : [
		'defaultValue'
	],
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
AttributeDefinitionReal class >> fromRawData: anAttributeDefinition specType: aSpecType [
	| type typeRef typeObject |
	
	type := (anAttributeDefinition elementAt: 'TYPE').
	type ifNotNil: [
		typeRef := (type contentStringAt: 'DATATYPE-DEFINITION-REAL-REF').
		typeObject := (aSpecType coreContent datatypes at: typeRef)].
	
	^ self 
		identifier: (anAttributeDefinition attributeAt: 'IDENTIFIER')
		longName: (anAttributeDefinition attributeAt: 'LONG-NAME')
		desc: (anAttributeDefinition attributeAt: 'DESC')
		lastChange: (anAttributeDefinition attributeAt: 'LAST-CHANGE')
		isEditable: (anAttributeDefinition attributeAt: 'IS-EDITABLE')
		type: typeObject
		specType: aSpecType
]

{ #category : #accessing }
AttributeDefinitionReal class >> identifier: anIdString longName: aNameString desc: aDescString lastChange: aDateString isEditable: aBoolean type: aType specType: aSpecType [
 	^ self new
		identifier: anIdString;
		longName: aNameString;
		desc: aDescString;
		lastChange: aDateString;
		isEditable: aBoolean;
		type: aType;
		specType: aSpecType;
		yourself
]

{ #category : #accessing }
AttributeDefinitionReal >> defaultValue [
	^ defaultValue
]

{ #category : #accessing }
AttributeDefinitionReal >> defaultValue: aString [
	defaultValue := aString
]

{ #category : #accessing }
AttributeDefinitionReal >> writeOn: aWriter [
	aWriter tag
		name: 'ATTRIBUTE-DEFINITION-REAL';
		attributeAt: 'IDENTIFIER' put: (self identifier);
		attributeAt: 'LAST-CHANGE' put: (self lastChange);
		attributeAt: 'LONG-NAME' put: (self longName);
		attributeAt: 'IS-EDITABLE' put: (self isEditable);
		with: [
			aWriter tag: 'TYPE' with: [
				aWriter tag: 'DATATYPE-DEFINITION-REAL-REF' with: (self type identifier)
			]
		]
]

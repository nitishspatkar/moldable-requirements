Class {
	#name : #AttributeDefinitionEnumeration,
	#superclass : #AttributeDefinition,
	#instVars : [
		'defaultValue'
	],
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
AttributeDefinitionEnumeration class >> fromRawData: anAttributeDefinition specType: aSpecType [
	| type typeRef typeObject |
	
	type := (anAttributeDefinition elementAt: 'TYPE').
	type ifNotNil: [
		typeRef := (type contentStringAt: 'DATATYPE-DEFINITION-ENUMERATION-REF').
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
AttributeDefinitionEnumeration class >> identifier: anIdString longName: aNameString desc: aDescString lastChange: aDateString isEditable: aBoolean type: aType specType: aSpecType [
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
AttributeDefinitionEnumeration >> defaultValue [
	^ defaultValue
]

{ #category : #accessing }
AttributeDefinitionEnumeration >> defaultValue: aString [
	defaultValue := aString
]

{ #category : #accessing }
AttributeDefinitionEnumeration >> writeOn: aWriter [
	aWriter tag
		name: 'ATTRIBUTE-DEFINITION-ENUMERATION';
		attributeAt: 'IDENTIFIER' put: (self identifier);
		attributeAt: 'LAST-CHANGE' put: (self lastChange);
		attributeAt: 'LONG-NAME' put: (self longName);
		attributeAt: 'IS-EDITABLE' put: (self isEditable);
		with: [
			aWriter tag: 'TYPE' with: [
				aWriter tag: 'DATATYPE-DEFINITION-ENUMERATION-REF' with: (self type identifier)
			]
		]
]

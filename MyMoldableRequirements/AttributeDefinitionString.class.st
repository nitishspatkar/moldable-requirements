Class {
	#name : #AttributeDefinitionString,
	#superclass : #AttributeDefinitionSimple,
	#instVars : [
		'defaultValue'
	],
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
AttributeDefinitionString class >> fromRawData: anAttributeDefinition specType: aSpecType [
	| type typeRef typeObject |
	
	type := (anAttributeDefinition elementAt: 'TYPE').
	type ifNotNil: [
		typeRef := (type contentStringAt: 'DATATYPE-DEFINITION-STRING-REF').
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
AttributeDefinitionString class >> identifier: anIdString longName: aNameString desc: aDescString lastChange: aDateString isEditable: aBoolean type: aType specType: aSpecType [
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
AttributeDefinitionString >> defaultValue [
	^ defaultValue
]

{ #category : #accessing }
AttributeDefinitionString >> defaultValue: aString [
	defaultValue := aString
]

{ #category : #accessing }
AttributeDefinitionString >> writeOn: aWriter [
	aWriter tag
		name: 'ATTRIBUTE-DEFINITION-STRING';
		attributeAt: 'IDENTIFIER' put: (self identifier);
		attributeAt: 'LAST-CHANGE' put: (self lastChange);
		attributeAt: 'LONG-NAME' put: (self longName);
		attributeAt: 'IS-EDITABLE' put: (self isEditable);
		with: [
			aWriter tag: 'TYPE' with: [
				aWriter tag: 'DATATYPE-DEFINITION-STRING-REF' with: (self type identifier)
			]
		]
]

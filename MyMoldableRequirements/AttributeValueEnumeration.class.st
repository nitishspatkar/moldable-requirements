Class {
	#name : #AttributeValueEnumeration,
	#superclass : #AttributeValue,
	#instVars : [
		'values'
	],
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
AttributeValueEnumeration class >> fromRawData: anAttributeValue forSpecEl: aSpecEl [
	| definition definitionRef definitionObject owningDefinition owningDefinitionRef owningDefinitionObject valuesCollection |
	
	definition := (anAttributeValue elementAt: 'DEFINITION').
	definition ifNotNil: [
		definitionRef := (definition contentStringAt: 'ATTRIBUTE-DEFINITION-ENUMERATION-REF').
		definitionObject := ((aSpecEl type) specAttributes) at: definitionRef ].
	
	owningDefinition := (anAttributeValue elementAt: 'OWNING-DEFINITION').
	owningDefinition ifNotNil: [
		owningDefinitionRef := (owningDefinition contentStringAt: 'ATTRIBUTE-DEFINITION-ENUMERATION-REF').
		owningDefinitionObject := ((aSpecEl type) specAttributes) at: owningDefinitionRef].

	owningDefinition ifNil: [owningDefinitionObject := definitionObject ].
	
	valuesCollection := OrderedCollection new.
	(anAttributeValue elementAt: 'VALUES') elementsDo: [ :aValue | 
		valuesCollection add: (definitionObject type specifiedValues at: (aValue contentString)) ].
	
	^ self 
		values: valuesCollection
		definition: definitionObject
		owningDefinition: owningDefinitionObject
		specElAt: aSpecEl
]

{ #category : #accessing }
AttributeValueEnumeration class >> newForDefinition: aDefinition forSpecEl: aSpecEl [		
	^ self 
		values: OrderedCollection new
		definition: aDefinition
		owningDefinition: aDefinition
		specElAt: aSpecEl
]

{ #category : #accessing }
AttributeValueEnumeration class >> values: aString definition: aDefinition owningDefinition: anOwningDefinition specElAt: aSpecElIdentifier [
	^ self new
		values: aString;
		definition: aDefinition;
		owningDefinition: anOwningDefinition;
		specElAt: aSpecElIdentifier;
		yourself
]

{ #category : #accessing }
AttributeValueEnumeration >> definition [
	^ definition
]

{ #category : #accessing }
AttributeValueEnumeration >> definition: anObject [
	definition := anObject
]

{ #category : #accessing }
AttributeValueEnumeration >> owningDefinition [
	^ owningDefinition
]

{ #category : #accessing }
AttributeValueEnumeration >> owningDefinition: anObject [
	owningDefinition := anObject
]

{ #category : #accessing }
AttributeValueEnumeration >> theValue [
	| valueString |
	valueString := ''.
	values doWithIndex: [ :aValue :i | 
		(i > 1) ifTrue: [ valueString := valueString , ', '].
		valueString := valueString , (aValue longName) ].
	
	^ valueString
]

{ #category : #accessing }
AttributeValueEnumeration >> values [
	^ values
]

{ #category : #accessing }
AttributeValueEnumeration >> values: anObject [
	values := anObject
]

{ #category : #accessing }
AttributeValueEnumeration >> writeOn: aWriter [
	aWriter tag
		name: 'ATTRIBUTE-VALUE-ENUMERATION';
		with: [
			aWriter tag: 'VALUES' with: [
				values do: [ :aValue | aWriter tag: 'ENUM-VALUE-REF' with: (aValue identifier) ]
			].
			aWriter tag: 'DEFINITION' with: [
				aWriter tag: 'ATTRIBUTE-DEFINITION-ENUMERATION-REF' with: (self definition identifier)
			].
		]	
]

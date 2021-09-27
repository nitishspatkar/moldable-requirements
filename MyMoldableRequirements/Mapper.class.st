"
The purpose of the mapper class is to match up XML tags with objects in order to parse the content.
"
Class {
	#name : #Mapper,
	#superclass : #Object,
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
Mapper class >> classForTag: aTag [
	| classes |
	classes := Dictionary new.
	
	classes add: 'DATATYPE-DEFINITION-ENUMERATION' -> DatatypeDefinitionEnumeration.
	classes add: 'DATATYPE-DEFINITION-BOOLEAN' -> DatatypeDefinitionBoolean.
	classes add: 'DATATYPE-DEFINITION-DATE' -> DatatypeDefinitionDate.
	classes add: 'DATATYPE-DEFINITION-INTEGER' -> DatatypeDefinitionInteger.
	classes add: 'DATATYPE-DEFINITION-REAL' -> DatatypeDefinitionReal.
	classes add: 'DATATYPE-DEFINITION-STRING' -> DatatypeDefinitionString.
	
	classes add: 'SPEC-OBJECT-TYPE' -> SpecObjectType.
	classes add: 'SPECIFICATION-TYPE' -> SpecificationType.
	
	classes add: 'ATTRIBUTE-DEFINITION-ENUMERATION' -> AttributeDefinitionEnumeration.
	classes add: 'ATTRIBUTE-DEFINITION-BOOLEAN' -> AttributeDefinitionBoolean.
	classes add: 'ATTRIBUTE-DEFINITION-DATE' -> AttributeDefinitionDate.
	classes add: 'ATTRIBUTE-DEFINITION-INTEGER' -> AttributeDefinitionInteger.
	classes add: 'ATTRIBUTE-DEFINITION-REAL' -> AttributeDefinitionReal.
	classes add: 'ATTRIBUTE-DEFINITION-STRING' -> AttributeDefinitionString.
	
	classes add: 'ATTRIBUTE-VALUE-BOOLEAN' -> AttributeValueBoolean.
	classes add: 'ATTRIBUTE-VALUE-DATE' -> AttributeValueDate.
	classes add: 'ATTRIBUTE-VALUE-ENUMERATION' -> AttributeValueEnumeration.
	classes add: 'ATTRIBUTE-VALUE-INTEGER' -> AttributeValueInteger.
	classes add: 'ATTRIBUTE-VALUE-REAL' -> AttributeValueReal.
	classes add: 'ATTRIBUTE-VALUE-STRING' -> AttributeValueString.
	
	^ classes at: aTag
	
]

{ #category : #accessing }
Mapper class >> valueObjectForDefinition: anAttributeDefinition [
	| classes |
	classes := Dictionary new.
	
	classes add: AttributeDefinitionEnumeration -> AttributeValueEnumeration.
	classes add: AttributeDefinitionBoolean -> AttributeValueBoolean.
	classes add: AttributeDefinitionDate -> AttributeValueDate.
	classes add: AttributeDefinitionInteger -> AttributeValueInteger.
	classes add: AttributeDefinitionReal -> AttributeValueReal.
	classes add: AttributeDefinitionString -> AttributeValueString.
	
	^ classes at: anAttributeDefinition
]

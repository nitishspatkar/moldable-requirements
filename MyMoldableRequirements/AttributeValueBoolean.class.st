Class {
	#name : #AttributeValueBoolean,
	#superclass : #AttributeValueSimple,
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
AttributeValueBoolean class >> fromRawData: anAttributeValue forSpecEl: aSpecEl [
	| definition definitionRef definitionObject owningDefinition owningDefinitionRef owningDefinitionObject |
	
	definition := (anAttributeValue elementAt: 'DEFINITION').
	definition ifNotNil: [
		definitionRef := (definition contentStringAt: 'ATTRIBUTE-DEFINITION-BOOLEAN-REF').
		definitionObject := ((aSpecEl type) specAttributes) at: definitionRef ].
	
	owningDefinition := (anAttributeValue elementAt: 'OWNING-DEFINITION').
	owningDefinition ifNotNil: [
		owningDefinitionRef := (owningDefinition contentStringAt: 'ATTRIBUTE-DEFINITION-BOOLEAN-REF').
		owningDefinitionObject := ((aSpecEl type) specAttributes) at: owningDefinitionRef].
	
	owningDefinition ifNil: [owningDefinitionObject := definitionObject].
	
	^ self 
		theValue: (anAttributeValue attributeAt: 'THE-VALUE')
		definition: definitionObject
		owningDefinition: owningDefinitionObject
		specElAt: aSpecEl
]

{ #category : #accessing }
AttributeValueBoolean class >> newForDefinition: aDefinition forSpecEl: aSpecEl [
	| value |
	
	((aDefinition defaultValue) isNotNil)
		ifTrue: [ value := aDefinition defaultValue]
		ifFalse: [ value := '' ].
		
	^ self 
		theValue: value
		definition: aDefinition
		owningDefinition: aDefinition
		specElAt: aSpecEl
]

{ #category : #accessing }
AttributeValueBoolean class >> theValue: aString definition: aDefinition owningDefinition: anOwningDefinition specElAt: aSpecElIdentifier [
	^ self new
		theValue: aString;
		definition: aDefinition;
		owningDefinition: anOwningDefinition;
		specElAt: aSpecElIdentifier;
		yourself
]

{ #category : #accessing }
AttributeValueBoolean >> asValueEditor [
	^ BrCheckbox new
		aptitude: BrGlamorousCheckboxAptitude;
		checked: theValue;
		whenCheckedDo: [ 
			self theValue: true. 
			(self specElAt) coreContent documentRoot announcer announce: (ReqIFChanged new) ];
		whenUncheckedDo: [ 
			self theValue: false.
			(self specElAt) coreContent documentRoot announcer announce: (ReqIFChanged new) ];
		yourself.
]

{ #category : #accessing }
AttributeValueBoolean >> definition [
	^ definition
]

{ #category : #accessing }
AttributeValueBoolean >> definition: anObject [
	definition := anObject
]

{ #category : #accessing }
AttributeValueBoolean >> owningDefinition [
	^ owningDefinition
]

{ #category : #accessing }
AttributeValueBoolean >> owningDefinition: anObject [
	owningDefinition := anObject
]

{ #category : #accessing }
AttributeValueBoolean >> theValue [
	^ theValue
]

{ #category : #accessing }
AttributeValueBoolean >> theValue: anObject [
	theValue := anObject
]

{ #category : #accessing }
AttributeValueBoolean >> writeOn: aWriter [
	aWriter tag
		name: 'ATTRIBUTE-VALUE-BOOLEAN';
		attributeAt: 'THE-VALUE' put: (self theValue);
		with: [
			aWriter tag: 'DEFINITION' with: [
				aWriter tag: 'ATTRIBUTE-DEFINITION-BOOLEAN-REF' with: (self definition identifier)
			].
		].
]

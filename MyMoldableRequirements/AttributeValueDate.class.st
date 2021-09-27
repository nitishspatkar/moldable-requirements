Class {
	#name : #AttributeValueDate,
	#superclass : #AttributeValueSimple,
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
AttributeValueDate class >> fromRawData: anAttributeValue forSpecEl: aSpecEl [
	| definition definitionRef definitionObject owningDefinition owningDefinitionRef owningDefinitionObject |
	
	definition := (anAttributeValue elementAt: 'DEFINITION').
	definition ifNotNil: [
		definitionRef := (definition contentStringAt: 'ATTRIBUTE-DEFINITION-DATE-REF').
		definitionObject := ((aSpecEl type) specAttributes) at: definitionRef ].
	
	owningDefinition := (anAttributeValue elementAt: 'OWNING-DEFINITION').
	owningDefinition ifNotNil: [
		owningDefinitionRef := (owningDefinition contentStringAt: 'ATTRIBUTE-DEFINITION-DATE-REF').
		owningDefinitionObject := ((aSpecEl type) specAttributes) at: owningDefinitionRef ].
	
	owningDefinition ifNil: [owningDefinitionObject := definitionObject].
	
	^ self 
		theValue: (anAttributeValue attributeAt: 'THE-VALUE')
		definition: definitionObject
		owningDefinition: owningDefinitionObject
		specElAt: aSpecEl
]

{ #category : #accessing }
AttributeValueDate class >> newForDefinition: aDefinition forSpecEl: aSpecEl [
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
AttributeValueDate class >> theValue: aString definition: aDefinition owningDefinition: anOwningDefinition specElAt: aSpecElIdentifier [
	^ self new
		theValue: aString;
		definition: aDefinition;
		owningDefinition: anOwningDefinition;
		specElAt: aSpecElIdentifier;
		yourself
]

{ #category : #accessing }
AttributeValueDate >> asValueEditor [
	^ BrEditableLabel new
		aptitude: BrGlamorousEditableLabelAptitude new glamorousRegularFontAndSize;
		text: theValue;
		when: BrEditorAcceptWish do: [ :aWish | 
			theValue := aWish text asString.
			(self specElAt) coreContent documentRoot announcer announce: (ReqIFChanged new) ];
		yourself.
]

{ #category : #accessing }
AttributeValueDate >> definition [
	^ definition
]

{ #category : #accessing }
AttributeValueDate >> definition: anObject [
	definition := anObject
]

{ #category : #accessing }
AttributeValueDate >> owningDefinition [
	^ owningDefinition
]

{ #category : #accessing }
AttributeValueDate >> owningDefinition: anObject [
	owningDefinition := anObject
]

{ #category : #accessing }
AttributeValueDate >> theValue [
	^ theValue
]

{ #category : #accessing }
AttributeValueDate >> theValue: anObject [
	theValue := anObject
]

{ #category : #accessing }
AttributeValueDate >> writeOn: aWriter [
	aWriter tag
		name: 'ATTRIBUTE-VALUE-DATE';
		attributeAt: 'THE-VALUE' put: (self theValue);
		with: [
			aWriter tag: 'DEFINITION' with: [
				aWriter tag: 'ATTRIBUTE-DEFINITION-DATE-REF' with: (self definition identifier)
			].
		].
]

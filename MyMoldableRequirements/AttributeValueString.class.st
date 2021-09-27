Class {
	#name : #AttributeValueString,
	#superclass : #AttributeValueSimple,
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
AttributeValueString class >> fromRawData: anAttributeValue forSpecEl: aSpecEl [
	| definition definitionRef definitionObject owningDefinition owningDefinitionRef owningDefinitionObject |
	
	definition := (anAttributeValue elementAt: 'DEFINITION').
	definition ifNotNil: [
		definitionRef := (definition contentStringAt: 'ATTRIBUTE-DEFINITION-STRING-REF').
		definitionObject := ((aSpecEl type) specAttributes) at: definitionRef ].
	
	owningDefinition := (anAttributeValue elementAt: 'OWNING-DEFINITION').
	owningDefinition ifNotNil: [
		owningDefinitionRef := (owningDefinition contentStringAt: 'ATTRIBUTE-DEFINITION-STRING-REF').
		owningDefinitionObject := ((aSpecEl type) specAttributes) at: owningDefinitionRef ].
	
	owningDefinition ifNil: [owningDefinitionObject := definitionObject ].
	
	^ self 
		theValue: (anAttributeValue attributeAt: 'THE-VALUE')
		definition: definitionObject
		owningDefinition: owningDefinitionObject
		specElAt: aSpecEl
]

{ #category : #accessing }
AttributeValueString class >> newForDefinition: aDefinition forSpecEl: aSpecEl [
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
AttributeValueString class >> theValue: aString definition: aDefinition owningDefinition: anOwningDefinition specElAt: aSpecElIdentifier [
	^ self new
		theValue: aString;
		definition: aDefinition;
		owningDefinition: anOwningDefinition;
		specElAt: aSpecElIdentifier;
		yourself
]

{ #category : #accessing }
AttributeValueString >> asValueEditor [
	^ BrEditableLabel new
		aptitude: BrGlamorousEditableLabelAptitude new glamorousRegularFontAndSize;
		text: theValue;
		when: BrEditorAcceptWish do: [ :aWish | 
			theValue := aWish text asString.
			(self specElAt) coreContent documentRoot announcer announce: (ReqIFChanged new) ];
		yourself.
]

{ #category : #accessing }
AttributeValueString >> theValue [
	^ theValue
]

{ #category : #accessing }
AttributeValueString >> theValue: anObject [
	theValue := anObject
]

{ #category : #accessing }
AttributeValueString >> writeOn: aWriter [
	aWriter tag
		name: 'ATTRIBUTE-VALUE-STRING';
		attributeAt: 'THE-VALUE' put: (self theValue);
		with: [
			aWriter tag: 'DEFINITION' with: [
				aWriter tag: 'ATTRIBUTE-DEFINITION-STRING-REF' with: (self definition identifier)
			].
		].
]

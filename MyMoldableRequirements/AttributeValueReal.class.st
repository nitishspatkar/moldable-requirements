Class {
	#name : #AttributeValueReal,
	#superclass : #AttributeValueSimple,
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
AttributeValueReal class >> fromRawData: anAttributeValue forSpecEl: aSpecEl [
	| definition definitionRef definitionObject owningDefinition owningDefinitionRef owningDefinitionObject |
	
	definition := (anAttributeValue elementAt: 'DEFINITION').
	definition ifNotNil: [
		definitionRef := (definition contentStringAt: 'ATTRIBUTE-DEFINITION-REAL-REF').
		definitionObject := ((aSpecEl type) specAttributes) at: definitionRef ].
	
	owningDefinition := (anAttributeValue elementAt: 'OWNING-DEFINITION').
	owningDefinition ifNotNil: [
		owningDefinitionRef := (owningDefinition contentStringAt: 'ATTRIBUTE-DEFINITION-REAL-REF').
		owningDefinitionObject := ((aSpecEl type) specAttributes) at: owningDefinitionRef ].
	
	owningDefinition ifNil: [owningDefinitionObject := definitionObject ].
	
	^ self 
		theValue: (anAttributeValue attributeAt: 'THE-VALUE')
		definition: definitionObject
		owningDefinition: owningDefinitionObject
		specElAt: aSpecEl
]

{ #category : #accessing }
AttributeValueReal class >> newForDefinition: aDefinition forSpecEl: aSpecEl [
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
AttributeValueReal class >> theValue: aString definition: aDefinition owningDefinition: anOwningDefinition specElAt: aSpecElIdentifier [
	^ self new
		theValue: aString;
		definition: aDefinition;
		owningDefinition: anOwningDefinition;
		specElAt: aSpecElIdentifier;
		yourself
]

{ #category : #accessing }
AttributeValueReal >> asValueEditor [
	^ BrEditableLabel new
		aptitude: BrGlamorousEditableLabelAptitude new glamorousRegularFontAndSize;
		text: theValue;
		when: BrEditorAcceptWish do: [ :aWish | 
			theValue := aWish text asString.
			(self specElAt) coreContent documentRoot announcer announce: (ReqIFChanged new) ];
		yourself.
]

{ #category : #accessing }
AttributeValueReal >> theValue [
	^ theValue
]

{ #category : #accessing }
AttributeValueReal >> theValue: anObject [
	theValue := anObject
]

{ #category : #accessing }
AttributeValueReal >> writeOn: aWriter [
	aWriter tag
		name: 'ATTRIBUTE-VALUE-REAL';
		attributeAt: 'THE-VALUE' put: (self theValue);
		with: [
			aWriter tag: 'DEFINITION' with: [
				aWriter tag: 'ATTRIBUTE-DEFINITION-REAL-REF' with: (self definition identifier)
			].
		].
]

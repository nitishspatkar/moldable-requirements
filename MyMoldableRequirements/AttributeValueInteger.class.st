Class {
	#name : #AttributeValueInteger,
	#superclass : #AttributeValueSimple,
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
AttributeValueInteger class >> fromRawData: anAttributeValue forSpecEl: aSpecEl [
	| definition definitionRef definitionObject owningDefinition owningDefinitionRef owningDefinitionObject |
	
	definition := (anAttributeValue elementAt: 'DEFINITION').
	definition ifNotNil: [
		definitionRef := (definition contentStringAt: 'ATTRIBUTE-DEFINITION-INTEGER-REF').
		definitionObject := ((aSpecEl type) specAttributes) at: definitionRef ].
	
	owningDefinition := (anAttributeValue elementAt: 'OWNING-DEFINITION').
	owningDefinition ifNotNil: [
		owningDefinitionRef := (owningDefinition contentStringAt: 'ATTRIBUTE-DEFINITION-INTEGER-REF').
		owningDefinitionObject := ((aSpecEl type) specAttributes) at: owningDefinitionRef ].
	
	owningDefinition ifNil: [owningDefinitionObject := definitionObject].
	
	^ self 
		theValue: (anAttributeValue attributeAt: 'THE-VALUE')
		definition: definitionObject
		owningDefinition: owningDefinitionObject
		specElAt: aSpecEl
]

{ #category : #accessing }
AttributeValueInteger class >> newForDefinition: aDefinition forSpecEl: aSpecEl [
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
AttributeValueInteger class >> theValue: aString definition: aDefinition owningDefinition: anOwningDefinition specElAt: aSpecElIdentifier [
	^ self new
		theValue: aString;
		definition: aDefinition;
		owningDefinition: anOwningDefinition;
		specElAt: aSpecElIdentifier;
		yourself
]

{ #category : #accessing }
AttributeValueInteger >> asValueEditor [
	^ BrEditableLabel new
		aptitude: BrGlamorousEditableLabelAptitude new glamorousRegularFontAndSize;
		text: theValue;
		when: BrEditorAcceptWish do: [ :aWish | 
			theValue := aWish text asString.
			(self specElAt) coreContent documentRoot announcer announce: (ReqIFChanged new) ];
		yourself.
]

{ #category : #accessing }
AttributeValueInteger >> definition [
	^ definition
]

{ #category : #accessing }
AttributeValueInteger >> definition: anObject [
	definition := anObject
]

{ #category : #accessing }
AttributeValueInteger >> owningDefinition [
	^ owningDefinition
]

{ #category : #accessing }
AttributeValueInteger >> owningDefinition: anObject [
	owningDefinition := anObject
]

{ #category : #accessing }
AttributeValueInteger >> theValue [
	^ theValue
]

{ #category : #accessing }
AttributeValueInteger >> theValue: anObject [
	theValue := anObject
]

{ #category : #accessing }
AttributeValueInteger >> writeOn: aWriter [
	aWriter tag
		name: 'ATTRIBUTE-VALUE-INTEGER';
		attributeAt: 'THE-VALUE' put: (self theValue);
		with: [
			aWriter tag: 'DEFINITION' with: [
				aWriter tag: 'ATTRIBUTE-DEFINITION-INTEGER-REF' with: (self definition identifier)
			].
		].
]

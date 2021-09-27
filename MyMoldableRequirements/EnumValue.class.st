Class {
	#name : #EnumValue,
	#superclass : #Identifiable,
	#instVars : [
		'dataTypeDefEnum',
		'properties'
	],
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
EnumValue class >> fromRawData: aSpecifiedValue [
	| propertiesCollection item properties |
	propertiesCollection := OrderedCollection new.
	properties := (aSpecifiedValue elementAt: 'PROPERTIES').
	properties elementsDo:
		[ :aProperty |
			item := (EmbeddedValue fromRawData: aProperty).
			propertiesCollection add: item
		].

	^ self 
		identifier: (aSpecifiedValue attributeAt: 'IDENTIFIER')
		longName: (aSpecifiedValue attributeAt: 'LONG-NAME')
		desc: (aSpecifiedValue attributeAt: 'DESC')
		lastChange: (aSpecifiedValue attributeAt: 'LAST-CHANGE')
		properties: propertiesCollection
]

{ #category : #accessing }
EnumValue class >> identifier: anIdString longName: aNameString desc: aDescString lastChange: aDateString properties: aCollection [
	^ self new
		identifier: anIdString;
		longName: aNameString;
		desc: aDescString;
		lastChange: aDateString;
		properties: aCollection;
		yourself		
]

{ #category : #accessing }
EnumValue >> dataTypeDefEnum [
	^ dataTypeDefEnum
]

{ #category : #accessing }
EnumValue >> dataTypeDefEnum: anObject [
	dataTypeDefEnum := anObject
]

{ #category : #accessing }
EnumValue >> properties [
	^ properties
]

{ #category : #accessing }
EnumValue >> properties: anObject [
	properties := anObject
]

{ #category : #accessing }
EnumValue >> writeOn: aWriter [
	aWriter tag
		name: 'ENUM-VALUE';
		attributeAt: 'IDENTIFIER' put: (self identifier);
		attributeAt: 'LAST-CHANGE' put: (self lastChange);
		attributeAt: 'LONG-NAME' put: (self longName);
		with: [
			aWriter tag: 'PROPERTIES' with: [
				properties do: [ :embeddedValue |
					embeddedValue writeOn: aWriter
				]
			]
		]
]

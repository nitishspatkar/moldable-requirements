Class {
	#name : #SpecObjectType,
	#superclass : #SpecType,
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
SpecObjectType class >> fromRawData: specObjectType coreContent: aCoreContentObject [
	| instance attributeCollection dict specAttributes key value |

	attributeCollection := Dictionary new.
	
	instance := self
		identifier: (specObjectType attributeAt: 'IDENTIFIER')
		longName: (specObjectType attributeAt: 'LONG-NAME')
		desc: (specObjectType attributeAt: 'DESC')
		lastChange: (specObjectType attributeAt: 'LAST-CHANGE')
		specAttributes: attributeCollection
		coreContent: aCoreContentObject.
	
	specAttributes := (specObjectType elementAt: 'SPEC-ATTRIBUTES').
	specAttributes elementsDo:
		[ :aSpecAttribute |
			key := (aSpecAttribute attributeAt: 'IDENTIFIER').
			value := ((Mapper classForTag: (aSpecAttribute name)) fromRawData: aSpecAttribute specType: instance).
			attributeCollection add: (key -> value)
		].
	
	instance specAttributes: attributeCollection.
	
	^ instance
		
]

{ #category : #accessing }
SpecObjectType class >> identifier: anIdString longName: aNameString desc: aDescString lastChange: aDateString specAttributes: aCollection coreContent: aCoreContentObject [
	^ self new
		identifier: anIdString;
		longName: aNameString;
		desc: aDescString;
		lastChange: aDateString;
		specAttributes: aCollection;
		coreContent: aCoreContentObject;
		yourself
]

{ #category : #accessing }
SpecObjectType >> gtSpecObjectAttributesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Attributes';
		priority: 1;
		items: [ self specAttributes asArray ];
		column: 'Name' text: [ :anAttributeDefinition | anAttributeDefinition longName  ];
		column: 'Description' text: [ :anAttributeDefinition | anAttributeDefinition desc ];
		column: 'Is Editable' text: [ :anAttributeDefinition | anAttributeDefinition isEditable ];
		column: 'Last Change' text: [ :anAttributeDefinition | anAttributeDefinition lastChange ]
]

{ #category : #accessing }
SpecObjectType >> printOn: aStream [
	aStream nextPutAll: (self longName)
]

{ #category : #accessing }
SpecObjectType >> writeOn: aWriter [
	aWriter tag
		name: 'SPEC-OBJECT-TYPE';
		attributeAt: 'IDENTIFIER' put: (self identifier);
		attributeAt: 'LAST-CHANGE' put: (self lastChange);
		attributeAt: 'LONG-NAME' put: (self longName);
		with: [
			aWriter tag: 'SPEC-ATTRIBUTES' with: [
				specAttributes do: [ :attributeDefinition |
					attributeDefinition writeOn: aWriter
				]
			].
		].
]

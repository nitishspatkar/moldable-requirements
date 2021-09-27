Class {
	#name : #SpecificationType,
	#superclass : #SpecType,
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
SpecificationType class >> fromRawData: specificationType coreContent: aCoreContentObject [
	| instance attributeCollection dict specAttributes key value |

	attributeCollection := Dictionary new.
	
	instance := self
		identifier: (specificationType attributeAt: 'IDENTIFIER')
		longName: (specificationType attributeAt: 'LONG-NAME')
		desc: (specificationType attributeAt: 'DESC')
		lastChange: (specificationType attributeAt: 'LAST-CHANGE')
		specAttributes: attributeCollection
		coreContent: aCoreContentObject.
	
	specAttributes := (specificationType elementAt: 'SPEC-ATTRIBUTES').
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
SpecificationType class >> identifier: anIdString longName: aNameString desc: aDescString lastChange: aDateString specAttributes: aCollection coreContent: aCoreContentObject [
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
SpecificationType >> gtSpecificationTypeAttributesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Attributes';
		priority: 1;
		items: [ self specAttributes asArray ];
		column: 'Name' text: [ :aSpecificationType | aSpecificationType longName  ];
		column: 'Description' text: [ :aSpecificationType | aSpecificationType desc ];
		column: 'Is Editable' text: [ :aSpecificationType | aSpecificationType isEditable ];
		column: 'Last Change' text: [ :aSpecificationType | aSpecificationType lastChange ]
]

{ #category : #accessing }
SpecificationType >> printOn: aStream [
	aStream nextPutAll: (self longName)
]

{ #category : #accessing }
SpecificationType >> writeOn: aWriter [
	aWriter tag
		name: 'SPECIFICATION-TYPE';
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

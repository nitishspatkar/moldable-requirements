Class {
	#name : #RelationGroupType,
	#superclass : #SpecType,
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
RelationGroupType class >> fromRawData: relationGroupType coreContent: aCoreContentObject [
	| instance attributeCollection dict specAttributes key value |

	attributeCollection := Dictionary new.
	
	instance := self
		identifier: (relationGroupType attributeAt: 'IDENTIFIER')
		longName: (relationGroupType attributeAt: 'LONG-NAME')
		desc: (relationGroupType attributeAt: 'DESC')
		lastChange: (relationGroupType attributeAt: 'LAST-CHANGE')
		specAttributes: attributeCollection
		coreContent: aCoreContentObject.
	
	specAttributes := (relationGroupType elementAt: 'SPEC-ATTRIBUTES').
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
RelationGroupType class >> identifier: anIdString longName: aNameString desc: aDescString lastChange: aDateString specAttributes: aCollection coreContent: aCoreContentObject [
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
RelationGroupType >> printOn: aStream [
	aStream nextPutAll: (self longName)
]

{ #category : #accessing }
RelationGroupType >> writeOn: aWriter [
	aWriter tag
		name: 'RELATION-GROUP-TYPE';
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

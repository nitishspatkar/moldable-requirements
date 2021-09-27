Class {
	#name : #SpecRelationType,
	#superclass : #SpecType,
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
SpecRelationType class >> fromRawData: specRelationType coreContent: aCoreContentObject [
	| instance attributeCollection dict specAttributes key value |

	attributeCollection := Dictionary new.
	
	instance := self
		identifier: (specRelationType attributeAt: 'IDENTIFIER')
		longName: (specRelationType attributeAt: 'LONG-NAME')
		desc: (specRelationType attributeAt: 'DESC')
		lastChange: (specRelationType attributeAt: 'LAST-CHANGE')
		specAttributes: attributeCollection
		coreContent: aCoreContentObject.
	
	specAttributes := (specRelationType elementAt: 'SPEC-ATTRIBUTES').
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
SpecRelationType class >> identifier: anIdString longName: aNameString desc: aDescString lastChange: aDateString specAttributes: aCollection coreContent: aCoreContentObject [
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
SpecRelationType >> printOn: aStream [
	aStream nextPutAll: (self longName)
]

{ #category : #accessing }
SpecRelationType >> writeOn: aWriter [
	aWriter tag
		name: 'SPEC-RELATION-TYPE';
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

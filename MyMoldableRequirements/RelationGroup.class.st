Class {
	#name : #RelationGroup,
	#superclass : #SpecElementWithAttributes,
	#instVars : [
		'coreContent',
		'specRelations',
		'type',
		'sourceSpecification',
		'TargetSpecification'
	],
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
RelationGroup class >> fromRawData: relationGroup coreContent: aCoreContentObject [
	^ self
		identifier: (relationGroup attributeAt: 'IDENTIFIER')
		longName: (relationGroup attributeAt: 'LONG-NAME')
		desc: (relationGroup attributeAt: 'DESC')
		lastChange: (relationGroup attributeAt: 'LAST-CHANGE')
		coreContent: aCoreContentObject
]

{ #category : #accessing }
RelationGroup class >> identifier: anIdString longName: aNameString desc: aDescString lastChange: aDateString coreContent: aCoreContentObject [
	^ self new
		identifier: anIdString;
		longName: aNameString;
		desc: aDescString;
		lastChange: aDateString;
		coreContent: aCoreContentObject;
		yourself
]

{ #category : #accessing }
RelationGroup >> coreContent [
	^ coreContent
]

{ #category : #accessing }
RelationGroup >> coreContent: anObject [
	coreContent := anObject
]

{ #category : #accessing }
RelationGroup >> printOn: aStream [
	aStream nextPutAll: (self type longName)
]

{ #category : #accessing }
RelationGroup >> sourceSpecification [
	^ sourceSpecification
]

{ #category : #accessing }
RelationGroup >> sourceSpecification: anObject [
	sourceSpecification := anObject
]

{ #category : #accessing }
RelationGroup >> specRelations [
	^ specRelations
]

{ #category : #accessing }
RelationGroup >> specRelations: anObject [
	specRelations := anObject
]

{ #category : #accessing }
RelationGroup >> targetSpecification [
	^ TargetSpecification
]

{ #category : #accessing }
RelationGroup >> targetSpecification: anObject [
	TargetSpecification := anObject
]

{ #category : #accessing }
RelationGroup >> type [
	^ type
]

{ #category : #accessing }
RelationGroup >> type: anObject [
	type := anObject
]

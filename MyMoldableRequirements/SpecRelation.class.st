Class {
	#name : #SpecRelation,
	#superclass : #SpecElementWithAttributes,
	#instVars : [
		'coreContent',
		'source',
		'target',
		'type'
	],
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
SpecRelation class >> fromRawData: specRelation coreContent: aCoreContentObject [
	^ self
		identifier: (specRelation attributeAt: 'IDENTIFIER')
		longName: (specRelation attributeAt: 'LONG-NAME')
		desc: (specRelation attributeAt: 'DESC')
		lastChange: (specRelation attributeAt: 'LAST-CHANGE')
		coreContent: aCoreContentObject
]

{ #category : #accessing }
SpecRelation class >> identifier: anIdString longName: aNameString desc: aDescString lastChange: aDateString coreContent: aCoreContentObject [
	^ self new
		identifier: anIdString;
		longName: aNameString;
		desc: aDescString;
		lastChange: aDateString;
		coreContent: aCoreContentObject;
		yourself
]

{ #category : #accessing }
SpecRelation >> coreContent [
	^ coreContent
]

{ #category : #accessing }
SpecRelation >> coreContent: anObject [
	coreContent := anObject
]

{ #category : #accessing }
SpecRelation >> gtSpecObjectDetailFor: aView [
	<gtView>
	^ aView list
		title: 'Spec Relation Details'
]

{ #category : #accessing }
SpecRelation >> printOn: aStream [
	aStream nextPutAll: (self type longName)
]

{ #category : #accessing }
SpecRelation >> source [
	^ source
]

{ #category : #accessing }
SpecRelation >> source: anObject [
	source := anObject
]

{ #category : #accessing }
SpecRelation >> target [
	^ target
]

{ #category : #accessing }
SpecRelation >> target: anObject [
	target := anObject
]

{ #category : #accessing }
SpecRelation >> type [
	^ type
]

{ #category : #accessing }
SpecRelation >> type: anObject [
	type := anObject
]

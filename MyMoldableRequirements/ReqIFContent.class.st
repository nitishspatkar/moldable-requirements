Class {
	#name : #ReqIFContent,
	#superclass : #Object,
	#instVars : [
		'datatypes',
		'documentRoot',
		'specifications',
		'specObjects',
		'specRelationGroups',
		'specRelations',
		'specTypes',
		'announcer'
	],
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
ReqIFContent >> announcer [
	^ announcer
]

{ #category : #accessing }
ReqIFContent >> announcer: anAnnouncer [
	announcer := anAnnouncer
]

{ #category : #accessing }
ReqIFContent >> datatypes [
	^ datatypes
]

{ #category : #accessing }
ReqIFContent >> datatypes: anObject [
	datatypes := anObject
]

{ #category : #accessing }
ReqIFContent >> documentRoot [
	^ documentRoot
]

{ #category : #accessing }
ReqIFContent >> documentRoot: anObject [
	documentRoot := anObject
]

{ #category : #accessing }
ReqIFContent >> initialize [
	super initialize.
	announcer := Announcer new.
]

{ #category : #accessing }
ReqIFContent >> specObjects [
	^ specObjects
]

{ #category : #accessing }
ReqIFContent >> specObjects: anObject [
	specObjects := anObject
]

{ #category : #accessing }
ReqIFContent >> specRelationGroups [
	^ specRelationGroups
]

{ #category : #accessing }
ReqIFContent >> specRelationGroups: anObject [
	specRelationGroups := anObject
]

{ #category : #accessing }
ReqIFContent >> specRelations [
	^ specRelations
]

{ #category : #accessing }
ReqIFContent >> specRelations: anObject [
	specRelations := anObject
]

{ #category : #accessing }
ReqIFContent >> specTypes [
	^ specTypes
]

{ #category : #accessing }
ReqIFContent >> specTypes: anObject [
	specTypes := anObject
]

{ #category : #accessing }
ReqIFContent >> specifications [
	^ specifications
]

{ #category : #accessing }
ReqIFContent >> specifications: anObject [
	specifications := anObject
]

{ #category : #accessing }
ReqIFContent >> writeOn: aWriter [
	aWriter tag
		name: 'REQ-IF-CONTENT';
		with: [
			aWriter tag: 'DATATYPES' with: [
				datatypes do: [ :datatype |
					datatype writeOn: aWriter
				]
			].
			aWriter tag: 'SPEC-TYPES' with: [
				specTypes do: [ :specType |
					specType writeOn: aWriter
				]
			].
			aWriter tag: 'SPEC-OBJECTS' with: [
				specObjects do: [ :specObject |
					specObject writeOn: aWriter
				]
			].
			aWriter tag: 'SPECIFICATIONS' with: [
				specifications do: [ :specification |
					specification writeOn: aWriter
				]
			].
		]
]

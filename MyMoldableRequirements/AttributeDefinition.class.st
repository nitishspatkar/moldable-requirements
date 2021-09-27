Class {
	#name : #AttributeDefinition,
	#superclass : #AccessControlledElement,
	#instVars : [
		'specType',
		'type'
	],
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
AttributeDefinition >> specType [
	^ specType
]

{ #category : #accessing }
AttributeDefinition >> specType: aSpecType [
	specType := aSpecType
]

{ #category : #accessing }
AttributeDefinition >> type [
	^ type
]

{ #category : #accessing }
AttributeDefinition >> type: aDatatypeDefinition [
	type := aDatatypeDefinition
]

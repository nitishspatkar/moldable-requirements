Class {
	#name : #SpecType,
	#superclass : #Identifiable,
	#instVars : [
		'specAttributes',
		'coreContent'
	],
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
SpecType >> coreContent [
	^ coreContent
]

{ #category : #accessing }
SpecType >> coreContent: aReqIfContent [
	coreContent := aReqIfContent
]

{ #category : #accessing }
SpecType >> specAttributes [
	^ specAttributes
]

{ #category : #accessing }
SpecType >> specAttributes: aSpecAttributeCollection [
	specAttributes := aSpecAttributeCollection
]

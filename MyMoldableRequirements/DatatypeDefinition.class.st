Class {
	#name : #DatatypeDefinition,
	#superclass : #Identifiable,
	#instVars : [
		'coreContent'
	],
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
DatatypeDefinition >> coreContent [
	^ coreContent
]

{ #category : #accessing }
DatatypeDefinition >> coreContent: aReqIfContent [
	coreContent := aReqIfContent
]

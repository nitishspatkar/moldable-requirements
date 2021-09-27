Class {
	#name : #ReqIFToolExtension,
	#superclass : #Object,
	#instVars : [
		'documentRoot',
		'originalXMLContent'
	],
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
ReqIFToolExtension >> documentRoot [
	^ documentRoot
]

{ #category : #accessing }
ReqIFToolExtension >> documentRoot: anObject [
	documentRoot := anObject
]

{ #category : #accessing }
ReqIFToolExtension >> originalXMLContent [
	^ originalXMLContent
]

{ #category : #accessing }
ReqIFToolExtension >> originalXMLContent: anObject [
	originalXMLContent := anObject
]

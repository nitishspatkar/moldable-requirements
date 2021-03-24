Class {
	#name : #MyScenario,
	#superclass : #Object,
	#instVars : [
		'id',
		'description',
		'example'
	],
	#category : #MyMoldableRequirements
}

{ #category : #accessing }
MyScenario class >> fromRawData: scenariosDict [
	^ self
		id: (scenariosDict at: #id)
		description: (scenariosDict at: #description)
]

{ #category : #accessing }
MyScenario class >> id: aString description: anotherString [
	^ self new
		id: aString;
		description: anotherString;
		yourself
]

{ #category : #accessing }
MyScenario >> description [
	^ description
]

{ #category : #accessing }
MyScenario >> description: aString [
	description := aString
]

{ #category : #accessing }
MyScenario >> example [
	^ example
]

{ #category : #accessing }
MyScenario >> example: anExample [
	example := anExample
]

{ #category : #accessing }
MyScenario >> id: aString [
	id := aString
]

{ #category : #accessing }
MyScenario >> initialize [
	exampleMethods := Set new.
	parameterizedExamples := OrderedCollection new
]

{ #category : #accessing }
MyScenario >> printOn: aStream [
	aStream nextPutAll: description
]

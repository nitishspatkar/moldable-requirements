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
		id: (scenariosDict at: #id ifAbsent: nil)
		description: (scenariosDict at: #description)
		example:
			(scenariosDict
				at: #example
				ifPresent: [ :e | ((e at: #class) asClass >> (e at: #selector) asSymbol) gtExample ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
MyScenario class >> id: aString description: anotherString [
	^ self new
		id: aString;
		description: anotherString;
		yourself
]

{ #category : #accessing }
MyScenario class >> id: aString description: anotherString example: anExample [
	^ self new
		id: aString;
		description: anotherString;
		example: anExample;
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
MyScenario >> ensureExampleClass [
	| exampleClass |
	(exampleClass isNotNil or: [ exampleClass isUnefined ])
		ifTrue: [ ^ self ].
	exampleClass := Object
		subclass: 'MyUserStory' , id asString , description hash asString
		instanceVariableNames: ''
		classVariableNames: ''
		package: 'MyMoldableRequirements-UserStories'
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
MyScenario >> gtExammpleFor: aView [
	<gtView>
	^ aView forward
		title: 'Live';
		object: [ self example ];
		view: #gtCoderSourceFor:
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

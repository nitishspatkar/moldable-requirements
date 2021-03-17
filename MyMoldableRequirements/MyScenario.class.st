Class {
	#name : #MyScenario,
	#superclass : #Object,
	#instVars : [
		'id',
		'description'
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
MyScenario >> description: yetAnotherString [
	description := yetAnotherString
]

{ #category : #accessing }
MyScenario >> id: aString [
	id := aString
]

{ #category : #accessing }
MyScenario >> printOn: aStream [
	aStream nextPutAll: description
]

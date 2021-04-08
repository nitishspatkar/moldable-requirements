Class {
	#name : #MyPersona,
	#superclass : #Object,
	#instVars : [
		'name',
		'description'
	],
	#category : #MyMoldableRequirements
}

{ #category : #accessing }
MyPersona class >> fromRawData: personaDict [ 
^ self 
	name: (personaDict at: #name)
	description: (personaDict at: #description)
]

{ #category : #accessing }
MyPersona class >> name: aString description: anotherString [
^self new
	name: aString;
	description: anotherString
	yourself
]

{ #category : #accessing }
MyPersona >> description: aString [
description := aString
]

{ #category : #accessing }
MyPersona >> name: aString [
name := aString 
]

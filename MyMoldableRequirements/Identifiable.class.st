Class {
	#name : #Identifiable,
	#superclass : #Object,
	#instVars : [
		'identifier',
		'longName',
		'desc',
		'lastChange'
	],
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
Identifiable >> desc [
	^ desc
]

{ #category : #accessing }
Identifiable >> desc: aString [
	desc := aString
]

{ #category : #accessing }
Identifiable >> identifier [
	^ identifier
]

{ #category : #accessing }
Identifiable >> identifier: aString [
	identifier := aString
]

{ #category : #accessing }
Identifiable >> initialize [
	super initialize.
	announcer := Announcer new.
]

{ #category : #accessing }
Identifiable >> lastChange [
	^ lastChange
]

{ #category : #accessing }
Identifiable >> lastChange: aString [
	lastChange := aString
]

{ #category : #accessing }
Identifiable >> longName [
	^ longName
]

{ #category : #accessing }
Identifiable >> longName: aString [
	longName := aString
]

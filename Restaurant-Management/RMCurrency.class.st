Class {
	#name : #RMCurrency,
	#superclass : #UObject,
	#instVars : [
		'name'
	],
	#classVars : [
		'Currencies'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #accessing }
RMCurrency class >> EUR [
	^ self currencies at: #EUR ifAbsentPut: [ self new name: #EUR ]
]

{ #category : #accessing }
RMCurrency class >> USD [
	^ self currencies at: #USD ifAbsentPut: [ self new name: #USD ]
]

{ #category : #accessing }
RMCurrency class >> currencies [
	^ Currencies ifNil: [ Currencies := Dictionary new ]
]

{ #category : #accessing }
RMCurrency class >> reset [
	Currencies := nil
]

{ #category : #accessing }
RMCurrency >> name [
	^ name
]

{ #category : #accessing }
RMCurrency >> name: anObject [
	name := anObject
]

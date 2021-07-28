Class {
	#name : #RMMenuEntry,
	#superclass : #UObject,
	#instVars : [
		'menuCategory',
		'characteristics'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #accessing }
RMMenuEntry >> allCharacteristics [
	^ self menuCategory 
		ifNil: [ self characteristics ]
		ifNotNil: [ self menuCategory allCharacteristics, self characteristics ]
]

{ #category : #accessing }
RMMenuEntry >> characteristics [
	^ characteristics
]

{ #category : #accessing }
RMMenuEntry >> characteristics: anObject [
	characteristics := anObject
]

{ #category : #testing }
RMMenuEntry >> hasCharacteristic: aCharacteristic [
	^ self allCharacteristics includes: aCharacteristic 
]

{ #category : #initialization }
RMMenuEntry >> initialize [
	super initialize.
	characteristics := OrderedCollection new
]

{ #category : #testing }
RMMenuEntry >> is: aCharacteristic [
	^ self hasCharacteristic: aCharacteristic 
]

{ #category : #accessing }
RMMenuEntry >> menuCategory [
	^ menuCategory
]

{ #category : #accessing }
RMMenuEntry >> menuCategory: anObject [
	menuCategory := anObject
]

Class {
	#name : #RMSellable,
	#superclass : #UObject,
	#instVars : [
		'price',
		'name',
		'applicableTax',
		'characteristics'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #accessing }
RMSellable >> applicableTax [
	^ applicableTax
]

{ #category : #accessing }
RMSellable >> applicableTax: anObject [
	applicableTax := anObject
]

{ #category : #accessing }
RMSellable >> characteristics [
	^ characteristics
]

{ #category : #accessing }
RMSellable >> characteristics: anObject [
	characteristics := anObject
]

{ #category : #printing }
RMSellable >> gtDisplayOn: stream [
	stream nextPutAll: self name
]

{ #category : #testing }
RMSellable >> hasCharacteristic: aCharacteristic [
	^ self characteristics includes: aCharacteristic 
]

{ #category : #accessing }
RMSellable >> individualPrice [
	^ self price
]

{ #category : #initialization }
RMSellable >> initialize [
	super initialize.
	characteristics := OrderedCollection new
]

{ #category : #testing }
RMSellable >> is: aCharacteristic [
	^ self hasCharacteristic: aCharacteristic 
]

{ #category : #accessing }
RMSellable >> name [
	^ name
]

{ #category : #accessing }
RMSellable >> name: anObject [
	name := anObject
]

{ #category : #accessing }
RMSellable >> price [
	^ price
]

{ #category : #accessing }
RMSellable >> price: anObject [
	price := anObject
]

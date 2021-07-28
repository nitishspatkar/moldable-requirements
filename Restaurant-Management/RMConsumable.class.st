Class {
	#name : #RMConsumable,
	#superclass : #RMSellable,
	#category : #'Restaurant-Management-Model'
}

{ #category : #testing }
RMConsumable >> isGood [
	^ self isProduct not
]

{ #category : #testing }
RMConsumable >> isProduct [
	^ self price notNil
]

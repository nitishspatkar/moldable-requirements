Class {
	#name : #RMZeroMoney,
	#superclass : #RMMoney,
	#category : #'Restaurant-Management-Model'
}

{ #category : #testing }
RMZeroMoney >> < aMoney [
	^ aMoney isZero not and: [ aMoney > self ]
]

{ #category : #testing }
RMZeroMoney >> = aMoney [
	^ (aMoney isKindOf: RMMoney) and: [ aMoney isZero ]
]

{ #category : #testing }
RMZeroMoney >> > aMoney [
	^ aMoney isZero not and: [ aMoney < self ]
]

{ #category : #operations }
RMZeroMoney >> add: aMoney [
	^ aMoney
]

{ #category : #operations }
RMZeroMoney >> addCurrencyMoney: aCurrencyMoney [
	^ aCurrencyMoney
]

{ #category : #operations }
RMZeroMoney >> addMoneyBag: aMoneyBag [
	^ aMoneyBag
]

{ #category : #operations }
RMZeroMoney >> divideBy: aNumber [
	^ self
]

{ #category : #printing }
RMZeroMoney >> gtDisplayOn: stream [
	stream  nextPutAll: '0'
]

{ #category : #testing }
RMZeroMoney >> isZero [
	^ true
]

{ #category : #operations }
RMZeroMoney >> multiplyBy: aNumber [
	^ self
]

{ #category : #operations }
RMZeroMoney >> negative [
	^ self
]

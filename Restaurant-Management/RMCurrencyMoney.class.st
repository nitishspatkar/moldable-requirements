Class {
	#name : #RMCurrencyMoney,
	#superclass : #RMMoney,
	#instVars : [
		'amount',
		'currency'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #testing }
RMCurrencyMoney >> < aMoney [
	^ (aMoney isZero and: [self amount < 0]) or: [ 
		self currency = aMoney currency and: [ self amount < aMoney amount ] ]
]

{ #category : #testing }
RMCurrencyMoney >> = aMoney [
	^ (self isZero and: [ aMoney isZero ]) or: [
		(aMoney class = RMCurrencyMoney) and: [ 
			 aMoney amount = self amount and: [ 
				aMoney currency = self currency ] ] ]
]

{ #category : #testing }
RMCurrencyMoney >> > aMoney [
	^ (aMoney isZero and: [self amount > 0]) or: [ 
		self currency = aMoney currency and: [ self amount > aMoney amount ] ]
]

{ #category : #operations }
RMCurrencyMoney >> add: aMoney [
	"We know that I am a ${class:UCurrencyBag}$, so I dispatch through that method"
	^ aMoney addCurrencyMoney: self
]

{ #category : #operations }
RMCurrencyMoney >> addCurrencyMoney: aMoney [
	^ self currency = aMoney currency
		ifTrue: [ self class new 	
				amount: self amount + aMoney amount; 
				currency: self currency ]
		ifFalse: [ RMMoneyBag new addCurrencyMoney: self; addCurrencyMoney: aMoney ]
]

{ #category : #operations }
RMCurrencyMoney >> addMoneyBag: aMoneyBag [
	^ aMoneyBag addCurrencyMoney: self
]

{ #category : #accessing }
RMCurrencyMoney >> amount [
	^ amount
]

{ #category : #accessing }
RMCurrencyMoney >> amount: anObject [
	amount := anObject
]

{ #category : #accessing }
RMCurrencyMoney >> currency [
	^ currency
]

{ #category : #accessing }
RMCurrencyMoney >> currency: anObject [
	currency := anObject
]

{ #category : #operations }
RMCurrencyMoney >> divideBy: aNumber [
	^ self class new 
		amount: self amount / aNumber;
		currency: self currency
]

{ #category : #operations }
RMCurrencyMoney >> dividingMoney: aMoney [
	<return: #Number>
	aMoney isZero ifTrue: [ ^ 0 ].
	self assert: [ aMoney currency = self currency ].
	^ aMoney amount / self amount
]

{ #category : #ui }
RMCurrencyMoney >> gtDisplayOn: stream [
	stream 
		nextPutAll: (self amount printShowingDecimalPlaces: 2);
		space;
		nextPutAll: self currency name
]

{ #category : #testing }
RMCurrencyMoney >> isZero [
	^ self amount isZero
]

{ #category : #operations }
RMCurrencyMoney >> multiplyBy: aNumber [
	^ self class new 
		amount: self amount * aNumber;
		currency: self currency
]

{ #category : #operations }
RMCurrencyMoney >> negative [
	^ self class new 
		amount: 0 - self amount;
		currency: self currency
]

Class {
	#name : #RMMoneyBag,
	#superclass : #RMMoney,
	#instVars : [
		'monies'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #testing }
RMMoneyBag >> = aMoneyBag [
	^ aMoneyBag class = self class and: [ 
		self monies size = aMoneyBag monies size and: [
			self monies allSatisfy: [ :myMoney | 
				aMoneyBag monies anySatisfy: [ :otherMoney | myMoney = otherMoney ]]]]
]

{ #category : #operations }
RMMoneyBag >> add: aMoney [
	"We know that I am a ${class:UMoneyBag}$, so I dispatch through that method"
	^ aMoney addMoneyBag: self
]

{ #category : #operations }
RMMoneyBag >> addCurrencyMoney: aMoney [
	| newMonies |
	self monies 
		detect: [ :each | each currency = aMoney currency ]
		ifFound: [ :sameCurrencyMoney | 
			sameCurrencyMoney amount: sameCurrencyMoney amount + aMoney amount ]
		ifNone: [ self monies add: aMoney copy ].
	newMonies := self monies reject: [ :each | each isZero ].
	^ newMonies size = 1 
		ifTrue: [ newMonies anyOne ]
		ifFalse: [ self monies: newMonies ]
]

{ #category : #adding }
RMMoneyBag >> addMoneyBag: aMoneyBag [
	self monies do: [ :money |
		aMoneyBag addCurrencyMoney: money ].
	^ aMoneyBag
		
	
]

{ #category : #operations }
RMMoneyBag >> divideBy: aNumber [
	^ self class new 
		monies: (self monies collect: [:money | money divideBy: aNumber ])
]

{ #category : #printing }
RMMoneyBag >> gtDisplayOn: stream [
	self monies 
		do: [ :money | money gtDisplayOn: stream ]
		separatedBy: [ stream nextPutAll: ' + ' ] 
]

{ #category : #initialization }
RMMoneyBag >> initialize [
	super initialize.
	monies := OrderedCollection new
]

{ #category : #testing }
RMMoneyBag >> isZero [
	^ self monies allSatisfy: [ :money | money isZero ]
]

{ #category : #accessing }
RMMoneyBag >> monies [
	^ monies
]

{ #category : #accessing }
RMMoneyBag >> monies: anObject [
	monies := anObject
]

{ #category : #operations }
RMMoneyBag >> multiplyBy: aNumber [
	^ self class new 
		monies: (self monies collect: [:money | money multiplyBy: aNumber ])
]

{ #category : #operations }
RMMoneyBag >> negative [
	^ self class new 
		monies: (self monies collect: [:money | money negative])
]

Extension { #name : #Number }

{ #category : #'*Restaurant-Management' }
Number >> EUR [
	^ RMCurrencyMoney new amount: self; currency: RMCurrency EUR
]

{ #category : #'*Restaurant-Management' }
Number >> USD [
	^ RMCurrencyMoney new amount: self; currency: RMCurrency USD
]

{ #category : #'*Restaurant-Management' }
Number >> asTax [
	self assert: [ self <= 1 ].
	^ RMPercentualTax new percentage: self
]

Class {
	#name : #RMInvoicePrice,
	#superclass : #RMDerivedPrice,
	#category : #'Restaurant-Management-Model'
}

{ #category : #accessing }
RMInvoicePrice >> money [
	^ (self reference invoiceItems isEmpty
		ifTrue: [ RMZeroMoney new ]
		ifFalse: [ (self reference invoiceItems uhmoSum: [ :each | each price ]) money ])
]

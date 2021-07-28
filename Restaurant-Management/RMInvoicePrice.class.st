Class {
	#name : #RMInvoicePrice,
	#superclass : #RMDerivedPrice,
	#category : #'Restaurant-Management-Model'
}

{ #category : #accessing }
RMInvoicePrice >> money [
	^ (self reference invoiceItems isEmpty
		ifTrue: [ RMZeroMoney new ]
		ifFalse: [ (self reference invoiceItems rmSum: [ :each | each price ]) money ])
]

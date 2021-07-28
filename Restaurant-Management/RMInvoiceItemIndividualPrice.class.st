Class {
	#name : #RMInvoiceItemIndividualPrice,
	#superclass : #RMDerivedPrice,
	#category : #'Restaurant-Management-Model'
}

{ #category : #accessing }
RMInvoiceItemIndividualPrice >> money [
	^ self reference orderItem individualPrice money
]

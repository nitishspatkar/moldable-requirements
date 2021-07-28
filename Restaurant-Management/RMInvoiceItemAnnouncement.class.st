Class {
	#name : #RMInvoiceItemAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'invoiceItem'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #accessing }
RMInvoiceItemAnnouncement >> invoiceItem [
	^ invoiceItem
]

{ #category : #accessing }
RMInvoiceItemAnnouncement >> invoiceItem: anObject [
	invoiceItem := anObject
]

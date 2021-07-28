Class {
	#name : #RMInvoiceItemTotalPrice,
	#superclass : #RMDerivedPrice,
	#category : #'Restaurant-Management-Model'
}

{ #category : #ui }
RMInvoiceItemTotalPrice >> gtElementForConnector [
	^ (self price gtOverviewFor: GtPhlowEmptyView new) 
		asElementDo: [ :e | e ]
]

{ #category : #accessing }
RMInvoiceItemTotalPrice >> gtViewStructureFor: aView [
	<gtView>
	^ aView forward 
		title: 'Structure';
		priority: 105;
		object: [ self price ];
		view: #gtOverviewFor:
]

{ #category : #accessing }
RMInvoiceItemTotalPrice >> money [
	^ self reference individualPrice money * self reference quantity
]

{ #category : #accessing }
RMInvoiceItemTotalPrice >> price [
	^ self reference individualPrice * self reference quantity
]

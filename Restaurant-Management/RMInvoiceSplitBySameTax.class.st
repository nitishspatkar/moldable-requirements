Class {
	#name : #RMInvoiceSplitBySameTax,
	#superclass : #RMObject,
	#instVars : [
		'invoiceItems'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #ui }
RMInvoiceSplitBySameTax >> gtInvoiceItemsFor: aView [
	<gtView>
	^ aView explicit
		title: 'Items';
		stencil: [ | list |
			list := BrColumnedList new items: self invoiceItems.
			list constraintsDo: [ :c | c padding: (BlInsets top: 10) ].
			"list addEventHandler: GtInspectorListToSelectHandler new."
			list column
				title: 'Item';
				stencil: [ :invoiceItem | 
					BrLabel new
						text: invoiceItem name;
						look: BrGlamorousLabelLook;
						hExact: 200;
						padding: (BlInsets all: 10) ].
			list column
				title: 'Quantity';
				stencil: [ :invoiceItem | 
					BrLabel new
						text: invoiceItem quantity gtDisplayString , 'x';
						look: BrGlamorousLabelLook;
						hExact: 50;
						padding: (BlInsets all: 10) ].
			list column
				title: 'Price';
				stencil: [ :invoiceItem | 
					BrLabel new
						text: invoiceItem orderItem menuItem price gtDisplayString;
						look: BrGlamorousLabelLook;
						matchParent;
						padding: (BlInsets all: 10) ].
			list column
				title: 'Price';
				stencil: [ :invoiceItem | 
					BrLabel new
						text: invoiceItem price gtDisplayString;
						look: BrGlamorousLabelLook;
						matchParent;
						padding: (BlInsets all: 10) ].
			list column
				title: 'Tax';
				stencil: [ :invoiceItem | 
					BrLabel new
						text: invoiceItem applicableTax gtDisplayString;
						look: BrGlamorousLabelLook;
						matchParent;
						padding: (BlInsets all: 10) ].
			list ]
]

{ #category : #accessing }
RMInvoiceSplitBySameTax >> invoiceItems [
	^ invoiceItems
]

{ #category : #accessing }
RMInvoiceSplitBySameTax >> invoiceItems: anObject [
	invoiceItems := anObject
]

{ #category : #accessing }
RMInvoiceSplitBySameTax >> taxComputation [
	^ self invoiceItems anyOne applicableTax
]

{ #category : #accessing }
RMInvoiceSplitBySameTax >> taxMoney [
	^ self invoiceItems rmSum: [ :each | each taxMoney ]
]

Class {
	#name : #RMInvoiceItem,
	#superclass : #RMTimestampedObject,
	#instVars : [
		'orderItem',
		'quantity',
		'individualPrice',
		'totalPrice'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #accessing }
RMInvoiceItem >> applicableTax [
	^ self orderItem applicableTax
]

{ #category : #ui }
RMInvoiceItem >> createCardContentElement [
	| wrapper nameLabel viewElement |
	nameLabel := BrLabel new.
	nameLabel look: (BrGlamorousLabelLook new fontSize: 15).
	nameLabel text: self name.
	nameLabel margin: (BlInsets top: 10 bottom: 5).
	nameLabel constraintsDo: [ :c | 
		c linear horizontal alignCenter ].
	
	viewElement := (self gtViewDetailsFor: GtPhlowEmptyView new) 
		asElementDo: [ :e | e ]. 
	
	viewElement padding: (BlInsets bottom: 10).
	
	wrapper := BlElement new.
	wrapper layout: BlLinearLayout vertical.
	wrapper constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent.
		c frame horizontal alignCenter.
		c frame vertical alignCenter ].
	wrapper addChildren: { 
		nameLabel . 
		viewElement 
	}.
			
	^ wrapper

			
]

{ #category : #ui }
RMInvoiceItem >> gtElementForConnector [
	^ self createCardContentElement
]

{ #category : #ui }
RMInvoiceItem >> gtViewDetailsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Details';
		items: [ { 
			{ 'Quantity' . self quantity  }.
			{ 'Item price' . self individualPrice  }.
			{ 'Total price' . self price  }.
			{ 'Tax percent' . self applicableTax  }.
			{ 'Total tax' . self taxMoney  } .
			{ 'Time ' . (String streamContents: [ :stream |
				BasicDatePrinter default printYMD: self timestamp withLeadingSpace: false on: stream.]) }
			}  ];
		column: 'Name' text: #first;
		column: 'Value' do: [ :aColumn |
			aColumn
				stencil: [ :pair |
					BrLabel new
						in: [ :label |
							label connector 
								model: pair second;
								beVisualSource ];
						look: BrGlamorousListLabelLook;
						alignCenterLeft;
						hMatchParent;
						vFitContent;
						text: pair second gtDisplayString ] ];
		send: #second
]

{ #category : #accessing }
RMInvoiceItem >> individualPrice [
	^ individualPrice
]

{ #category : #accessing }
RMInvoiceItem >> individualPrice: aPrice [
	individualPrice := aPrice
]

{ #category : #initialization }
RMInvoiceItem >> initialize [
	super initialize.
	individualPrice := RMInvoiceItemIndividualPrice new reference: self.
	totalPrice := RMInvoiceItemTotalPrice new reference: self.
	quantity := 1
]

{ #category : #accessing }
RMInvoiceItem >> name [
	^ self orderItem name
]

{ #category : #accessing }
RMInvoiceItem >> orderItem [
	^ orderItem
]

{ #category : #accessing }
RMInvoiceItem >> orderItem: anObject [
	orderItem := anObject
]

{ #category : #accessing }
RMInvoiceItem >> price [
	^ totalPrice 
]

{ #category : #accessing }
RMInvoiceItem >> price: anObject [
	totalPrice := anObject
]

{ #category : #accessing }
RMInvoiceItem >> printOn: stream [
	stream
		nextPutAll: self name;
		nextPutAll: ' (x';
		nextPutAll: self quantity asString;
		nextPutAll: ')'
]

{ #category : #accessing }
RMInvoiceItem >> quantity [
	^ quantity
]

{ #category : #accessing }
RMInvoiceItem >> quantity: anObject [
	quantity := anObject
]

{ #category : #accessing }
RMInvoiceItem >> taxMoney [
	^ self applicableTax taxMoneyFor: self price money
]

{ #category : #accessing }
RMInvoiceItem >> totalPrice [
	^ self price "* quantity"
]

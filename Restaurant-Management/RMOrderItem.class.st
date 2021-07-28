Class {
	#name : #RMOrderItem,
	#superclass : #RMTimestampedObject,
	#instVars : [
		'menuItem',
		'quantity',
		'price',
		'state',
		'applicableTax',
		'individualPrice'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #accessing }
RMOrderItem >> applicableTax [
	^ applicableTax ifNil: [ self menuItem applicableTax ]
]

{ #category : #accessing }
RMOrderItem >> applicableTax: anObject [
	applicableTax := anObject
]

{ #category : #ui }
RMOrderItem >> gtOrderItemFor: aView [
	<gtView>
	
	^ aView explicit
		title: 'Order item';
		priority: 1;
		stencil: [
			| aContainer aSeparator aQuantity aName aSpace aPrice |
			
			aContainer := BlElement new.
			aContainer layout: (BlLinearLayout horizontal alignCenterLeft cellSpacing: 10).
			aContainer border: (BlBorder paint: (Color gray alpha: 0.4) width: 1).
			aContainer padding: (BlInsets all: 2).
			aContainer constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical fitContent ].

			aQuantity := BrLabel new
				look: BrGlamorousLabelLook new;
				padding: (BlInsets top: 8 bottom: 8);
				text: self quantity asString.
			
			aSeparator := BlElement new
				background:Color veryLightGray;
				margin: (BlInsets top: 3 bottom: 3);
				constraintsDo: [ :c |
					c horizontal exact: 1.
					c vertical matchParent ].
				
			aName := BrLabel new
				look: BrGlamorousLabelLook new;
				text: self name asString.

			aSpace := BlElement new
				constraintsDo: [ :c |
					c horizontal matchParent.
					c vertical matchParent ].

			aPrice := BrLabel new
				look: BrGlamorousLabelLook new;
				text: self price gtDisplayString.

			aContainer addChildren: { aQuantity . aSeparator . aName . aSpace . aPrice }.
			aContainer
		]
]

{ #category : #accessing }
RMOrderItem >> gtStatesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'States';
		items: [(self state withDeepCollect: #previousState)];
		column: 'State' do: [:aColumn | aColumn ];
		column: 'Timestamp' do: [:aColumn | aColumn item: [:aState | aState timestamp asLocalStringYMDHM ]]
]

{ #category : #accessing }
RMOrderItem >> individualPrice [
	^ individualPrice
]

{ #category : #accessing }
RMOrderItem >> individualPrice: anObject [
	individualPrice := anObject
]

{ #category : #initialization }
RMOrderItem >> initialize [
	super initialize.
	individualPrice := RMOrderItemIndividualPrice new reference: self.
	price := RMOrderItemTotalPrice new reference: self.
	quantity := 1.
	self state: (RMOrderItemCreatedState new orderItem: self)
]

{ #category : #'state manipulation' }
RMOrderItem >> markAsDelivered [
	self state: (RMOrderItemDeliveredState new orderItem: self)
]

{ #category : #'state manipulation' }
RMOrderItem >> markAsInvoiced [
	self state: (RMOrderItemInvoicedState new orderItem: self)
]

{ #category : #'state manipulation' }
RMOrderItem >> markAsToDeliver [
	self state: (RMOrderItemToDeliverState new orderItem: self; previousState: self state)
]

{ #category : #'state manipulation' }
RMOrderItem >> markAsToInvoice [
	self state: (RMOrderItemToInvoiceState new orderItem: self)
]

{ #category : #'state manipulation' }
RMOrderItem >> markAsToProduce [
	self state: (RMOrderItemToProduceState new orderItem: self)
]

{ #category : #accessing }
RMOrderItem >> menuItem [
	^ menuItem
]

{ #category : #accessing }
RMOrderItem >> menuItem: anObject [
	menuItem := anObject
]

{ #category : #accessing }
RMOrderItem >> name [
	^ self menuItem name
]

{ #category : #accessing }
RMOrderItem >> newState: aState [
	aState orderItem: self.
	aState previousState: self state.
	self state: aState
]

{ #category : #accessing }
RMOrderItem >> price [
	^ price
]

{ #category : #accessing }
RMOrderItem >> price: anObject [
	price := anObject
]

{ #category : #printing }
RMOrderItem >> printOn: stream [
	stream
		nextPutAll: self name;
		nextPutAll: ' (x';
		nextPutAll: self quantity asString;
		nextPutAll: ')'
]

{ #category : #accessing }
RMOrderItem >> quantity [
	^ quantity
]

{ #category : #accessing }
RMOrderItem >> quantity: anObject [
	quantity := anObject
]

{ #category : #accessing }
RMOrderItem >> state [
	^ state
]

{ #category : #accessing }
RMOrderItem >> state: anObject [
	state := anObject
]

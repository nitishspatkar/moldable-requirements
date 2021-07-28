Class {
	#name : #RMOrder,
	#superclass : #RMTimestampedObject,
	#instVars : [
		'orderItems',
		'invoices',
		'price',
		'announcer'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #accessing }
RMOrder >> addOrderItem: anOrderItem [
	self orderItems add: anOrderItem.
	self announcer announce: (RMOrderItemAdded new orderItem: anOrderItem)
]

{ #category : #accessing }
RMOrder >> announcer [
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #accessing }
RMOrder >> derivedPrice [
	^ self orderItems isEmpty
		ifTrue: [ RMZeroMoney new asPrice ]
		ifFalse: [ self orderItems rmSum: [ :each | each price ] ]
]

{ #category : #ui }
RMOrder >> gtOrderFor: aView [
	<gtView>
	
	^ aView explicit
		priority: 11;
		title: 'Order';
		stencil: [
			| aName aList aContainer |
			
			aList := BrSimpleList new.
			aList margin: (BlInsets top: 5 bottom: 5).
			aList constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical matchParent ].
			aList display: self orderItems.
			
			self announcer when: RMOrderItemAdded do: [ :anAnnouncement | aList display: self orderItems ].
			self announcer when: RMOrderItemRemoved do: [ :anAnnouncement | aList display: self orderItems ].
			
			aList stencil: [ :eachOrderItem |
				| anItem aRemoveButton anItemContainer |
				
				anItem := (eachOrderItem gtOrderItemFor: GtPhlowEmptyView new) asElementDo: #yourself.
				aRemoveButton := BrButton new
					look: BrGlamorousButtonWithIconLook new;
					margin: (BlInsets left: 10 right: 0);
					icon: (BrGlamorousIcons close asElement);
					label: 'Delete';
					action: [ self removeOrderItem: eachOrderItem ].
				
				anItemContainer := BlElement new
					layout: (BlLinearLayout horizontal alignCenter);
					margin: (BlInsets top: 5 bottom: 5);
					constraintsDo: [ :c |
						c horizontal matchParent.
						c vertical fitContent ].
					
				anItemContainer addChildren: { anItem . aRemoveButton }.
				anItemContainer ].
			
			aContainer := BlElement new.
			aContainer layout: BlLinearLayout vertical.
			aContainer margin: (BlInsets all: 10).
			aContainer constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical matchParent ].
			
			aName := BrLabel new.
			aName look: (BrGlamorousLabelLook new fontSize: 24; foreground: (BrGlamorousColors defaultHeaderTextColor alpha: 0.7)).
			aName text: 'Selection'.
			
			aContainer addChildren: { aName . aList }.
			aContainer
		]
]

{ #category : #accessing }
RMOrder >> gtOrderItemsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Items';
		priority: 10;
		items: [ self orderItems ];
		column: 'Item'
			do: [ :aColumn | 
			aColumn
				item: [ :item | item ];
				weight: 1 ]
]

{ #category : #initialization }
RMOrder >> initialize [
	super initialize.
	orderItems := OrderedCollection new.
	invoices := OrderedCollection new.
	price := RMOrderPrice new reference: self
]

{ #category : #accessing }
RMOrder >> invoices [
	^ invoices
]

{ #category : #accessing }
RMOrder >> invoices: anObject [
	invoices := anObject
]

{ #category : #accessing }
RMOrder >> orderItems [
	^ orderItems
]

{ #category : #accessing }
RMOrder >> orderItems: anObject [
	orderItems := anObject
]

{ #category : #accessing }
RMOrder >> price [
	^ price
]

{ #category : #accessing }
RMOrder >> printOn: aStream [
	self orderItems 
		do: [:anItem | anItem printOn: aStream ]
		separatedBy: [ aStream nextPutAll: ', ' ]
]

{ #category : #accessing }
RMOrder >> removeOrderItem: anOrderItem [
	self orderItems remove: anOrderItem.
	self announcer announce: (RMOrderItemRemoved new orderItem: anOrderItem)
]

Class {
	#name : #RMMenuItem,
	#superclass : #RMMenuEntry,
	#instVars : [
		'consumable',
		'price',
		'applicableTax'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #accessing }
RMMenuItem >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ consumable name = anObject name
]

{ #category : #accessing }
RMMenuItem >> applicableTax [
	^ applicableTax ifNil: [ self consumable applicableTax ]
]

{ #category : #accessing }
RMMenuItem >> applicableTax: anObject [
	applicableTax := anObject
]

{ #category : #accessing }
RMMenuItem >> consumable [
	<return: #RMConsumable>
	^ consumable
]

{ #category : #accessing }
RMMenuItem >> consumable: anObject [
	consumable := anObject
]

{ #category : #priting }
RMMenuItem >> gtDisplayOn: stream [
	stream nextPutAll: self consumable name
]

{ #category : #ui }
RMMenuItem >> gtMenuEntryFor: aView [
	<gtView>
	
	^ aView explicit
		title: 'Item';
		stencil: [
			| aContainer aWrapper aName aPrice |
			aName := BrLabel new.
			aName look: (BrGlamorousLabelLook new fontSize: 15).
			aName text: self name.
			aName constraintsDo: [ :c | c linear horizontal alignCenter ].
			
			aPrice := BrLabel new.
			aPrice look: (BrGlamorousLabelLook new fontSize: 13).
			aPrice text: self price gtDisplayString.
			aPrice constraintsDo: [ :c | c linear horizontal alignCenter ].
		
			aWrapper := BlElement new.
			aWrapper layout: (BlLinearLayout vertical cellSpacing: 10).
			aWrapper constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical fitContent.
				c frame horizontal alignCenter.
				c frame vertical alignCenter ].
			aWrapper addChildren: { aName . aPrice }.

			aContainer := BlElement new.
			aContainer layout: (BlFrameLayout new).
			aContainer size: 200@75.
			aContainer margin: (BlInsets all: 10).
			aContainer look: BrShadowLook.
			aContainer background: Color white.
			aContainer addChild: aWrapper.
			aContainer when: BlClickEvent do: [ :anEvent |
				anEvent currentTarget fireEvent: (GtPhlowObjectToSelect new
					object: self;
					sourceElement: anEvent currentTarget ) ].
			aContainer
		]
]

{ #category : #accessing }
RMMenuItem >> individualPrice [
	^ self price
]

{ #category : #initialize }
RMMenuItem >> initialize [
	super initialize.
	self class initializeSlots: self.
	price := RMMenuItemPrice new reference: self.
]

{ #category : #accessing }
RMMenuItem >> name [
	^ self consumable name
]

{ #category : #accessing }
RMMenuItem >> price [
	^ price
]

{ #category : #accessing }
RMMenuItem >> price: anObject [
	price := anObject
]

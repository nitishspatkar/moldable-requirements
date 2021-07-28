Class {
	#name : #RMMenuCategory,
	#superclass : #RMMenuEntry,
	#instVars : [
		'menuEntries',
		'name'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #accessing }
RMMenuCategory >> addMenuEntry: aMenuEntry [
	self menuEntries add: aMenuEntry.
	aMenuEntry menuCategory: self.
]

{ #category : #accessing }
RMMenuCategory >> gtDisplayOn: stream [
	stream nextPutAll: self name
]

{ #category : #ui }
RMMenuCategory >> gtEntriesFor: aView [
	<gtView>
	^ aView explicit
		title: 'Entries';
		stencil: [ | list |
			list := BrColumnedList new items: self menuEntries.
			list addEventHandler: GtInspectorListToSelectHandler new.
			list constraintsDo: [ :c | c padding: (BlInsets top: 10) ].
			list column
				title: 'Entry';
				stencil: [ :entry | 
					BrLabel new
						text: entry gtDisplayString;
						look: BrGlamorousLabelLook;
						matchParent;
						margin:
							(BlInsets
								top: 3
								left: 10
								bottom: 3
								right: 0);
						padding: (BlInsets left: 10) ].
			list column
				title: 'Price';
				stencil: [ :entry | 
					BrLabel new
						text:
							((entry isKindOf: RMMenuItem)
								ifTrue: [ entry price gtDisplayString ]
								ifFalse: [ '' ]) asRopedText;
						look: BrGlamorousLabelLook;
						matchParent;
						margin:
							(BlInsets
								top: 3
								left: 10
								bottom: 3
								right: 0);
						padding: (BlInsets left: 10) ].
			list ]
]

{ #category : #ui }
RMMenuCategory >> gtMenuEntryFor: aView [
	<gtView>
	
	^ aView explicit
		title: 'Category';
		stencil: [
			| aContainer aName theEntries |
				
			aContainer := BlElement new.
			aContainer layout: BlLinearLayout vertical.
			aContainer margin: (BlInsets all: 10).
			aContainer constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical fitContent ].
			
			aName := BrLabel new.
			aName look: (BrGlamorousLabelLook new fontSize: 24; foreground: (BrGlamorousColors defaultHeaderTextColor alpha: 0.7)).
			aName text: self name.
			aName margin: (BlInsets left: 10).
			
			theEntries := BlElement new.
			theEntries layout: BlFlowLayout new.
			theEntries constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical fitContent ].
			
			theEntries addChildren: (self menuEntries collect: [ :eachMenuItem |
				(eachMenuItem gtMenuEntryFor: GtPhlowEmptyView new) asElementDo: #yourself
			]).
			
			aContainer addChild: aName.
			aContainer addChild: theEntries.
			aContainer
		]
]

{ #category : #initialization }
RMMenuCategory >> initialize [
	super initialize.
	menuEntries := OrderedCollection new.
	self class initializeSlots: self.
]

{ #category : #accessing }
RMMenuCategory >> menuEntries [
	^ menuEntries
]

{ #category : #accessing }
RMMenuCategory >> menuEntries: anObject [
	menuEntries := anObject
]

{ #category : #accessing }
RMMenuCategory >> name [
	^ name
]

{ #category : #accessing }
RMMenuCategory >> name: anObject [
	name := anObject
]

Class {
	#name : #RMMenu,
	#superclass : #RMMenuCategory,
	#instVars : [
		'venue'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #ui }
RMMenu >> gtMenuEntryFor: aView [
	<gtView>
	^ aView explicit
		title: 'Menu';
		stencil: [ | aList |
			aList := BrSimpleList new.
			aList items: self menuEntries.
			aList
				stencil: [ :eachEntry | 
					(eachEntry gtMenuEntryFor: GtPhlowEmptyView new)
						asElementDo: #yourself ] ]
]

{ #category : #accessing }
RMMenu >> venue [
	^ venue
]

{ #category : #accessing }
RMMenu >> venue: anObject [
	venue := anObject
]

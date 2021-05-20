Class {
	#name : #HMDay,
	#superclass : #Object,
	#instVars : [
		'poolOfAvailableStaff',
		'isWeekendDay',
		'shifts',
		'recordOfWishes'
	],
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMDay >> gtShiftsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Shifts';
		priority: 1;
		items: [ shifts ];
		"actionUpdateButtonTooltip: 'Update item list';"
			column: 'Index'
			item:
				[ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Item' text: [ :eachItem | eachItem gtDisplayText ]
]

{ #category : #accessing }
HMDay >> gtWishesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Wishes of the day';
		priority: 1;
		items: [ recordOfWishes ];
		"actionUpdateButtonTooltip: 'Update item list';"
			column: 'Index'
			item:
				[ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Item' text: [ :eachItem | eachItem gtDisplayText ]
]

{ #category : #accessing }
HMDay >> initialize [
	super initialize.
	shifts := (1 to: 5) collect: [ :each | HMShift new ].
	recordOfWishes := Dictionary new
]

{ #category : #accessing }
HMDay >> isWeekendDay [
	^ true
]

{ #category : #accessing }
HMDay >> poolOfAvailableStaff: aCollection [
	poolOfAvailableStaff := OrderedCollection new
]

{ #category : #accessing }
HMDay >> recordOfWishes [
	^ recordOfWishes
]

{ #category : #accessing }
HMDay >> recordOfWishes: aDictionary [
	recordOfWishes := aDictionary.
	^ recordOfWishes
]

{ #category : #accessing }
HMDay >> shifts [
	^ shifts
]

{ #category : #accessing }
HMDay >> shifts: aCollection [
	shifts := aCollection
]

Class {
	#name : #HMWorkingDay,
	#superclass : #Object,
	#instVars : [
		'poolOfAvailableStaff',
		'isWeekendDay',
		'shifts',
		'recordOfWishes',
		'date',
		'givenName'
	],
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMWorkingDay >> date [
	^ date
]

{ #category : #accessing }
HMWorkingDay >> date: aNumberAndMonth [
	date := aNumberAndMonth
]

{ #category : #accessing }
HMWorkingDay >> givenName: aName [
	givenName := aName
]

{ #category : #accessing }
HMWorkingDay >> gtShiftsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Shifts';
		priority: 1;
		items: [ shifts ];
		"actionUpdateButtonTooltip: 'Update item list';"
		column: 'Code' text: [ :aShift | aShift shiftCode ] width: 100;
		column: 'Start Time' text: [ :aShift | aShift startTime ];
		column: 'End Time' text: [ :aShift | aShift endTime ]
]

{ #category : #accessing }
HMWorkingDay >> gtWishesFor: aView [
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

{ #category : #initialize }
HMWorkingDay >> initialize [
	super initialize.
	shifts := OrderedCollection new.
	recordOfWishes := OrderedCollection new.
	poolOfAvailableStaff := OrderedCollection new
]

{ #category : #accessing }
HMWorkingDay >> poolOfAvailableStaff: aCollection [
	poolOfAvailableStaff := OrderedCollection new
]

{ #category : #printing }
HMWorkingDay >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: ' (';
		nextPutAll: self date weekday;
		nextPutAll: ', ';
		nextPutAll: self date asString;
		nextPutAll: ')'
]

{ #category : #accessing }
HMWorkingDay >> recordOfWishes [
	^ recordOfWishes
]

{ #category : #accessing }
HMWorkingDay >> recordOfWishes: aDictionary [
	recordOfWishes := aDictionary.
	^ recordOfWishes
]

{ #category : #accessing }
HMWorkingDay >> shifts [
	^ shifts
]

{ #category : #accessing }
HMWorkingDay >> shifts: aCollection [
	shifts := aCollection
]

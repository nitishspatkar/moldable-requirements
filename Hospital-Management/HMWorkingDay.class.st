Class {
	#name : #HMWorkingDay,
	#superclass : #Object,
	#instVars : [
		'poolOfAvailableStaff',
		'isWeekendDay',
		'shifts',
		'recordOfWishes',
		'date'
	],
	#category : #'Hospital-Management-Model'
}

{ #category : #printing }
HMWorkingDay >> date [
	^ date
]

{ #category : #accessing }
HMWorkingDay >> date: aDate [
	date := aDate
]

{ #category : #accessing }
HMWorkingDay >> gtDayFor: aView [
	"returna mondian view for a day with five shits in squares like in tthe actual schedule"

	<gtView>
	^ aView explicit
		title: 'Day' translated.
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

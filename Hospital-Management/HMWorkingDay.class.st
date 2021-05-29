Class {
	#name : #HMWorkingDay,
	#superclass : #Object,
	#instVars : [
		'shifts',
		'date',
		'availableStaff'
	],
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMWorkingDay >> availableStaff [
	^ availableStaff
]

{ #category : #accessing }
HMWorkingDay >> availableStaff: aCollectionOfDoctors [
	availableStaff := aCollectionOfDoctors
]

{ #category : #printing }
HMWorkingDay >> date [
	^ date
]

{ #category : #accessing }
HMWorkingDay >> date: aDate [
	date := aDate
]

{ #category : #accessing }
HMWorkingDay >> gtAvailableStaffFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Available staff';
		priority: 2;
		items: [ availableStaff ];
		column: 'First Name'
			text: [ :aStaffMember | aStaffMember firstName ]
			width: 100;
		column: 'Last Name'
			text: [ :aStaffMember | aStaffMember lastName ]
			width: 100;
		column: 'Experience'
			text: [ :aStaffMember | aStaffMember experienceInYears ]
			width: 100;
		column: 'Balance working hours'
			text: [ :aStaffMember | aStaffMember balanceWorkingHours ]
			width: 100
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
		column: 'End Time' text: [ :aShift | aShift endTime ];
		column: 'Duration in hours' text: [:aShift | aShift duration].
]

{ #category : #initialize }
HMWorkingDay >> initialize [
	super initialize.
	shifts := OrderedCollection new.
	availableStaff := OrderedCollection new
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
HMWorkingDay >> shifts [
	^ shifts
]

{ #category : #accessing }
HMWorkingDay >> shifts: aCollection [
	shifts := aCollection
]

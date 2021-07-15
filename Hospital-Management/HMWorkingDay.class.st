Class {
	#name : 'HMWorkingDay',
	#superclass : 'Object',
	#instVars : [
		'shifts',
		'date',
		'availableStaff'
	],
	#category : 'Hospital-Management-Model'
}

{ #category : 'accessing' }
HMWorkingDay >> addShift: aShift [ 
	self shifts add: aShift.
	aShift day: self
]

{ #category : 'accessing' }
HMWorkingDay >> addShifts: aCollection [
	aCollection do: [ :aShift |
		self addShift: aShift ]
]

{ #category : 'accessing' }
HMWorkingDay >> assignedDoctors [
	^ self shifts flatCollect: [ :aShift | aShift assignedDoctors ]
]

{ #category : 'accessing' }
HMWorkingDay >> assignedNurses [
	^ self shifts flatCollect: [ :aShift | aShift assignedNurses ]
]

{ #category : 'accessing' }
HMWorkingDay >> availableStaff [
	^ availableStaff
]

{ #category : 'accessing' }
HMWorkingDay >> availableStaff: aCollection [
	availableStaff := aCollection
]

{ #category : 'printing' }
HMWorkingDay >> date [
	^ date
]

{ #category : 'accessing' }
HMWorkingDay >> date: aDate [
	date := aDate
]

{ #category : 'accessing' }
HMWorkingDay >> dayShift [
	^ self shifts select: [:aShift | aShift isDayShift ]
]

{ #category : 'accessing' }
HMWorkingDay >> description [
	^ String streamContents: [ :aStream |
		self descriptionOn:  aStream ]
]

{ #category : 'printing' }
HMWorkingDay >> descriptionOn: aStream [
	aStream
		nextPutAll: self date weekday;
		nextPutAll: ', ';
		nextPutAll: self date asString
]

{ #category : 'accessing' }
HMWorkingDay >> gtAssignedDoctorsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Assigned Doctors';
		priority: 2;
		items: [ self assignedDoctors ];
		column: 'Name' text: [ :aStafMember | aStafMember fullName ];
		column: 'Is experienced' text: [ :aStafMember  | 
			aStafMember isExperienced
				ifTrue: [ 'Yes' ]
				ifFalse: [ 'No' ] ]
]

{ #category : 'accessing' }
HMWorkingDay >> gtAssignedNursesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Assigned Nurses';
		priority: 2;
		items: [ self assignedNurses ];
		column: 'Name' text: [ :aStafMember | aStafMember fullName ];
		column: 'Is experienced'
			text: [ :aStafMember | 
			aStafMember isExperienced
				ifTrue: [ 'Yes' ]
				ifFalse: [ 'No' ] ]
]

{ #category : 'accessing' }
HMWorkingDay >> gtAssignedStaffMembersByShiftsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Schedule';
		priority: 2;
		items: [ self shifts
				flatCollect:
						[ :aShift | aShift assignedDoctors collect: [ :aDoctor | aShift -> aDoctor ] ];
				flatCollect:
						[ :aShift | aShift assignedNurses collect: [ :aNurse | aShift -> aNurse ] ] ];
		column: 'Shift' text: [ :assoc | assoc key description ];
		column: 'Doctor' text: [ :assoc | assoc value fullName ];
		column: 'Is experienced'
			text: [ :assoc | 
			assoc value isExperienced
				ifTrue: [ 'Yes' ]
				ifFalse: [ 'No' ] ];
		column: 'Nurse' text: [ :assoc | assoc value fullName ];
		column: 'Is experienced'
			text: [ :assoc | 
			assoc value isExperienced
				ifTrue: [ 'Yes' ]
				ifFalse: [ 'No' ] ]
]

{ #category : 'accessing' }
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

{ #category : 'initialize' }
HMWorkingDay >> initialize [
	super initialize.
	shifts := OrderedCollection new.
	availableStaff := OrderedCollection new
]

{ #category : 'accessing' }
HMWorkingDay >> nightShift [
	^ self shifts select: [:aShift | aShift isNightShift ]
]

{ #category : 'printing' }
HMWorkingDay >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: ' ('.
	self descriptionOn: aStream.
	aStream	
		nextPutAll: ')'
]

{ #category : 'accessing' }
HMWorkingDay >> shifts [
	^ shifts
]

{ #category : 'accessing' }
HMWorkingDay >> shifts: aCollection [
	shifts := aCollection
]

Class {
	#name : #HMWorkingDayExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

{ #category : #accessing }
HMWorkingDayExamples >> aWorkingDayMayOne [
	<gtExample>
	| aDay shifts |
	aDay := HMWorkingDay new
		shifts: HMShiftExamples new allShifts;
		date: (Date year: 2021 month: 5 day: 1);
		availableStaff: self availableDoctorsOnMayFirst.
	^ aDay
]

{ #category : #accessing }
HMWorkingDayExamples >> aWorkingWeek [
	<gtExample>
	| aCollectionOfDoctors aCollectionOfDays dayWiseAvailableDoctors |
	aCollectionOfDays := (1 to: 7)
		collect: [ :each | 
			HMWorkingDay new
				date: (Date year: 2021 month: 5 day: each);
				shifts: HMShiftExamples new allShifts ].
	dayWiseAvailableDoctors := OrderedCollection new.
	aCollectionOfDoctors := HMStaffMemberExamples new
		allDoctorsWithConstraints.
	aCollectionOfDays
		do: [ :aDay | 
			aCollectionOfDoctors
				do: [ :aDoctor | 
					(aDoctor isAvailableOnDay: aDay)
						ifTrue: [ aDay availableStaff add: aDoctor ] ].
			dayWiseAvailableDoctors add: aDay ].
	^ dayWiseAvailableDoctors
]

{ #category : #accessing }
HMWorkingDayExamples >> availableDoctorsOnMayFirst [
	<gtExample>
	| aCollectionOfDoctors aWorkingDay |
	aCollectionOfDoctors := HMStaffMemberExamples new allDoctorsWithConstraints.
	aWorkingDay := HMWorkingDay new
		date: (Date year: 2021 month: 5 day: 1).
	^ aCollectionOfDoctors
		select: [ :aDoctor | aDoctor isAvailableOnDay: aWorkingDay ]
]

{ #category : #accessing }
HMWorkingDayExamples >> availableDoctorsOnMaySecond [
	<gtExample>
	| aCollectionOfDoctors aWorkingDay |
	aCollectionOfDoctors := HMStaffMemberExamples new
		allDoctorsWithConstraints.
	aWorkingDay := HMWorkingDay new
		date: (Date year: 2021 month: 5 day: 2).
	^ aCollectionOfDoctors
		select: [ :aDoctor | aDoctor isAvailableOnDay: aWorkingDay ]
]

{ #category : #accessing }
HMWorkingDayExamples >> availableDoctorsOnMayThird [
	<gtExample>
	| aCollectionOfDoctors aWorkingDay |
	aCollectionOfDoctors := HMStaffMemberExamples new
		allDoctorsWithConstraints.
	aWorkingDay := HMWorkingDay new
		date: (Date year: 2021 month: 5 day: 3).
	^ aCollectionOfDoctors
		select: [ :aDoctor | aDoctor isAvailableOnDay: aWorkingDay ]
]

{ #category : #accessing }
HMWorkingDayExamples >> seminarDayCheckPass [
	<gtExample>
	| aCollectionOfDoctors aDay aSeminarConstraint aConstraint test |
	aCollectionOfDoctors := self vacationDayCheckPass.
	aDay := HMWorkingDay new date: (Date year: 2021 month: 5 day: 1).
	aSeminarConstraint := HMStaffSeminarConstraintType new
		description: 'A seminar day for a staff member'.
	aConstraint := HMStaffConstraint new
		date: (Date year: 2021 month: 5 day: 1);
		type: aSeminarConstraint.
	^ aSeminarConstraint
		aSeminarConstraintForACollectionOfDoctors: aCollectionOfDoctors
		andForADate: aDay
]

{ #category : #accessing }
HMWorkingDayExamples >> vacationDayCheckPass [
	<gtExample>
	| aCollectionOfDoctors aDay aVacationConstraint aConstraint test |
	aCollectionOfDoctors := self weddingDayCheckPass.
	aDay := HMWorkingDay new date: (Date year: 2021 month: 5 day: 1).
	aVacationConstraint := HMStaffHolidayConstraintType new
		description: 'A holiday for a staff member'.
	aConstraint := HMStaffConstraint new
		date: (Date year: 2021 month: 5 day: 1);
		type: aVacationConstraint.
	^ aVacationConstraint
		aVacationConstraintForACollectionOfDoctors: aCollectionOfDoctors
		andForADate: aDay
]

{ #category : #accessing }
HMWorkingDayExamples >> weddingDayCheckPass [
	<gtExample>
	| aCollectionOfDoctors aWorkingDay |
	
	aCollectionOfDoctors := self doctoresWithVariousConstraints.
	aWorkingDay := HMWorkingDay new
		date: (Date year: 2021 month: 5 day: 1).
	^ aCollectionOfDoctors select: [ :aDoctor | 
		aDoctor isAvailableOnDay: aWorkingDay ].
]

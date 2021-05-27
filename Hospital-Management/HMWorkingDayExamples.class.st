Class {
	#name : #HMWorkingDayExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

{ #category : #accessing }
HMWorkingDayExamples >> aWorkingDay [
	<gtExample>
	| aDay shifts |
	aDay := HMWorkingDay new 
		shifts: HMShiftExamples new 
			allShifts;
		date: (Date year: 2021 month: 5 day: 1).
	^ aDay
]

{ #category : #accessing }
HMWorkingDayExamples >> aWorkingWeek [
	<gtExample>
	| aDay aWeek days shifts |
	days := {1 . 2 . 3 . 4 . 5 . 6 . 7}.
	aWeek := (1 to: 7)
		collect: [ :each | 
			HMWorkingDay new
				shifts: HMShiftExamples new allShifts;
				date: (Date year: 2021 month: 5 day: each + 2) ].
	^ aWeek
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
	| aCollectionOfDoctors aWorkingDay doctorWithWeddingConstraint doctorWithVacationConstraint doctorWithSeminarConstraint doctorWithoutConstraint aWeddingConstraint aConstraint test |
	doctorWithWeddingConstraint := HMStaffMemberExamples new
		doctorWithWeddingConstraint.
	doctorWithVacationConstraint := HMStaffMemberExamples new
		doctorWithVacationConstraint.
	doctorWithSeminarConstraint := HMStaffMemberExamples new
		doctorWithSeminarConstraint.
	doctorWithoutConstraint := HMStaffMemberExamples new
		doctorWithoutConstraint1.
	aCollectionOfDoctors := OrderedCollection
		with: doctorWithWeddingConstraint
		with: doctorWithVacationConstraint
		with: doctorWithSeminarConstraint
		with: doctorWithoutConstraint.
	aWorkingDay := HMWorkingDay new
		date: (Date year: 2021 month: 5 day: 1).
	aWeddingConstraint := HMStaffCustomConstraintType new.
	^ aWeddingConstraint
		aWeddingConstraintForACollectionOfDoctors: aCollectionOfDoctors
		andForADate: aWorkingDay
]

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
HMWorkingDayExamples >> availableDoctorsOnAWorkingDay [
	<gtExample>
	| aCollectionOfDoctors aDay doctorWithConstraint doctorWithoutConstraint aWeddingConstraint aConstraint test |
	doctorWithConstraint := HMStaffMemberExamples new
		doctorWithConstraint.
	doctorWithoutConstraint := HMStaffMemberExamples new
		doctorWithoutConstraint.
	aCollectionOfDoctors := OrderedCollection
		with: doctorWithConstraint
		with: doctorWithoutConstraint.
	aDay := HMWorkingDay new date: (Date year: 2021 month: 5 day: 1).
	aWeddingConstraint := HMStaffCustomConstraintType new
		description: 'A wedding day'.
	aConstraint := HMStaffConstraint new
		date: (Date year: 2021 month: 5 day: 1);
		type: aWeddingConstraint.
	^ aWeddingConstraint
		aWeddingConstraintForACollectionOfDoctors: aCollectionOfDoctors
		andForADate: aDay
]

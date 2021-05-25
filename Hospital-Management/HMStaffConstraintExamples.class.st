Class {
	#name : #HMStaffConstraintExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

{ #category : #accessing }
HMStaffConstraintExamples >> customConstraint [
	<gtExample>
	| aConstraint constraintType |
	aConstraint := HMStaffConstraint new.
	constraintType := HMStaffCustomConstraintType new.
	constraintType description: 'A wedding day of a staff member'.
	aConstraint
		date: (Date year: 2021 month: 5 day: 1);
		type: constraintType.
	^ aConstraint
]

{ #category : #accessing }
HMStaffConstraintExamples >> seminarConstraint [
	<gtExample>
	| aConstraint constraintType |
	aConstraint := HMStaffConstraint new.
	constraintType := HMStaffSeminarConstraintType new.
	constraintType description: 'A seminar day for a staff member'.
	aConstraint
		date: (Date year: 2021 month: 5 day: 1);
		type: constraintType.
	^ aConstraint
]

{ #category : #accessing }
HMStaffConstraintExamples >> vacationConstraint [
	<gtExample>
	| aConstraint constraintType |
	aConstraint := HMStaffConstraint new.
	constraintType := HMStaffHolidayConstraintType new.
	constraintType description: 'A holiday request from a staff member'.
	aConstraint
		date: (Date year: 2021 month: 5 day: 1);
		type: constraintType.
	^ aConstraint
]

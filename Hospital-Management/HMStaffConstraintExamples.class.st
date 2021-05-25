Class {
	#name : #HMStaffConstraintExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

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

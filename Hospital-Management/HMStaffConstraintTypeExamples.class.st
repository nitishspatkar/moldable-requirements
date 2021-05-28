Class {
	#name : #HMStaffConstraintTypeExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

{ #category : #accessing }
HMStaffConstraintTypeExamples >> availableWorkingHoursConstraint [
	<gtExample>
	| aConstraint constraintType |
	aConstraint := HMStaffConstraint new.
	constraintType := HMStaffMaximumWorkingHoursConstraint new.
	aConstraint type: constraintType.
	^ aConstraint
]

{ #category : #accessing }
HMStaffConstraintTypeExamples >> customWeddingConstraint [
	<gtExample>
	| aConstraint constraintType |
	aConstraint := HMStaffConstraint new.
	constraintType := HMStaffCustomConstraintType new.
	aConstraint type: constraintType.
	^ aConstraint
]

{ #category : #accessing }
HMStaffConstraintTypeExamples >> seminarConstraint [
	<gtExample>
	| aConstraint constraintType |
	aConstraint := HMStaffConstraint new.
	constraintType := HMStaffSeminarConstraintType new.
	aConstraint type: constraintType.
	^ aConstraint
]

{ #category : #accessing }
HMStaffConstraintTypeExamples >> vacationConstraint [
	<gtExample>
	| aConstraint constraintType |
	aConstraint := HMStaffConstraint new.
	constraintType := HMStaffHolidayConstraintType new.
	aConstraint type: constraintType.
	^ aConstraint
]

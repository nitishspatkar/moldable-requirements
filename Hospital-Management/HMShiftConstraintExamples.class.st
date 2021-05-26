Class {
	#name : #HMShiftConstraintExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

{ #category : #accessing }
HMShiftConstraintExamples >> nightShiftNotPossible [
	<gtExample>
	| aCollectionOfDoctors nightShiftConstraint |
	nightShiftConstraint := HMShiftExperiencedAndInexperiencedConstraint
		new.
	aCollectionOfDoctors := HMStaffMemberExamples new
		poolOfThreeExperiencedDoctors.
	^ nightShiftConstraint nightShiftCheck: aCollectionOfDoctors
]

{ #category : #accessing }
HMShiftConstraintExamples >> nightShiftPossible [
	<gtExample>
	| aCollectionOfDoctors nightShiftConstraint |
	nightShiftConstraint := HMShiftExperiencedAndInexperiencedConstraint
		new.
	aCollectionOfDoctors := HMStaffMemberExamples new
		poolOfTenRandomDoctors.
	^ nightShiftConstraint nightShiftCheck: aCollectionOfDoctors
]

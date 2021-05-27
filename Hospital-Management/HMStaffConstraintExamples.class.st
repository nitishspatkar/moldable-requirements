Class {
	#name : #HMStaffConstraintExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

{ #category : #accessing }
HMStaffConstraintExamples >> permissibleWorkingHoursConstraint [
	<gtExample>
	| aDoctor aConstraint |
	aDoctor := HMDoctor new
		firstName: 'Amir';
		lastName: 'Steiger';
		experienceInYears: 17;
		balanceWorkingHours: 17;
		compensationHours: 2.7.
	aConstraint := HMStaffMaximumWorkingHoursConstraint new.
	^ aConstraint allowedToWork: aDoctor
]

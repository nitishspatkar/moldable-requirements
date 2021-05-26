Class {
	#name : #HMStaffConstraintExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

{ #category : #accessing }
HMStaffConstraintExamples >> aCollectionOfConstraints [
	<gtExample>
	| aCollectionOfConstraints |
	aCollectionOfConstraints := {{(HMDoctor new
		firstName: 'Shane';
		lastName: 'Botros';
		experienceInYears: 5;
		balanceWorkingHours: 50).
	HMStaffConstraintExamples new vacationConstraint}.
	{(HMDoctor new
		firstName: 'Alexandra';
		lastName: 'Meuller';
		experienceInYears: 9;
		balanceWorkingHours: 50).
	HMStaffConstraintExamples new customConstraint}.
	{(HMDoctor new
		firstName: 'Sanjeet';
		lastName: 'Murphy';
		experienceInYears: 9;
		balanceWorkingHours: 50).
	HMStaffConstraintExamples new customConstraint}}.
	^ aCollectionOfConstraints
]

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
HMStaffConstraintExamples >> doctorAllowedToWork [
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

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

{ #category : #accessing }
HMShiftConstraintExamples >> oneDoctorDayShiftPossible [
	<gtExample>
	| aDoctor oneDoctorPerShiftConstraint aDayShift |
	aDayShift := HMShiftExamples new aDayShift.
	oneDoctorPerShiftConstraint := HMShiftOneDoctorConstraint new.
	aDoctor := HMStaffMemberExamples new doctorWithConstraint asOrderedCollection.
	^ oneDoctorPerShiftConstraint aDoctorIn: aDoctor inShift: aDayShift
]

{ #category : #accessing }
HMShiftConstraintExamples >> oneDoctorNightShiftNotPossible [
	<gtExample>
	| aDoctor oneDoctorPerShiftConstraint aNightShift |
	aNightShift := HMShiftExamples new aNightShiftForExperienced.
	oneDoctorPerShiftConstraint := HMShiftOneDoctorConstraint new.
	aDoctor := HMStaffMemberExamples new doctorWithConstraint
		asOrderedCollection.
	^ oneDoctorPerShiftConstraint aDoctorIn: aDoctor inShift: aNightShift
]

{ #category : #accessing }
HMShiftConstraintExamples >> tooManyDoctorsInAShift [
	<gtExample>
	| aCollectionOfDoctors oneDoctorPerShiftConstraint aDayShift |
	aDayShift := HMShiftExamples new aDayShift.
	oneDoctorPerShiftConstraint := HMShiftOneDoctorConstraint new.
	aCollectionOfDoctors := HMStaffMemberExamples new
		poolOfTenRandomDoctors.
	^ oneDoctorPerShiftConstraint
		aDoctorIn: aCollectionOfDoctors
		inShift: aDayShift
]

Class {
	#name : #HMShiftConstraintExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

{ #category : #accessing }
HMShiftConstraintExamples >> assignOneDoctorToDayShiftMayOne [
	"assigns a doctor to a shift, updates the  available doctors, and returns the list of available doctors"

	<gtExample>
	| aCollectionOfAvailableDoctors aDayShift oneDoctorPerShiftConstraint assignedDoctor |
	aCollectionOfAvailableDoctors := HMWorkingDayExamples new
		availableDoctorsOnMayFirst.
	aDayShift := HMShiftExamples new aDayShift.
	oneDoctorPerShiftConstraint := HMShiftOneDoctorConstraint new.
	assignedDoctor := oneDoctorPerShiftConstraint
		assignDoctorFrom: aCollectionOfAvailableDoctors
		toShift: aDayShift.
	^ aCollectionOfAvailableDoctors
]

{ #category : #accessing }
HMShiftConstraintExamples >> assignTwoDoctorsToNightShiftMayOne [
	"assigns a doctor to a shift, updates the  available doctors, and returns the list of available doctors"

	<gtExample>
	| aCollectionOfAvailableDoctors twoDoctorsPerShiftConstraint aNightShift assignedDoctor |
	aCollectionOfAvailableDoctors := self assignOneDoctorToDayShiftMayOne.
	aNightShift := HMShiftExamples new aNightShift.
	twoDoctorsPerShiftConstraint := HMShiftExperiencedAndInexperiencedConstraint
		new.
	^ twoDoctorsPerShiftConstraint
		assignDoctorsFrom: aCollectionOfAvailableDoctors
		toNightShift: aNightShift
]

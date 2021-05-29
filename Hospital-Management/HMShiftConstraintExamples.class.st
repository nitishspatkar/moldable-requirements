Class {
	#name : #HMShiftConstraintExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

{ #category : #accessing }
HMShiftConstraintExamples >> assignDoctorsToAllShiftsMayOne [
	<gtExample>
	| aCollectionOfAvailableDoctors allShifts oneDoctorPerShiftConstraint assignedDoctor |
	oneDoctorPerShiftConstraint := HMShiftOneDoctorConstraint new.
	aCollectionOfAvailableDoctors := HMWorkingDayExamples new
		availableDoctorsOnMayFirst.
	allShifts := HMShiftExamples new allShifts.
	allShifts
		do: [ :aShift | 
			"give shifts collection to model method that iteratively and progressively assigns doctors to all shifts"
			oneDoctorPerShiftConstraint
				assignDoctorFrom: aCollectionOfAvailableDoctors
				toNonNightShifts: allShifts ]
]

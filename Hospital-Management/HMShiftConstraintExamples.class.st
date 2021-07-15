Class {
	#name : 'HMShiftConstraintExamples',
	#superclass : 'Object',
	#category : 'Hospital-Management-Examples'
}

{ #category : 'accessing' }
HMShiftConstraintExamples >> assignDoctorsToAllShiftsMayOne [
	<gtExample>
	| aCollectionOfAvailableDoctors allShifts oneDoctorPerShiftConstraint nightShiftConstraint assignedDoctor aGlobalRegister |
	aGlobalRegister := HMRegisterExamples new aGolbalRegister.
	oneDoctorPerShiftConstraint := HMShiftOneDoctorConstraint new.
	nightShiftConstraint := HMShiftExperiencedAndInexperiencedConstraint
		new.
	aCollectionOfAvailableDoctors := HMWorkingDayExamples new
		availableDoctorsOnMayFirst.
	allShifts := HMShiftExamples new allShifts.
	allShifts
		do: [ :aShift | 
			| availableDoctorsAfterNonNightShifts |
			"give shifts collection to model method that iteratively and progressively assigns doctors to all shifts"
			availableDoctorsAfterNonNightShifts := oneDoctorPerShiftConstraint
				assignDoctorFrom: aCollectionOfAvailableDoctors
				toNonNightShifts: allShifts
				andUpdateIn: aGlobalRegister.
			nightShiftConstraint
				assignDoctorsFrom: availableDoctorsAfterNonNightShifts
				toNightShift: allShifts
				andUpdateIn: aGlobalRegister ].
	^ allShifts
]

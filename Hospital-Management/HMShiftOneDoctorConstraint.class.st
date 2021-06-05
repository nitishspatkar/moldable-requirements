"
According to this constraint, all other shifts than a night  shift should have one doctor and a nurse assigned.
"
Class {
	#name : #HMShiftOneDoctorConstraint,
	#superclass : #HMShiftConstraint,
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMShiftOneDoctorConstraint >> assignDoctorFrom: aCollectionOfAvailableDoctors toNonNightShifts: shifts andUpdateIn: aRegister [
	shifts
		select: #isDayShift
		thenDo: [ :aShift | 
			"assign doctor to each shift and modify the assigned doctor"
			aShift staff size ~= 1
				ifTrue: [ | aDoctorForShift |
					aDoctorForShift := aCollectionOfAvailableDoctors
						detect: [ :aDoctor | aDoctor availableForAnotherShift ]
						ifNone: [ ^ 'Day shift: No available doctor!' ].
					aShift staff add: aDoctorForShift.
					aDoctorForShift
						balanceWorkingHours: aDoctorForShift balanceWorkingHours - aShift duration.
					aDoctorForShift availableForAnotherShift: false.
					aRegister records
						add: {
							aShift.
							aDoctorForShift } ] ].
	^ aCollectionOfAvailableDoctors
]

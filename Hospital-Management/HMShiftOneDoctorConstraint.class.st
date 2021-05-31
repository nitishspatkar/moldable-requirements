Class {
	#name : #HMShiftOneDoctorConstraint,
	#superclass : #HMShiftConstraint,
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMShiftOneDoctorConstraint >> assignDoctorFrom: aCollectionOfAvailableDoctors toNonNightShifts: shifts andUpdateIn: aRegister [
	shifts
		do: [ :aShift | 
			" check if the shift type/code is not night shift"
			(aShift shiftCode ~= 'E-N' or: aShift shiftCode ~= 'I-N')
				ifTrue: [ "assign doctor to each shift and modify the assigned doctor"
					(aShift shiftCode = 'T' and: aShift staff size ~= 1)
						ifTrue: [ | aDoctorForMorningShift |
							aDoctorForMorningShift := aCollectionOfAvailableDoctors
								detect: [ :aDoctor | aDoctor availableForAnotherShift ]
								ifNone: [ ^ 'Day shift: No available doctor!' ].
							aShift staff add: aDoctorForMorningShift.
							aDoctorForMorningShift
								balanceWorkingHours: aDoctorForMorningShift balanceWorkingHours - aShift duration.
							aDoctorForMorningShift availableForAnotherShift: false.
							aRegister records
								add:
									{aShift.
									aDoctorForMorningShift} ].
					(aShift shiftCode = 'M' and: aShift staff size ~= 1)
						ifTrue: [ | aDoctorForMidDayShift |
							aDoctorForMidDayShift := aCollectionOfAvailableDoctors
								detect: [ :aDoctor | aDoctor availableForAnotherShift ]
								ifNone: [ ^ 'Mid day shift: No available doctor!' ].
							aShift staff add: aDoctorForMidDayShift.
							aDoctorForMidDayShift
								balanceWorkingHours: aDoctorForMidDayShift balanceWorkingHours - aShift duration.
							aDoctorForMidDayShift availableForAnotherShift: false.
							aRegister records
								add:
									{aShift.
									aDoctorForMidDayShift} ].
					(aShift shiftCode = 'S1' and: aShift staff size ~= 1)
						ifTrue: [ | aDoctorForEarlyLateShift |
							aDoctorForEarlyLateShift := aCollectionOfAvailableDoctors
								detect: [ :aDoctor | aDoctor availableForAnotherShift ]
								ifNone: [ ^ 'Earlt late shift: No available doctor!' ].
							aShift staff add: aDoctorForEarlyLateShift.
							aDoctorForEarlyLateShift
								balanceWorkingHours: aDoctorForEarlyLateShift balanceWorkingHours - aShift duration.
							aDoctorForEarlyLateShift availableForAnotherShift: false.
							aRegister records
								add:
									{aShift.
									aDoctorForEarlyLateShift} ].
					(aShift shiftCode = 'S2' and: aShift staff size ~= 1)
						ifTrue: [ | aDoctorForLateLateShift |
							aDoctorForLateLateShift := aCollectionOfAvailableDoctors
								detect: [ :aDoctor | aDoctor availableForAnotherShift ]
								ifNone: [ ^ 'Late late shift: No available doctor!' ].
							aShift staff add: aDoctorForLateLateShift.
							aDoctorForLateLateShift
								balanceWorkingHours: aDoctorForLateLateShift balanceWorkingHours - aShift duration.
							aDoctorForLateLateShift availableForAnotherShift: false.
							aRegister records
								add:
									{aShift.
									aDoctorForLateLateShift} ] ]
				ifFalse: [ ^ 'Night shift' ] ].
	^ aCollectionOfAvailableDoctors
]

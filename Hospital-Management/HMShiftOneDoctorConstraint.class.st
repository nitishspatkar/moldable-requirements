Class {
	#name : #HMShiftOneDoctorConstraint,
	#superclass : #HMShiftConstraint,
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMShiftOneDoctorConstraint >> assignDoctorFrom: aCollectionOfAvailableDoctors toShift: aShift [
	" checks if the shift type/code is not night shift"

	| theFirstDoctor |
	theFirstDoctor := aCollectionOfAvailableDoctors first.
	(aShift shiftCode ~= 'E-N' or: aShift shiftCode ~= 'I-N')
		ifTrue: [ aShift staff add: theFirstDoctor.
			theFirstDoctor
				balanceWorkingHours: theFirstDoctor balanceWorkingHours - aShift duration.
			theFirstDoctor availableForAnotherShift: false ]
		ifFalse: [ ^ 'Night shift' ].
	^ aCollectionOfAvailableDoctors
]

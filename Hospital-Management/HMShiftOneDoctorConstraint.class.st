Class {
	#name : #HMShiftOneDoctorConstraint,
	#superclass : #HMShiftConstraint,
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMShiftOneDoctorConstraint >> aDoctorIn: aCollectionOfDoctors inShift: aTypeOfShift [
	" checks if the shift type/code is not night shift and the count of doctor is one"

	aCollectionOfDoctors size = 1
		ifTrue: [ aTypeOfShift shiftCode = 'E-N' | (aTypeOfShift shiftCode = 'I-N')
				ifTrue: [ ^ 'It is a night shift!' ]
				ifFalse: [ ^ 'Right number of Doctors!' ] ]
		ifFalse: [ ^ 'More than one doctor!' ]
]

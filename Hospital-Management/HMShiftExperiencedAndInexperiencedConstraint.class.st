Class {
	#name : #HMShiftExperiencedAndInexperiencedConstraint,
	#superclass : #HMShiftConstraint,
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMShiftExperiencedAndInexperiencedConstraint >> assignDoctorsFrom: aCollectionOfDoctors toNightShift: aShift [
	" checks if the shift type/code is a night shift"

	| availableDoctorsForNightShift experiencedDoctor inExperiencedDoctor totalExperienced totalInExperienced |
	availableDoctorsForNightShift := aCollectionOfDoctors
		select: [ :aDoctor | aDoctor availableForAnotherShift ].
	experiencedDoctor := availableDoctorsForNightShift
		detect: [ :aDoctor | aDoctor isExperienced ].
	inExperiencedDoctor := availableDoctorsForNightShift
		detect: [ :aDoctor | aDoctor isExperienced not ].
	(aShift shiftCode = 'N')
		ifTrue: [ aShift staff add: experiencedDoctor.
			aShift staff add: inExperiencedDoctor.
			"reduce the number of balance working hours of assigned doctors"
			experiencedDoctor
				balanceWorkingHours: (experiencedDoctor balanceWorkingHours - aShift duration);
				availableForAnotherShift: false.
			inExperiencedDoctor
				balanceWorkingHours: (inExperiencedDoctor balanceWorkingHours - aShift duration);
				availableForAnotherShift: false ].
	^ availableDoctorsForNightShift
]

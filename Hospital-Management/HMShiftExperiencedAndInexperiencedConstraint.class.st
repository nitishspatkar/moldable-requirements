"
According to this constraint, a night shift should have both experienced and inexperienced doctors and nurses.
"
Class {
	#name : #HMShiftExperiencedAndInexperiencedConstraint,
	#superclass : #HMShiftConstraint,
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMShiftExperiencedAndInexperiencedConstraint >> assignDoctorsFrom: aCollectionOfDoctors toNightShift: shifts andUpdateIn: aRegister [
	" checks if the shift type/code is a night shift"

	| availableDoctors totalExperienced totalInExperienced aNightShift |
	availableDoctors := aCollectionOfDoctors
		select: [ :aDoctor | aDoctor availableForAnotherShift ].
	aNightShift := shifts detect: [ :aShift | aShift shiftCode = 'N' ].
	aNightShift staff size ~= 2
		ifTrue: [ | experiencedDoctor inExperiencedDoctor |
			experiencedDoctor := availableDoctors
				detect: [ :aDoctor | aDoctor isExperienced ].
			inExperiencedDoctor := availableDoctors
				detect: [ :aDoctor | aDoctor isNotExperienced ].
			aNightShift staff add: experiencedDoctor.
			aNightShift staff add: inExperiencedDoctor.
			"reduce the number of balance working hours of assigned doctors"
			experiencedDoctor
				balanceWorkingHours: experiencedDoctor balanceWorkingHours - aNightShift duration;
				availableForAnotherShift: false.
			aRegister records
				add:
					{aNightShift.
					experiencedDoctor}.
			inExperiencedDoctor
				balanceWorkingHours: inExperiencedDoctor balanceWorkingHours - aNightShift duration;
				availableForAnotherShift: false.
			aRegister records
				add:
					{aNightShift.
					inExperiencedDoctor} ].
	^ availableDoctors
]

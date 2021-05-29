Class {
	#name : #HMShiftExperiencedAndInexperiencedConstraint,
	#superclass : #HMShiftConstraint,
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMShiftExperiencedAndInexperiencedConstraint >> assignDoctorsFrom: aCollectionOfDoctors toNightShift: shifts [
	" checks if the shift type/code is a night shift"

	| availableDoctors experiencedDoctor inExperiencedDoctor totalExperienced totalInExperienced aNightShift |
	availableDoctors := aCollectionOfDoctors
		select: [ :aDoctor | aDoctor availableForAnotherShift ].
	experiencedDoctor := availableDoctors
		detect: [ :aDoctor | aDoctor isExperienced ].
	inExperiencedDoctor := availableDoctors
		detect: [ :aDoctor | aDoctor isNotExperienced ].
	aNightShift := shifts detect: [ :aShift | aShift shiftCode = 'N' ].
	aNightShift staff add: experiencedDoctor.
	aNightShift staff add: inExperiencedDoctor.
	"reduce the number of balance working hours of assigned doctors"
	experiencedDoctor
		balanceWorkingHours: (experiencedDoctor balanceWorkingHours - aNightShift duration).
		"experiencedDoctor availableForAnotherShift: false."
	inExperiencedDoctor
		balanceWorkingHours: (inExperiencedDoctor balanceWorkingHours - aNightShift duration).
		"experiencedDoctor availableForAnotherShift: false."
	^ availableDoctors
]

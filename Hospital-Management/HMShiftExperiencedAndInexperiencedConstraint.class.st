Class {
	#name : #HMShiftExperiencedAndInexperiencedConstraint,
	#superclass : #HMShiftConstraint,
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMShiftExperiencedAndInexperiencedConstraint >> nightShiftCheck: aCollectionOfDoctors [
	"checks if the collection has at least one experienced and one inexperienced doctor"

	| experiencedDoctor inExperiencedDoctor totalExperienced totalInExperienced |
	experiencedDoctor := HMDoctor new.
	totalExperienced := aCollectionOfDoctors
		count: [ :doctor | doctor experienceInYears > 5 ].
	totalInExperienced := aCollectionOfDoctors
		count: [ :doctor | doctor experienceInYears < 5 ].
	totalExperienced >= 1
		ifTrue: [ totalInExperienced >= 1
				ifTrue: [ ^ 'We have both' ]
				ifFalse: [ ^ 'No inexperienced doctor' ] ]
		ifFalse: [ ^ 'No experienced doctor' ]
]

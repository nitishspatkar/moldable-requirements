Class {
	#name : #HMStaffMaximumWorkingHoursConstraint,
	#superclass : #HMStaffConstraintType,
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMStaffMaximumWorkingHoursConstraint >> withEnoughBalancedWorkingHours: aCollectionOfDoctors [
	" accpets a set of doctors, go through their balanced working hours, and returns a set of doctors who are available on that day"

	| availableDoctors |
	availableDoctors := OrderedCollection new.
	aCollectionOfDoctors
		do: [ :each | 
			each balanceWorkingHours > 8
				ifTrue: [ availableDoctors add: each ] ].
	^ availableDoctors
]

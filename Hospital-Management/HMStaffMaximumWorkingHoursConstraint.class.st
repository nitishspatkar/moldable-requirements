Class {
	#name : #HMStaffMaximumWorkingHoursConstraint,
	#superclass : #HMStaffConstraintType,
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMStaffMaximumWorkingHoursConstraint >> allowedToWork: aStaffMember [
	aStaffMember balanceWorkingHours > 8
		ifTrue: [ ^ 'Can be assigned to a shift' ]
		ifFalse: [ ^ 'Too less remaining working hours' ]
]

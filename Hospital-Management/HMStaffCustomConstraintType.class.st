Class {
	#name : #HMStaffCustomConstraintType,
	#superclass : #HMStaffConstraintType,
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMStaffCustomConstraintType >> aWeddingConstraintForACollectionOfDoctors: aCollectionOfDoctors andForADate: aDay [
	" accpets a set of doctors and a day, go through their wedding constraints, and returns a set of doctors who are available on that day"

	| availableDoctors |
	availableDoctors := OrderedCollection new.
	aCollectionOfDoctors
		do: [ :each | 
			each constraints first date = aDay date
				& (each constraints first type class = HMStaffCustomConstraintType)
				ifFalse: [ availableDoctors add: each ] ].
	^ availableDoctors
]

{ #category : #accessing }
HMStaffCustomConstraintType >> initialize [
	super initialize.
	description := 'A wedding day for a staff member'
]

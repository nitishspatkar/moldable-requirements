"
A staff member can have a seminar on a specific day, which needs to be considered while preparing a schedule.

"
Class {
	#name : #HMStaffSeminarConstraintType,
	#superclass : #HMStaffConstraintType,
	#category : 'Hospital-Management-Model'
}

{ #category : #accessing }
HMStaffSeminarConstraintType >> aSeminarConstraintForACollectionOfDoctors: aCollectionOfDoctors andForADate: aDay [
	" accpets a set of doctors and a day, go through their seminar constraints, and returns a set of doctors who are available on that day"

	| availableDoctors |
	availableDoctors := OrderedCollection new.
	aCollectionOfDoctors
		do: [ :each | 
			each constraints first date = aDay date
				& (each constraints first type class = HMStaffSeminarConstraintType)
				ifFalse: [ availableDoctors add: each ] ].
	^ availableDoctors
]

{ #category : #accessing }
HMStaffSeminarConstraintType >> initialize [
	super initialize.
	description := 'A seminar day for a staff member'
]

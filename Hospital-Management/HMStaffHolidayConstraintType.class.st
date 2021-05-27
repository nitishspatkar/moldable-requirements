Class {
	#name : #HMStaffHolidayConstraintType,
	#superclass : #HMStaffConstraintType,
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMStaffHolidayConstraintType >> aVacationConstraintForACollectionOfDoctors: aCollectionOfDoctors andForADate: aDay [
	" accpets a set of doctors and a day, go through their vacation constraints, and returns a set of doctors who are available on that day"

	| availableDoctors |
	availableDoctors := OrderedCollection new.
	aCollectionOfDoctors
		do: [ :each | 
			each constraints first date = aDay date
				& (each constraints first type class = HMStaffHolidayConstraintType)
				ifFalse: [ availableDoctors add: each ] ].
	^ availableDoctors
]

{ #category : #accessing }
HMStaffHolidayConstraintType >> initialize [
	super initialize.
	description := 'A holdiday request from a staff member'
]

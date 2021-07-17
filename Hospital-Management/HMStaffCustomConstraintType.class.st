"
A staff member can have a special wish, such as a wedding day, for a specific day, which needs to be considered while preparing a schedule.

"
Class {
	#name : #HMStaffCustomConstraintType,
	#superclass : #HMStaffConstraintType,
	#category : 'Hospital-Management-Model'
}

{ #category : #accessing }
HMStaffCustomConstraintType >> aWeddingConstraintForACollectionOfDoctors: aCollectionOfDoctors andForADate: aWorkingDay [
	" accpets a set of doctors and a day, go through their wedding constraints, and returns a set of doctors who are available on that day"

	| availableDoctors |
	availableDoctors := OrderedCollection new.
	aCollectionOfDoctors collect: [ :aDoctor | 
			aDoctor isAvailableOnDay: aWorkingDay ].
	^ availableDoctors
]

{ #category : #accessing }
HMStaffCustomConstraintType >> initialize [
	super initialize.
	self description: 'A wedding day for a staff member'
]

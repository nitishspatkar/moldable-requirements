Class {
	#name : #HMStaffMember,
	#superclass : #Object,
	#instVars : [
		'experienceInYears',
		'shifts',
		'constraints',
		'lastName',
		'firstName',
		'balanceWorkinghours',
		'compensationHours'
	],
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMStaffMember >> balanceWorkingHours [
	^ balanceWorkinghours
]

{ #category : #accessing }
HMStaffMember >> balanceWorkingHours: aNumber [
	balanceWorkinghours := aNumber
]

{ #category : #accessing }
HMStaffMember >> compensationHours [
	^ compensationHours
]

{ #category : #accessing }
HMStaffMember >> compensationHours: aNumber [
	compensationHours := aNumber
]

{ #category : #accessing }
HMStaffMember >> experienceInYears [
	^ experienceInYears
]

{ #category : #accessing }
HMStaffMember >> experienceInYears: aNumber [
	experienceInYears := aNumber
]

{ #category : #accessing }
HMStaffMember >> firstName [
	^ firstName
]

{ #category : #accessing }
HMStaffMember >> firstName: aString [
	firstName := aString
]

{ #category : #accessing }
HMStaffMember >> gtStaffMemberFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Staff member';
		priority: 1;
		items: [ {('Type' -> self class).
			('First Namme' -> self firstName).
			('Last Namme' -> self lastName).
			('Experience' -> self experienceInYears).
			('Remaining Working hours' -> self balanceWorkingHours).
			('Available compensation hours' -> self compensationHours)} ];
		column: 'Type' item: #key;
		column: 'Experience' item: #value
]

{ #category : #accessing }
HMStaffMember >> initialize [
	super initialize.
	shifts := OrderedCollection new
]

{ #category : #accessing }
HMStaffMember >> lastName [
	^ lastName
]

{ #category : #accessing }
HMStaffMember >> lastName: aString [
	lastName := aString
]

{ #category : #accessing }
HMStaffMember >> shifts [
	^ shifts
]

{ #category : #accessing }
HMStaffMember >> shifts: assignedShifts [
	shifts := assignedShifts
]

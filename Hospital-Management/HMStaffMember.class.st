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
HMStaffMember >> constraints [
	^ constraints
]

{ #category : #accessing }
HMStaffMember >> constraints: someConstraints [
	constraints := someConstraints
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
HMStaffMember >> fullName [
	^ self firstName, ' ', self lastName
]

{ #category : #accessing }
HMStaffMember >> gtBasicStaffMemberFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Basic details';
		priority: 1;
		items: [ {('Type' -> self class).
			('First Name' -> self firstName).
			('Last Name' -> self lastName).
			('Experience' -> self experienceInYears).
			('Remaining Working hours' -> self balanceWorkingHours).
			('Available compensation hours' -> self compensationHours).
			('Available for another shift' -> self availableForAnotherShift)} ];
		column: 'Attribute' item: #key;
		column: 'Value' item: #value;
		send: #value
]

{ #category : #accessing }
HMStaffMember >> gtViewConstraintsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Constraints';
		priority: 2;
		items: [self constraints];
		column: 'Date' text: [ :each | each date ];
		column: 'Description' text: [ :each | each type description ]
]

{ #category : #accessing }
HMStaffMember >> hasEnoughWorkingHours [
	^ self balanceWorkingHours > 9
		ifTrue: [ ^ true ]
		ifFalse: [ ^ false ]
]

{ #category : #accessing }
HMStaffMember >> initialize [
	super initialize.
	shifts := OrderedCollection new.
	constraints := OrderedCollection new.
	availableForAnotherShift := true
]

{ #category : #initialize }
HMStaffMember >> isAvailableOnDay: aWorkingDay [
	^ (self isNotAvailableOnDay: aWorkingDay) not
]

{ #category : #accessing }
HMStaffMember >> isExperienced [
	experienceInYears >= 5
		ifTrue: [ ^ true ]
		ifFalse: [ ^ false ]
]

{ #category : #accessing }
HMStaffMember >> isNotAvailableOnDay: aWorkingDay [
	^ self constraints anySatisfy: [ :aConstraint |
		aConstraint isForDate: aWorkingDay date ].
]

{ #category : #accessing }
HMStaffMember >> isNotExperienced [
	experienceInYears < 5
		ifTrue: [ ^ true ]
		ifFalse: [ ^ false ]
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

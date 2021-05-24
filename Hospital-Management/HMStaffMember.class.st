Class {
	#name : #HMStaffMember,
	#superclass : #Object,
	#instVars : [
		'experienceInYears',
		'shifts',
		'constraints'
	],
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMStaffMember >> experienceInYears [
	^ experienceInYears
]

{ #category : #accessing }
HMStaffMember >> experienceInYears: aNumber [
	experienceInYears := aNumber
]

{ #category : #accessing }
HMStaffMember >> gtStaffMemberFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Staff member';
		priority: 1;
		items: [ {('Type' -> self class).
			('Experience' -> self experienceInYears)} ];
		column: 'Type' item: #key;
		column: 'Experience' item: #value
]

{ #category : #accessing }
HMStaffMember >> initialize [
	super initialize.
	shifts := OrderedCollection new
]

{ #category : #accessing }
HMStaffMember >> shifts [
	^ shifts
]

{ #category : #accessing }
HMStaffMember >> shifts: assignedShifts [
	shifts := assignedShifts
]

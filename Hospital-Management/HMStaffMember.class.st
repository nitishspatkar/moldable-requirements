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

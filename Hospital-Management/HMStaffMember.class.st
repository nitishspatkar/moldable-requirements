Class {
	#name : #HMStaffMember,
	#superclass : #Object,
	#instVars : [
		'experienceInYears'
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
HMStaffMember >> poolOfTenDoctors [
	<gtExample>
	| poolOfDoctors doctors |
	doctors := {1 . 2 . 3 . 4 . 5 . 6 . 7 . 8 . 9 . 10}.
	^ poolOfDoctors := (1 to: 10)
		collect: [ :index | HMDoctor new experienceInYears: (doctors at: index) ]
]

Class {
	#name : #HMHospitalSystem,
	#superclass : #Object,
	#instVars : [
		'staff',
		'schedule'
	],
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMHospitalSystem >> schedule [
	^ schedule
]

{ #category : #accessing }
HMHospitalSystem >> schedule: aSchedule [
	schedule := aSchedule
]

{ #category : #accessing }
HMHospitalSystem >> staff [
	^ staff
]

{ #category : #accessing }
HMHospitalSystem >> staff: staffMembers [
	staff := staffMembers
]

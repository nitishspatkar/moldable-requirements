Class {
	#name : #HMHospitalSystemExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

{ #category : #accessing }
HMHospitalSystemExamples >> withOneDayScheduleAndTenDoctors [
	<gtExample>
	| hospitalManagementSystem schedule |
	hospitalManagementSystem := HMHospitalSystem new.
	"add one day and distribute ten doctors in five shifts"
	schedule := HMScheduleExamples new.
	hospitalManagementSystem schedule: schedule.
	^ hospitalManagementSystem
]

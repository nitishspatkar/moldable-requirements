Class {
	#name : #HMHospitalSystemExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

{ #category : #accessing }
HMHospitalSystemExamples >> hospitalManagemmentSystemWithOneWeekScheduleAndDoctorsWithConstraints [
	<gtExample>
	| hospitalManagementSystem schedule staff |
	hospitalManagementSystem := HMHospitalSystem new.
	schedule := HMScheduleExamples new forOneWeek.
	HMStaffMemberExamples new allDoctorsWithConstraints
		do: [ :each | hospitalManagementSystem staff add: each ].
	hospitalManagementSystem schedule: schedule.
	^ hospitalManagementSystem
]

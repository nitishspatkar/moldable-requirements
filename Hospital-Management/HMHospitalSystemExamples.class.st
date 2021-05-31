Class {
	#name : #HMHospitalSystemExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

{ #category : #accessing }
HMHospitalSystemExamples >> hospitalManagementSystemWithOneMonthScheduleAndDoctorsWithConstraints [
	<gtExample>
	| hospitalManagementSystem schedule staff assigner |
	hospitalManagementSystem := HMHospitalSystem new.
	schedule := HMScheduleExamples new forOneMonth.
	
	HMStaffMemberExamples new allDoctorsWithConstraints
		do: [ :each | hospitalManagementSystem staff add: each ].
	
	assigner := HMScheduleAssigner new.
	assigner 
		doctors: hospitalManagementSystem doctors;
		workingDays: schedule days.
	assigner performAssignment.
		
	hospitalManagementSystem schedule: schedule.
	^ hospitalManagementSystem
]

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

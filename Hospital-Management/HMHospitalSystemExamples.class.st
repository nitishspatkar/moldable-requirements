Class {
	#name : #HMHospitalSystemExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

{ #category : #accessing }
HMHospitalSystemExamples >> withOneDayScheduleAndTenDoctors [
	<gtExample>
	| hospitalManagementSystem schedule staff |
	hospitalManagementSystem := HMHospitalSystem new.
	"add one day and distribute ten doctors in five shifts"
	schedule := HMScheduleExamples new forOneDay.
	staff := HMStaffMemberExamples new poolOfTenRandomDoctors.
	hospitalManagementSystem schedule: schedule; staff: staff.
	^ hospitalManagementSystem
]

{ #category : #accessing }
HMHospitalSystemExamples >> withOneWeekScheduleAndTenDoctors [
	<gtExample>
	| hospitalManagementSystem schedule staff |
	hospitalManagementSystem := HMHospitalSystem new.
	"add one day and distribute ten doctors in five shifts"
	schedule := HMScheduleExamples new forOneWeek.
	staff := HMStaffMemberExamples new poolOfTenRandomDoctors.
	hospitalManagementSystem schedule: schedule; staff: staff.
	^ hospitalManagementSystem
]

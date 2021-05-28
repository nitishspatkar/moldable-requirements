Class {
	#name : #HMHospitalSystemExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

{ #category : #accessing }
HMHospitalSystemExamples >> withOneDaySchedule [
	<gtExample>
	| hospitalManagementSystem schedule staff doctors nurses |
	hospitalManagementSystem := HMHospitalSystem new.
	schedule := HMScheduleExamples new forOneDay.
	HMStaffMemberExamples new allDoctors
		do: [ :each | hospitalManagementSystem staff add: each ].
	"HMStaffMemberExamples new poolOfTwelveRandomNurses
		do: [ :each | hospitalManagementSystem staff add: each ]."
	hospitalManagementSystem schedule: schedule.
	^ hospitalManagementSystem
]

{ #category : #accessing }
HMHospitalSystemExamples >> withOneMonthSchedule [
	<gtExample>
	| hospitalManagementSystem schedule staff |
	hospitalManagementSystem := HMHospitalSystem new.
	schedule := HMScheduleExamples new forOneMonth.
	HMStaffMemberExamples new allDoctors
		do: [ :each | hospitalManagementSystem staff add: each ].
	"HMStaffMemberExamples new poolOfTwelveRandomNurses
		do: [ :each | hospitalManagementSystem staff add: each ]."
	hospitalManagementSystem schedule: schedule.
	^ hospitalManagementSystem
]

{ #category : #accessing }
HMHospitalSystemExamples >> withOneWeekSchedule [
	<gtExample>
	| hospitalManagementSystem schedule staff |
	hospitalManagementSystem := HMHospitalSystem new.
	schedule := HMScheduleExamples new forOneWeek.
	HMStaffMemberExamples new allDoctors
		do: [ :each | hospitalManagementSystem staff add: each ].
	"HMStaffMemberExamples new poolOfTwelveRandomNurses
		do: [ :each | hospitalManagementSystem staff add: each ]."
	hospitalManagementSystem schedule: schedule.
	^ hospitalManagementSystem
]

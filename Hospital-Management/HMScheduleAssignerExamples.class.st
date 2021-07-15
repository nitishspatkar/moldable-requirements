Class {
	#name : 'HMScheduleAssignerExamples',
	#superclass : 'Object',
	#category : 'Hospital-Management-Examples'
}

{ #category : 'accessing' }
HMScheduleAssignerExamples >> oneDaySchedule [
	<gtExample>
	| doctors nurses assigner workingDay |
	doctors := HMStaffMemberExamples new allDoctorsWithConstraints.
	nurses := HMStaffMemberExamples new allNursesWithConstraints.
	workingDay := HMWorkingDay new
		shifts: HMShiftExamples new allShifts;
		date: (Date year: 2021 month: 5 day: 1).
	assigner := HMScheduleAssigner new.
	assigner
		doctors: doctors;
		workingDays: {workingDay}.
	assigner
		nurses: nurses;
		workingDays: {workingDay}.
	assigner performAssignment.
	^ assigner
]

{ #category : 'accessing' }
HMScheduleAssignerExamples >> oneMonthSchedule [
	<gtExample>
	| doctors assigner workingDays |
	doctors := HMStaffMemberExamples new
		allDoctorsWithConstraints.
	workingDays := (1 to: 31) collect: [ :index | 
		HMWorkingDay new
			shifts: HMShiftExamples new allShifts;
			date: (Date year: 2021 month: 5 day: index) ].
	assigner := HMScheduleAssigner new.
	assigner 
		doctors: doctors;
		workingDays: workingDays.
	assigner performAssignment.
	^ HMHospitalSystem new
		staff: doctors;
		schedule: (HMSchedule new
			days: workingDays)
]

{ #category : 'accessing' }
HMScheduleAssignerExamples >> oneWeekSchedule [
	<gtExample>
	| doctors nurses assigner workingDays |
	doctors := HMStaffMemberExamples new allDoctorsWithConstraints.
	nurses := HMStaffMemberExamples new allNursesWithConstraints.
	workingDays := (1 to: 7)
		collect: [ :index | 
			HMWorkingDay new
				shifts: HMShiftExamples new allShifts;
				date: (Date year: 2021 month: 5 day: index) ].
	assigner := HMScheduleAssigner new.
	assigner
		doctors: doctors;
		nurses: nurses;
		workingDays: workingDays.
	assigner performAssignment.
	^ assigner
]

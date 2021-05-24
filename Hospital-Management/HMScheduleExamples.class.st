Class {
	#name : #HMScheduleExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

{ #category : #accessing }
HMScheduleExamples >> forOneDay [
	<gtExample>
	| aSchedule |
	aSchedule := HMSchedule new.
	aSchedule days add: HMWorkingDayExamples new aWorkingDay.
	^ aSchedule
]

{ #category : #accessing }
HMScheduleExamples >> forOneWeek [
	<gtExample>
	| aSchedule |
	aSchedule := HMSchedule new.
	(1 to: 7)
		do: [ :each | 
			aSchedule days
				add:
					(HMWorkingDay new
						shifts: HMShiftExamples new allShifts;
						date: (Date year: 2021 month: 5 day: each)) ].
	^ aSchedule
]

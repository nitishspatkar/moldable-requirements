Class {
	#name : #HMScheduleExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

{ #category : #accessing }
HMScheduleExamples >> forOneDayMayOne [
	<gtExample>
	| schedule aDay staff doctors nurses |
	aDay := HMWorkingDayExamples new aWorkingDay.
	schedule := HMSchedule new.
	schedule days add: aDay.
	^ schedule
]

{ #category : #accessing }
HMScheduleExamples >> forOneMonth [
	<gtExample>
	| aSchedule |
	aSchedule := HMSchedule new.
	(1 to: 31)
		do: [ :each | 
			aSchedule days
				add:
					(HMWorkingDay new
						shifts: HMShiftExamples new allShifts;
						date: (Date year: 2021 month: 5 day: each)) ].
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

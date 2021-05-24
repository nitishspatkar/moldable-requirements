Class {
	#name : #HMWorkingDayExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

{ #category : #accessing }
HMWorkingDayExamples >> aWorkingDay [
	<gtExample>
	| aDay shifts |
	aDay := HMWorkingDay new 
		shifts: HMShiftExamples new 
			allShifts;
		date: (Date year: 2021 month: 5 day: 1).
	^ aDay
]

{ #category : #accessing }
HMWorkingDayExamples >> aWorkingWeek [
	<gtExample>
	| aDay aWeek days shifts |
	days := {1 . 2 . 3 . 4 . 5 . 6 . 7}.
	aWeek := (1 to: 7)
		collect: [ :each | 
			HMWorkingDay new
				shifts: HMShiftExamples new allShifts;
				date: (Date year: 2021 month: 5 day: each) ].
	^ aWeek
]

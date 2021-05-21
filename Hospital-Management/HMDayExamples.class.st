Class {
	#name : #HMDayExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

{ #category : #accessing }
HMDayExamples >> aDay [
	<gtExample>
	| aDay shifts |
	aDay := HMDay new shifts: HMShiftExamples new allShifts.
	HMDayExamples new singleDate
		keysAndValuesDo: [ :key :value | aDay date: key ; givenName: value].
	^ aDay
]

{ #category : #accessing }
HMDayExamples >> aDayWithTwoWishes [
	<gtExample>
	| aDay wishes |
	aDay := HMDay new shifts: HMShiftExamples new allShifts.
	wishes := Array
		newFrom:
			{{HMDoctor new.
			'Seminar'}.
			{HMDoctor new.
			'Vacation'}}.
	aDay recordOfWishes: wishes.
	HMDayExamples new singleDate
		keysAndValuesDo: [ :key :value | aDay date: key ; givenName: value].
	^ aDay
]

{ #category : #accessing }
HMDayExamples >> aWeeek [
	<gtExample>
	| aWeek shifts |
	aWeek := (1 to: 7) collect: [:each | HMDay new ].
	^ aWeek
]

{ #category : #accessing }
HMDayExamples >> aWeek [
	<gtExample>
	| aWeek shifts |
	aWeek := HMDayExamples new sevenDays.
	aWeek
		do: [ :day | 
			HMDayExamples new daysOfWeek
				keysAndValuesDo: [ :key :value | 
					day
						date: key;
						givenName: value ] ].
	^ aWeek
]

{ #category : #accessing }
HMDayExamples >> daysOfWeek [
	<gtExample>
	| aWeek |
	aWeek := Dictionary
		newFrom:
			{('3.May.2021' -> 'Monday').
			('4.May.2021' -> 'Tuesday').
			('5.May.2021' -> 'Wednesday').
			('6.May.2021' -> 'Thursday').
			('7.May.2021' -> 'Friday').
			('8.May.2021' -> 'Saturday').
			('9.May.2021' -> 'Sunday')}.
	^ aWeek
]

{ #category : #accessing }
HMDayExamples >> sevenDays [
	<gtExample>
	| aCollection |
	aCollection := OrderedCollection new.
	1 to: 7 do:
		[ :each | aCollection add: (HMDay new shifts: HMShiftExamples new allShifts) ].
	^ aCollection
]

{ #category : #accessing }
HMDayExamples >> singleDate [
	<gtExample>
	| aDate |
	aDate := Dictionary newFrom: {'3.May.2021' -> 'Monday'}.
	^ aDate
]

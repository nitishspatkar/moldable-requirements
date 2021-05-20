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
	^ aDay
]

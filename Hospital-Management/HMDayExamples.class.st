Class {
	#name : #HMDayExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

{ #category : #accessing }
HMDayExamples >> aDay [
	<gtExample>
	^ HMDay new shifts: HMShiftExamples new allShifts
]

{ #category : #accessing }
HMDayExamples >> aDayWithTwoWishes [
	<gtExample>
	| aDay wishes |
	aDay := HMDay new.
	wishes := Array
		newFrom:
			{{HMDoctor new.
			'Seminar'}.
			{HMDoctor new.
			'Vacation'}}.
	aDay recordOfWishes: wishes.
	^ aDay
]

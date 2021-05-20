Class {
	#name : #HMShiftExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

{ #category : #accessing }
HMShiftExamples >> aDayShift [
	<gtExample>
	| aShift |
	aShift := HMShift new.
	aShift
		startTime: '07:30';
		endTime: '16:30'.
	^ aShift
]

{ #category : #accessing }
HMShiftExamples >> aLateLateShift [
	<gtExample>
	| aShift |
	aShift := HMShift new.
	aShift
		startTime: '16:00';
		endTime: '01:00'.
	^ aShift
]

{ #category : #accessing }
HMShiftExamples >> aMidDayShift [
	<gtExample>
	| aShift |
	aShift := HMShift new.
	aShift
		startTime: '00:30';
		endTime: '20:30'.
	^ aShift
]

{ #category : #accessing }
HMShiftExamples >> aNightShiftForExperienced [
	<gtExample>
	| aShift |
	aShift := HMShift new.
	aShift
		startTime: '22:30';
		endTime: '07:45'.
	^ aShift
]

{ #category : #accessing }
HMShiftExamples >> aNightShiftForInexperienced [
	<gtExample>
	| aShift |
	aShift := HMShift new.
	aShift
		startTime: '20:00';
		endTime: '05:00'.
	^ aShift
]

{ #category : #accessing }
HMShiftExamples >> allShifts [
	<gtExample>
	| allShifts |
	allShifts := OrderedCollection new
		add:
			{self aDayShift.
			self aMidDayShift.
			self anEarlyLateShift.
			self aLateLateShift.
			self aNightShiftForExperienced.
			self aNightShiftForInexperienced}.
	^ allShifts
]

{ #category : #accessing }
HMShiftExamples >> anEarlyLateShift [
	<gtExample>
	| aShift |
	aShift := HMShift new.
	aShift
		startTime: '14:30';
		endTime: '23:30'.
	^ aShift
]

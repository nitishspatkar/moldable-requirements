Class {
	#name : #HMShift,
	#superclass : #Object,
	#instVars : [
		'endTime',
		'startTime'
	],
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMShift >> aDayShift [
	<gtExample>
	| aShift |
	aShift := HMShift new.
	aShift
		startTime: '07:30';
		endTime: '16:30'.
	^ aShift
]

{ #category : #accessing }
HMShift >> aLateLateShift [
	<gtExample>
	| aShift |
	aShift := HMShift new.
	aShift
		startTime: '16:00';
		endTime: '01:00'.
	^ aShift
]

{ #category : #accessing }
HMShift >> aMidDayShift [
	<gtExample>
	| aShift |
	aShift := HMShift new.
	aShift
		startTime: '00:30';
		endTime: '20:30'.
	^ aShift
]

{ #category : #accessing }
HMShift >> aNightShiftForExperienced [
	<gtExample>
	| aShift |
	aShift := HMShift new.
	aShift
		startTime: '22:30';
		endTime: '07:45'.
	^ aShift
]

{ #category : #accessing }
HMShift >> aNightShiftForInexperienced [
	<gtExample>
	| aShift |
	aShift := HMShift new.
	aShift
		startTime: '20:00';
		endTime: '05:00'.
	^ aShift
]

{ #category : #accessing }
HMShift >> allShifts [
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
HMShift >> anEarlyLateShift [
	<gtExample>
	| aShift |
	aShift := HMShift new.
	aShift
		startTime: '14:30';
		endTime: '23:30'.
	^ aShift
]

{ #category : #accessing }
HMShift >> endTime: aTimestamp [
	endTime := aTimestamp
]

{ #category : #accessing }
HMShift >> startTime: aTimestamp [
	startTime := aTimestamp
]

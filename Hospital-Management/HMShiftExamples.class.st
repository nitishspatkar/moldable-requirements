Class {
	#name : #HMShiftExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

{ #category : #accessing }
HMShiftExamples >> aDayShift [
	<gtExample>
	| aShift staffMember |
	aShift := HMShift new.
	"staffMember := HMStaffMemberExamples new doctorAmir."
	aShift
		shiftCode: 'T';
		description: 'Tagesdienst';
		startTime: (Time hour: 7 minute: 30 second: 00);
		endTime: (Time hour: 16 minute: 30 second: 00);
		duration: 7.
	
	^ aShift
]

{ #category : #accessing }
HMShiftExamples >> aLateLateShift [
	<gtExample>
	| aShift |
	aShift := HMShift new.
	aShift
		shiftCode: 'S2';
		description: 'LateLate';
		startTime: (Time hour: 16 minute: 00 second: 00);
		endTime: (Time hour: 1 minute: 00 second: 00);
		duration: 9.
	^ aShift
]

{ #category : #accessing }
HMShiftExamples >> aMidDayShift [
	<gtExample>
	| aShift |
	aShift := HMShift new.
	aShift
		shiftCode: 'M';
		description: 'Mitteldienst';
		startTime: (Time hour: 12 minute: 30 second: 00);
		endTime: (Time hour: 20 minute: 30 second: 00);
		duration: 8.
	^ aShift
]

{ #category : #accessing }
HMShiftExamples >> aNightShift [
	<gtExample>
	| aShift staffMember |
	aShift := HMShift new.
	"staffMember := HMStaffMemberExamples new doctorAmir."
	aShift
		shiftCode: 'N';
		description: 'Nachtdienst';
		startTime: (Time hour: 22 minute: 00 second: 00);
		endTime: (Time hour: 05 minute: 00 second: 00);
		duration: 7.
	^ aShift
]

{ #category : #accessing }
HMShiftExamples >> aNightShiftForExperienced [
	<gtExample>
	| aShift |
	aShift := HMShift new.
	aShift
		shiftCode: 'E-N';
		description: 'E-Nachtdienst';
		startTime: (Time hour: 22 minute: 30 second: 00);
		endTime: (Time hour: 7 minute: 45 second: 00);
		duration: 9.15.
	^ aShift
]

{ #category : #accessing }
HMShiftExamples >> aNightShiftForInexperienced [
	<gtExample>
	| aShift |
	aShift := HMShift new.
	aShift
		shiftCode: 'I-N';
		description: 'I-Nachtdienst';
		startTime: (Time hour: 20 minute: 00 second: 00);
		endTime: (Time hour: 5 minute: 00 second: 00);
		duration: 9.
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
		shiftCode: 'S1';
		description: 'EarlyLate';
		startTime: (Time hour: 14 minute: 30 second: 00);
		endTime: (Time hour: 23 minute: 30 second: 00);
		duration: 9.
	^ aShift
]

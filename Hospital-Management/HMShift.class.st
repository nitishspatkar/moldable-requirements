Class {
	#name : #HMShift,
	#superclass : #Object,
	#instVars : [
		'endTime',
		'startTime',
		'staff',
		'description',
		'shiftCode',
		'duration',
		'constraints',
		'day'
	],
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMShift >> addStaffMember: aStaffMember [
	self staff add: aStaffMember
]

{ #category : #accessing }
HMShift >> assignedDoctors [
	^ self staff select: [ :aStafMember | aStafMember isDoctor ]
]

{ #category : #accessing }
HMShift >> assignedNurses [
	^ self staff select: [ :aStaffMember | aStaffMember isDoctor not ]
]

{ #category : #accessing }
HMShift >> day [
	^ day
]

{ #category : #accessing }
HMShift >> day: aDay [
	day := aDay
]

{ #category : #accessing }
HMShift >> description [
	^ String streamContents: [ :aStream |
		aStream
			nextPutAll: (self shiftCode ifNil: [ '<>' ]);
			nextPutAll: ', ';
			nextPutAll: self startTime asString;
			nextPutAll: ' - ';
			nextPutAll: self endTime asString ]
]

{ #category : #accessing }
HMShift >> description: aString [
	description := aString
]

{ #category : #accessing }
HMShift >> duration [
	^ duration
]

{ #category : #accessing }
HMShift >> duration: aNumber [
	duration := aNumber
]

{ #category : #accessing }
HMShift >> endTime [
	^ endTime
]

{ #category : #accessing }
HMShift >> endTime: aTimestamp [
	endTime := aTimestamp
]

{ #category : #accessing }
HMShift >> gtDoctorsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Assigned Doctors';
		items: [ self assignedDoctors ];
		column: 'Name' text: [ :aStafMember | aStafMember fullName ];
		column: 'Is experienced' text: [ :aStafMember  | 
			aStafMember isExperienced
				ifTrue: [ 'Yes' ]
				ifFalse: [ 'No' ] ]
]

{ #category : #initialize }
HMShift >> initialize [
	super initialize.
	staff := OrderedCollection new
]

{ #category : #accessing }
HMShift >> isDayShift [
	^ self isNightShift not
]

{ #category : #tesing }
HMShift >> isNightShift [
	^ self shiftCode = 'E-N' or: [ 
		self shiftCode = 'I-N' or: [
			self shiftCode = 'N'] ]
]

{ #category : #accessing }
HMShift >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: ' (';
		nextPutAll: self day asString;
		nextPutAll: ', ';
		nextPutAll: (self shiftCode ifNil: [ '<>' ]);
		nextPutAll: ', ';
		nextPutAll: self startTime asString;
		nextPutAll: ' - ';
		nextPutAll: self endTime asString;
		nextPutAll: ')'
]

{ #category : #accessing }
HMShift >> shiftCode [
	^ shiftCode
]

{ #category : #accessing }
HMShift >> shiftCode: aString [
	shiftCode := aString
]

{ #category : #accessing }
HMShift >> staff [
	^ staff
]

{ #category : #accessing }
HMShift >> staff: aMember [
	staff add: aMember
]

{ #category : #accessing }
HMShift >> startTime [
	^ startTime
]

{ #category : #accessing }
HMShift >> startTime: aTimestamp [
	startTime := aTimestamp
]

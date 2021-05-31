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
HMShift >> day [
	^ day
]

{ #category : #accessing }
HMShift >> day: aDay [
	day := aDay
]

{ #category : #accessing }
HMShift >> description [
	^ description
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
HMShift >> gtAssignedStaffMemberFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Assigned doctor';
		priority: 1;
		items: [ {('First Name' -> staff first firstName).
			('Last Name' -> staff first lastName)} ];
		column: 'Attribute' item: #key;
		column: 'Value' item: #value
]

{ #category : #initialize }
HMShift >> initialize [
	super initialize.
	staff := OrderedCollection new
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

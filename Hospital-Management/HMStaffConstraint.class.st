Class {
	#name : #HMStaffConstraint,
	#superclass : #Object,
	#instVars : [
		'date',
		'type'
	],
	#category : 'Hospital-Management-Model'
}

{ #category : #accessing }
HMStaffConstraint >> date [
	^ date
]

{ #category : #accessing }
HMStaffConstraint >> date: aDate [
	date := aDate
]

{ #category : #accessing }
HMStaffConstraint >> gtConstraintFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Constraint';
		priority: 1;
		items: [ {('Date' -> self date).
			('Description' -> self type description)} ];
		column: 'Date' item: #key;
		column: 'Description' item: #value;
		send: #value
]

{ #category : #accessing }
HMStaffConstraint >> initialize [
	super initialize
]

{ #category : #testing }
HMStaffConstraint >> isForDate: aDate [
	^ self date = aDate
]

{ #category : #accessing }
HMStaffConstraint >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: ' (';
		nextPutAll: self date asString;
		nextPutAll: ' ';
		nextPutAll: self type description;
		nextPutAll: ' )'
]

{ #category : #accessing }
HMStaffConstraint >> type [
	^ type
]

{ #category : #accessing }
HMStaffConstraint >> type: aType [
	type := aType
]

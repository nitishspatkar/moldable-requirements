Class {
	#name : #HMNurse,
	#superclass : #HMStaffMember,
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMNurse >> isDoctor [
	^ false
]

{ #category : #printing }
HMNurse >> printOn: aStream [
	super printOn: aStream.
	aStream 
		nextPutAll: ' (';
		nextPutAll: self firstName;
		nextPutAll: ' ';
		nextPutAll: self lastName;
		nextPutAll: ', ';
		nextPutAll: self experienceInYears asString;
		nextPutAll: ' years experience)'
]

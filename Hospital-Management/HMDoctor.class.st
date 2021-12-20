Class {
	#name : #HMDoctor,
	#superclass : #HMStaffMember,
	#category : 'Hospital-Management-Model'
}

{ #category : #accessing }
HMDoctor >> isDoctor [
	^ true
]

{ #category : #accessing }
HMDoctor >> printOn: aStream [
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

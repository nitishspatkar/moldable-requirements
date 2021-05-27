Class {
	#name : #HMDoctor,
	#superclass : #HMStaffMember,
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMDoctor >> gtViewConstraintsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Constaints';
		items: [self constraints];
		column: 'Date' text: [ :each | each date ];
		column: 'Description' text: [ :each | each type description ]
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

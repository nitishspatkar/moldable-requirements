Class {
	#name : #HMDoctor,
	#superclass : #HMStaffMember,
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMDoctor >> tenRandomDoctors [
	<gtExample>
	^ (1 to: 10) asOrderedCollection collect: [ :each | HMDoctor new ]
]

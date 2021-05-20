"
I keep track of the records of the staff member, such as their requests for vacations or seminras.
"
Class {
	#name : #HMRegister,
	#superclass : #Object,
	#instVars : [
		'days'
	],
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMRegister >> days [
	^ days
]

{ #category : #accessing }
HMRegister >> days: aNumber [
	days := (1 to: aNumber) collect: [ :each | HMDay new ]
]

{ #category : #accessing }
HMRegister >> gtRegisterFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Records';
		priority: 1;
		items: [ self days ];
		column: 'Day' text: [ :aDay | aDay ];
		column: 'Records' text: [ :aDay | aDay recordOfWishes].
]

{ #category : #accessing }
HMRegister >> initialize [
	days := OrderedCollection new
]

{ #category : #accessing }
HMRegister >> withTypeOfDay: suchDays [
	days := suchDays
]

Class {
	#name : #HMSchedule,
	#superclass : #Object,
	#instVars : [
		'days',
		'description'
	],
	#category : 'Hospital-Management-Model'
}

{ #category : #accessing }
HMSchedule >> days [
	^ days
]

{ #category : #accessing }
HMSchedule >> days: aCollection [
	days := aCollection 
]

{ #category : #accessing }
HMSchedule >> gViewWorkingDaysFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Schedule';
		priority: 1;
		items: [ self days ];
		column: 'Index' text: [ :aDay | aDay date ].
]

{ #category : #accessing }
HMSchedule >> initialize [
	super initialize.
	days := OrderedCollection new
]

Class {
	#name : #HMSchedule,
	#superclass : #Object,
	#instVars : [
		'days',
		'startDate'
	],
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMSchedule >> days [
	^ days
]

{ #category : #accessing }
HMSchedule >> gtScheduleFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Schedule';
		priority: 1;
		items: [ days ];
		column: 'Index' text: [ :aDay | aDay date ].
]

{ #category : #accessing }
HMSchedule >> initialize [
	super initialize.
	days := OrderedCollection new
]

{ #category : #accessing }
HMSchedule >> startDate [
	^ startDate
]

{ #category : #accessing }
HMSchedule >> startDate: aDate [
	startDate := aDate
]

Class {
	#name : #HMSchedule,
	#superclass : #Object,
	#instVars : [
		'days'
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

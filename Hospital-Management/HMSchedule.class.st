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
HMSchedule >> days: aNumber [
	"return a number of specified days"

	days := (1 to: aNumber) collect: [ :each | HMWorkingDay new]
]

{ #category : #accessing }
HMSchedule >> gtDaysFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Days';
		priority: 1;
		items: [ days ];
		"actionUpdateButtonTooltip: 'Update item list';"
			column: 'Index'
			item:
				[ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Item' text: [ :eachItem | eachItem gtDisplayText ]
]

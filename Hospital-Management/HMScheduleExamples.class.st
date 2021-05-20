Class {
	#name : #HMScheduleExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

{ #category : #accessing }
HMScheduleExamples >> forOneDay [
	<gtExample>
	| aSchedule |
	aSchedule := HMSchedule new.
	aSchedule days: 1.
	^ aSchedule
]

{ #category : #accessing }
HMScheduleExamples >> forOneWeek [
	<gtExample>
	| aSchedule |
	aSchedule := HMSchedule new.
	aSchedule days: 7.
	^ aSchedule
]

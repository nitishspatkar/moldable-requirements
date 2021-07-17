Class {
	#name : #HMRegisterExamples,
	#superclass : #Object,
	#category : 'Hospital-Management-Examples'
}

{ #category : #accessing }
HMRegisterExamples >> aGolbalRegister [
	^ HMRegister new
]

{ #category : #accessing }
HMRegisterExamples >> aRegisterForOneDayWithWishes [
	<gtExample>
	| aRegister |
	aRegister := HMRegister new
		withTypeOfDay: HMDayExamples new aDayWithTwoWishes asOrderedCollection.
	^ aRegister
]

{ #category : #accessing }
HMRegisterExamples >> anEmptyRegister [
	<gtExample>
	^ HMRegister new
]

{ #category : #accessing }
HMRegisterExamples >> emptyRegisterForOneWeek [
	<gtExample>
	| aRegister |
	aRegister := HMRegister new days: 5.
	^ aRegister
]

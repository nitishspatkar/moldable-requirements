Class {
	#name : #HMStaffMemberExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

{ #category : #accessing }
HMStaffMemberExamples >> poolOfTenRandomDoctors [
	<gtExample>
	| poolOfDoctors doctors |
	doctors := {1 . 2 . 3 . 4 . 5 . 6 . 7 . 8 . 9 . 10}.
	^ poolOfDoctors := (1 to: 10)
		collect: [ :index | HMDoctor new experienceInYears: (doctors at: index) ]
]

{ #category : #accessing }
HMStaffMemberExamples >> twoExperiencedDoctors [
	<gtExample>
	| twoExperiencedDoctors doctors |
	doctors := {5 . 7}.
	^ twoExperiencedDoctors := (1 to: 2)
		collect: [ :index | HMDoctor new experienceInYears: (doctors at: index) ]
]

{ #category : #accessing }
HMStaffMemberExamples >> twoInexperiencedDoctors [
	<gtExample>
	| twoInexperiencedDoctors doctors |
	doctors := {1 . 3}.
	^ twoInexperiencedDoctors := (1 to: 2)
		collect: [ :index | HMDoctor new experienceInYears: (doctors at: index) ]
]

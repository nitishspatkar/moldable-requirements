Class {
	#name : #HMStaffMemberExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

{ #category : #accessing }
HMStaffMemberExamples >> poolOfTenRandomDoctors [
	<gtExample>
	| poolOfDoctors doctors |
	doctors := {1 . 2 . 5 . 5 . 7 . 6 . 7 . 8 . 8 . 2}.
	^ poolOfDoctors := (1 to: 10)
		collect: [ :index | HMDoctor new experienceInYears: (doctors at: index) ]
]

{ #category : #accessing }
HMStaffMemberExamples >> poolOfTenRandomNurses [
	<gtExample>
	| poolOfNurses nurses |
	nurses := {1 . 1 . 3 . 4 . 5 . 5 . 5 . 7 . 9 . 10}.
	^ poolOfNurses := (1 to: 10)
		collect: [ :index | HMNurse new experienceInYears: (nurses at: index) ]
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
HMStaffMemberExamples >> twoExperiencedNurses [
	<gtExample>
	| twoExperiencedNurses nurses |
	nurses := {5 . 7}.
	^ twoExperiencedNurses := (1 to: 2)
		collect: [ :index | HMNurse new experienceInYears: (nurses at: index) ]
]

{ #category : #accessing }
HMStaffMemberExamples >> twoInexperiencedDoctors [
	<gtExample>
	| twoInexperiencedDoctors doctors |
	doctors := {1 . 3}.
	^ twoInexperiencedDoctors := (1 to: 2)
		collect: [ :index | HMDoctor new experienceInYears: (doctors at: index) ]
]

{ #category : #accessing }
HMStaffMemberExamples >> twoInexperiencedNurses [
	<gtExample>
	| twoInexperiencedNurses nurses |
	nurses := {1 . 3}.
	^ twoInexperiencedNurses := (1 to: 2)
		collect: [ :index | HMNurse new experienceInYears: (nurses at: index) ]
]

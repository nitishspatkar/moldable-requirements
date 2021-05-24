Class {
	#name : #HMStaffMemberExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

{ #category : #accessing }
HMStaffMemberExamples >> experienceInYearsForDoctors [
	<gtExample>
	| experienceInYears |
	experienceInYears := {1 . 2 . 5 . 5 . 7 . 6 . 7 . 8 . 8 . 2}.
	^ experienceInYears
]

{ #category : #accessing }
HMStaffMemberExamples >> experienceInYearsForNurses [
	<gtExample>
	| experienceInYears |
	experienceInYears := {1 . 1 . 3 . 4 . 5 . 5 . 5 . 7 . 9 . 10}.
	^ experienceInYears
]

{ #category : #accessing }
HMStaffMemberExamples >> firstNamesForDoctors [
	<gtExample>
	| firstNames |
	firstNames := {'Simone' . 'Isabel' . 'Amir' . 'Shane' . 'Laura' . 'Iris'.
	'Katharina' . 'Alexandra' . 'Baptist' . 'Tobias'}.
	^ firstNames
]

{ #category : #accessing }
HMStaffMemberExamples >> firstNamesForNurses [
	<gtExample>
	| firstNames |
	firstNames := {'Carina' . 'Theresa' . 'Imane' . 'Marie' . 'Manuel' . 'John'.
	'Peter' . 'Daniel' . 'Malik' . 'Luis'}.
	^ firstNames
]

{ #category : #accessing }
HMStaffMemberExamples >> lastNamesForDoctors [
	<gtExample>
	| lastNames |
	lastNames := {'Steiger' . 'Botros' . 'Sami' . 'Meuller' . 'Silva'.
	'Murphy' . 'Hansen' . 'Smith' . 'Sieren' . 'Gruber'}.
	^ lastNames
]

{ #category : #accessing }
HMStaffMemberExamples >> lastNamesForNurses [
	<gtExample>
	| lastNames |
	lastNames := {'Bauer' . 'Steiner' . 'Fuchs' . 'Cooper' . 'Petersen'.
	'Thompsen' . 'Kask' . 'Petrov' . 'Lielsen' . 'Nymann'}.
	^ lastNames
]

{ #category : #accessing }
HMStaffMemberExamples >> poolOfTenRandomDoctors [
	<gtExample>
	| poolOfDoctors |
	^ poolOfDoctors := (1 to: 10)
		collect: [ :index | 
			HMDoctor new
				experienceInYears: (self experienceInYearsForDoctors at: index);
				firstName: (self firstNamesForDoctors at: index);
				lastName: (self lastNamesForDoctors at: index) ]
]

{ #category : #accessing }
HMStaffMemberExamples >> poolOfTenRandomNurses [
	<gtExample>
	| poolOfNurses |
	^ poolOfNurses := (1 to: 10)
		collect: [ :index | 
			HMNurse new
				experienceInYears: (self experienceInYearsForNurses at: index);
				firstName: (self firstNamesForNurses at: index);
				lastName: (self lastNamesForNurses at: index) ]
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

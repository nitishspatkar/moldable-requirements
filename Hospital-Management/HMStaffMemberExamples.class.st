Class {
	#name : #HMStaffMemberExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

{ #category : #accessing }
HMStaffMemberExamples >> balanceWorkingHoursForDoctors [
	<gtExample>
	| remainingWorkingHours |
	remainingWorkingHours := {50 . 50 . 50 . 50 . 50 . 50 . 50 . 50 . 50.
	50 . 50 . 50}.
	^ remainingWorkingHours
]

{ #category : #accessing }
HMStaffMemberExamples >> balanceWorkingHoursForNurses [
	<gtExample>
	| remainingWorkingHours |
	remainingWorkingHours := {50 . 50 . 50 . 50 . 50 . 50 . 50 . 50 . 50.
	50 . 50 . 50}.
	^ remainingWorkingHours
]

{ #category : #accessing }
HMStaffMemberExamples >> compensationHoursForDoctors [
	<gtExample>
	| compensationHours |
	compensationHours := {2.7 . 2.7 . 1.8 . 3.6 . 3.6 . 4.5 . 4.5 . 5.4.
	1.8 . 4.5 . 1.8 . 3.6}.
	^ compensationHours
]

{ #category : #accessing }
HMStaffMemberExamples >> compensationHoursForNurses [
	<gtExample>
	| compensationHours |
	compensationHours := {2.7 . 2.7 . 1.8 . 3.6 . 3.6 . 4.5 . 4.5 . 5.4.
	1.8 . 4.5 . 1.8 . 3.6}.
	^ compensationHours
]

{ #category : #accessing }
HMStaffMemberExamples >> experienceInYearsForDoctors [
	<gtExample>
	| experienceInYears |
	experienceInYears := {1 . 2 . 5 . 5 . 3 . 6 . 4 . 8 . 8 . 2 . 6 . 3}.
	^ experienceInYears
]

{ #category : #accessing }
HMStaffMemberExamples >> experienceInYearsForNurses [
	<gtExample>
	| experienceInYears |
	experienceInYears := {1 . 1 . 3 . 4 . 5 . 5 . 5 . 7 . 9 . 2 . 6 . 3}.
	^ experienceInYears
]

{ #category : #accessing }
HMStaffMemberExamples >> firstNamesForDoctors [
	<gtExample>
	| firstNames |
	firstNames := {'Simone' . 'Isabel' . 'Amir' . 'Shane' . 'Laura' . 'Iris'.
	'Katharina' . 'Alexandra' . 'Baptist' . 'Tobias' . 'Sabine' . 'Marta'}.
	^ firstNames
]

{ #category : #accessing }
HMStaffMemberExamples >> firstNamesForNurses [
	<gtExample>
	| firstNames |
	firstNames := {'Carina' . 'Theresa' . 'Imane' . 'Marie' . 'Manuel'.
	'John' . 'Peter' . 'Daniel' . 'Malik' . 'Luis' . 'Jane' . 'Raj'}.
	^ firstNames
]

{ #category : #accessing }
HMStaffMemberExamples >> lastNamesForDoctors [
	<gtExample>
	| lastNames |
	lastNames := {'Steiger' . 'Botros' . 'Sami' . 'Meuller' . 'Silva'.
	'Murphy' . 'Hansen' . 'Smith' . 'Sieren' . 'Gruber' . 'Litto' . 'Thomas'}.
	^ lastNames
]

{ #category : #accessing }
HMStaffMemberExamples >> lastNamesForNurses [
	<gtExample>
	| lastNames |
	lastNames := {'Bauer' . 'Steiner' . 'Fuchs' . 'Cooper' . 'Petersen'.
	'Thompsen' . 'Kask' . 'Petrov' . 'Lielsen' . 'Nymann'. 'Goldsmith'. 'Kaur'}.
	^ lastNames
]

{ #category : #accessing }
HMStaffMemberExamples >> poolOfTwelveRandomDoctors [
	<gtExample>
	| poolOfDoctors |
	^ poolOfDoctors := (1 to: 12)
		collect: [ :index | 
			HMDoctor new
				experienceInYears: (self experienceInYearsForDoctors at: index);
				firstName: (self firstNamesForDoctors at: index);
				lastName: (self lastNamesForDoctors at: index);
				balanceWorkingHours: (self balanceWorkingHoursForDoctors at: index);
				compensationHours: (self compensationHoursForDoctors at: index) ]
]

{ #category : #accessing }
HMStaffMemberExamples >> poolOfTwelveRandomNurses [
	<gtExample>
	| poolOfNurses |
	^ poolOfNurses := (1 to: 12)
		collect: [ :index | 
			HMNurse new
				experienceInYears: (self experienceInYearsForNurses at: index);
				firstName: (self firstNamesForNurses at: index);
				lastName: (self lastNamesForNurses at: index);
				balanceWorkingHours: (self balanceWorkingHoursForNurses at: index);
				compensationHours: (self compensationHoursForNurses at: index) ]
]

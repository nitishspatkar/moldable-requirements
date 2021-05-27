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
	50}.
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
	1.8 . 4.5}.
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
HMStaffMemberExamples >> doctorWithSeminarConstraint [
	<gtExample>
	| aDoctor seminarConstraint |
	aDoctor := HMDoctor new.
	seminarConstraint := HMStaffConstraintTypeExamples new seminarConstraint.
	seminarConstraint date: (Date year: 2021 month: 5 day: 1).
	aDoctor
		firstName: 'Alexandra';
		lastName: 'Meier';
		experienceInYears: 17;
		balanceWorkingHours: 50;
		compensationHours: 2.7.
	aDoctor constraints removeFirst.
	aDoctor constraints add: seminarConstraint.
	^ aDoctor
]

{ #category : #accessing }
HMStaffMemberExamples >> doctorWithVacationConstraint [
	<gtExample>
	| aDoctor vacationConstraint |
	aDoctor := HMDoctor new.
	vacationConstraint := HMStaffConstraintTypeExamples new
		vacationConstraint.
	vacationConstraint date: (Date year: 2021 month: 5 day: 1).
	aDoctor
		firstName: 'Amir';
		lastName: 'Steiger';
		experienceInYears: 17;
		balanceWorkingHours: 50;
		compensationHours: 2.7.
	aDoctor constraints removeFirst.
	aDoctor constraints add: vacationConstraint.
	^ aDoctor
]

{ #category : #accessing }
HMStaffMemberExamples >> doctorWithWeddingConstraint [
	<gtExample>
	| aDoctor weddingConstraint |
	aDoctor := HMDoctor new.
	weddingConstraint := HMStaffConstraintTypeExamples new
		customWeddingConstraint.
	weddingConstraint date: (Date year: 2021 month: 5 day: 1).
	aDoctor
		firstName: 'Shane';
		lastName: 'Bottros';
		experienceInYears: 7;
		balanceWorkingHours: 50;
		compensationHours: 2.7.
	aDoctor constraints removeFirst.
	aDoctor constraints add: weddingConstraint.
	^ aDoctor
]

{ #category : #accessing }
HMStaffMemberExamples >> doctorWithoutConstraintAndEnoughWorkingHours [
	<gtExample>
	| aDoctor |
	aDoctor := HMDoctor new.
	aDoctor
		firstName: 'Sanjeet';
		lastName: 'Pal';
		experienceInYears: 3;
		balanceWorkingHours: 50;
		compensationHours: 2.7.
	^ aDoctor
]

{ #category : #accessing }
HMStaffMemberExamples >> doctorWithoutConstraintAndWithoutEnoughWorkingHours [
	<gtExample>
	| aDoctor |
	aDoctor := HMDoctor new.
	aDoctor
		firstName: 'Isabel';
		lastName: 'Murphy';
		experienceInYears: 5;
		balanceWorkingHours: 7;
		compensationHours: 2.7.
	^ aDoctor
]

{ #category : #accessing }
HMStaffMemberExamples >> experienceInYearsForDoctors [
	<gtExample>
	| experienceInYears |
	experienceInYears := {17 . 7 . 6 . 6 . 5 . 5 . 1 . 2 . 3 . 2}.
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
	firstNames := {'Amir' . 'Shane' . 'Iris' . 'Alexandra' . 'Baptist'.
	'Sanjeet' . 'Simone' . 'Laura' . 'Katharina' . 'Tobias'}.
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
	'Murphy' . 'Hansen' . 'Smith' . 'Sieren' . 'Gruber'}.
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
HMStaffMemberExamples >> poolOfTenRandomDoctors [
	<gtExample>
	| poolOfDoctors |
	^ poolOfDoctors := (1 to: 10)
		collect: [ :index | 
			HMDoctor new
				experienceInYears: (self experienceInYearsForDoctors at: index);
				firstName: (self firstNamesForDoctors at: index);
				lastName: (self lastNamesForDoctors at: index);
				balanceWorkingHours: (self balanceWorkingHoursForDoctors at: index);
				compensationHours: (self compensationHoursForDoctors at: index) ]
]

{ #category : #accessing }
HMStaffMemberExamples >> poolOfThreeExperiencedDoctors [
	<gtExample>
	| poolOfDoctors |
	^ poolOfDoctors := (1 to: 3)
		collect: [ :index | 
			HMDoctor new
				experienceInYears: 7;
				firstName: 'Random First Name';
				lastName: 'Random Last Name';
				balanceWorkingHours: (self balanceWorkingHoursForDoctors at: index);
				compensationHours: (self compensationHoursForDoctors at: index) ]
]

{ #category : #accessing }
HMStaffMemberExamples >> poolOfThreeInExperiencedDoctors [
	<gtExample>
	| poolOfDoctors |
	^ poolOfDoctors := (1 to: 3)
		collect: [ :index | 
			HMDoctor new
				experienceInYears: 3;
				firstName: 'Random First Name';
				lastName: 'Random Last Name';
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

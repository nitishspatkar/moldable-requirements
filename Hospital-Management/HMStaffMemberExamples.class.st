Class {
	#name : 'HMStaffMemberExamples',
	#superclass : 'Object',
	#category : 'Hospital-Management-Examples'
}

{ #category : 'accessing' }
HMStaffMemberExamples >> allDoctors [
	<gtExample>
	| allDoctors |
	allDoctors := OrderedCollection new.
	allDoctors
		add: HMStaffMemberExamples new doctorAamirSteiger;
		add: HMStaffMemberExamples new doctorAlexandraMeier;
		add: HMStaffMemberExamples new doctorAnnaBauer;
		add: HMStaffMemberExamples new doctorBaptistCosta;
		add: HMStaffMemberExamples new doctorChristianMonde;
		add: HMStaffMemberExamples new doctorIsabelMurphy;
		add: HMStaffMemberExamples new doctorKatharinaSieren;
		add: HMStaffMemberExamples new doctorSanjeetKaur;
		add: HMStaffMemberExamples new doctorShaneMeuller;
		add: HMStaffMemberExamples new doctorThomasSilva;
		add: HMStaffMemberExamples new doctorManuelaLitto.
	^ allDoctors
]

{ #category : 'accessing' }
HMStaffMemberExamples >> allDoctorsWithConstraints [
	<gtExample>
	| allDoctors |
	allDoctors := OrderedCollection new.
	allDoctors
		add:
			HMStaffMemberExamples new
				doctorAmirSteigerWithAvailableWorkingHoursConstraint;
		add: HMStaffMemberExamples new doctorAlexandaMeierWithSeminarConstraint;
		add: HMStaffMemberExamples new doctorAnnaBauerWithVacationConstraint;
		add: HMStaffMemberExamples new doctorBaptistCosta;
		add: HMStaffMemberExamples new doctorChristianMondeWithSeminarConstraint;
		add: HMStaffMemberExamples new doctorIsabelMurphy;
		add: HMStaffMemberExamples new doctorKatharinaSieren;
		add: HMStaffMemberExamples new doctorSanjeetKaurWithWeddingConstraint;
		add: HMStaffMemberExamples new doctorShaneMeullerWithVacationConstraint;
		add: HMStaffMemberExamples new doctorThomasSilva;
		add: HMStaffMemberExamples new doctorManuelaLitto.
	^ allDoctors
]

{ #category : 'accessing' }
HMStaffMemberExamples >> allNurses [
	<gtExample>
	| allNurses |
	allNurses := OrderedCollection new.
	allNurses
		add: HMStaffMemberExamples new nurseManuelThompson;
		add: HMStaffMemberExamples new nurseLuciFuchs;
		add: HMStaffMemberExamples new nursePatrickSchneider;
		add: HMStaffMemberExamples new nurseChristopherFisher;
		add: HMStaffMemberExamples new nurseKajanSchmidt;
		add: HMStaffMemberExamples new nurseKarinEgger;
		add: HMStaffMemberExamples new nurseHermannLang;
		add: HMStaffMemberExamples new nurseMalikSahni;
		add: HMStaffMemberExamples new nurseIbrahimLodhi;
		add: HMStaffMemberExamples new nurseRajKapoor;
		add: HMStaffMemberExamples new nurseSabineJakob.
	^ allNurses
]

{ #category : 'accessing' }
HMStaffMemberExamples >> allNursesWithConstraints [
	<gtExample>
	| allNurses |
	allNurses := OrderedCollection new.
	allNurses
		add: HMStaffMemberExamples new nurseManuelThompson;
		add: HMStaffMemberExamples new nurseLuciFuchsWithSeminarConstraint;
		add: HMStaffMemberExamples new nursePatrickSchneiderWithVacationConstraint;
		add: HMStaffMemberExamples new nurseChristopherFisher;
		add: HMStaffMemberExamples new nurseKajanSchmidtWithSeminarConstraint;
		add:
			HMStaffMemberExamples new
				nurseKarinEggerWithAvailableWorkingHoursConstraint;
		add: HMStaffMemberExamples new nurseHermannLang;
		add: HMStaffMemberExamples new nurseMalikSahniWithVacationConstraint;
		add: HMStaffMemberExamples new nurseIbrahimLodhiWithVacationConstraint;
		add: HMStaffMemberExamples new nurseRajKapoor;
		add: HMStaffMemberExamples new nurseSabineJakob.
	^ allNurses
]

{ #category : 'doctors basic' }
HMStaffMemberExamples >> doctorAamirSteiger [
	<gtExample>
	| aDoctor |
	aDoctor := HMDoctor new.
	aDoctor
		firstName: 'Amir';
		lastName: 'Steiger';
		experienceInYears: 17;
		balanceWorkingHours: 50;
		compensationHours: 1.8.
	^ aDoctor
]

{ #category : 'doctors with constraints' }
HMStaffMemberExamples >> doctorAlexandaMeierWithSeminarConstraint [
	<gtExample>
	| aDoctor seminarConstraint |
	aDoctor := self doctorAlexandraMeier.
	seminarConstraint := HMStaffConstraintTypeExamples new
		seminarConstraint.
	seminarConstraint date: (Date year: 2021 month: 5 day: 1).
	aDoctor constraints add: seminarConstraint.
	^ aDoctor
]

{ #category : 'doctors basic' }
HMStaffMemberExamples >> doctorAlexandraMeier [
	<gtExample>
	| aDoctor |
	aDoctor := HMDoctor new.
	aDoctor
		firstName: 'Alexandra';
		lastName: 'Meier';
		experienceInYears: 12;
		balanceWorkingHours: 41;
		compensationHours: 2.7.
	^ aDoctor
]

{ #category : 'doctors with constraints' }
HMStaffMemberExamples >> doctorAmirSteigerWithAvailableWorkingHoursConstraint [
	<gtExample>
	| aDoctor availableWorkingHoursConstraint |
	aDoctor := self doctorAamirSteiger.
	aDoctor balanceWorkingHours: 7.
	^ aDoctor
]

{ #category : 'doctors basic' }
HMStaffMemberExamples >> doctorAnnaBauer [
	<gtExample>
	| aDoctor |
	aDoctor := HMDoctor new.
	aDoctor
		firstName: 'Anna';
		lastName: 'Bauer';
		experienceInYears: 5;
		balanceWorkingHours: 50;
		compensationHours: 1.8.
	^ aDoctor
]

{ #category : 'doctors with constraints' }
HMStaffMemberExamples >> doctorAnnaBauerWithVacationConstraint [
	<gtExample>
	| aDoctor vacationConstraint |
	aDoctor := self doctorAnnaBauer.
	vacationConstraint := HMStaffConstraintTypeExamples new
		vacationConstraint.
	vacationConstraint date: (Date year: 2021 month: 5 day: 4).
	aDoctor constraints add: vacationConstraint.
	^ aDoctor
]

{ #category : 'doctors basic' }
HMStaffMemberExamples >> doctorBaptistCosta [
	<gtExample>
	| aDoctor |
	aDoctor := HMDoctor new.
	aDoctor
		firstName: 'Baptist';
		lastName: 'Costa';
		experienceInYears: 3;
		balanceWorkingHours: 50;
		compensationHours: 1.8.
	^ aDoctor
]

{ #category : 'doctors basic' }
HMStaffMemberExamples >> doctorChristianMonde [
	<gtExample>
	| aDoctor |
	aDoctor := HMDoctor new.
	aDoctor
		firstName: 'Christian';
		lastName: 'Monde';
		experienceInYears: 12;
		balanceWorkingHours: 10;
		compensationHours: 1.8.
	^ aDoctor
]

{ #category : 'doctors with constraints' }
HMStaffMemberExamples >> doctorChristianMondeWithSeminarConstraint [
	<gtExample>
	| aDoctor seminarConstraint |
	aDoctor := self doctorChristianMonde.
	seminarConstraint := HMStaffConstraintTypeExamples new
		seminarConstraint.
	seminarConstraint date: (Date year: 2021 month: 5 day: 7).
	aDoctor constraints add: seminarConstraint.
	^ aDoctor
]

{ #category : 'doctors basic' }
HMStaffMemberExamples >> doctorIsabelMurphy [
	<gtExample>
	| aDoctor |
	aDoctor := HMDoctor new.
	aDoctor
		firstName: 'Isabel';
		lastName: 'Murphy';
		experienceInYears: 8;
		balanceWorkingHours: 34;
		compensationHours: 2.7.
	^ aDoctor
]

{ #category : 'doctors basic' }
HMStaffMemberExamples >> doctorKatharinaSieren [
	<gtExample>
	| aDoctor |
	aDoctor := HMDoctor new.
	aDoctor
		firstName: 'Katharina';
		lastName: 'Sieren';
		experienceInYears: 4;
		balanceWorkingHours: 44;
		compensationHours: 2.7.
	^ aDoctor
]

{ #category : 'doctors basic' }
HMStaffMemberExamples >> doctorManuelaLitto [
	<gtExample>
	| aDoctor |
	aDoctor := HMDoctor new.
	aDoctor
		firstName: 'Manuela';
		lastName: 'Litto';
		experienceInYears: 14;
		balanceWorkingHours: 50;
		compensationHours: 1.8.
	^ aDoctor
]

{ #category : 'doctors basic' }
HMStaffMemberExamples >> doctorSanjeetKaur [
	<gtExample>
	| aDoctor  |
	aDoctor := HMDoctor new.
	aDoctor
		firstName: 'Sanjeet';
		lastName: 'Kaur';
		experienceInYears: 3;
		balanceWorkingHours: 37;
		compensationHours: 2.7.
	^ aDoctor
]

{ #category : 'doctors with constraints' }
HMStaffMemberExamples >> doctorSanjeetKaurWithWeddingConstraint [
	<gtExample>
	| aDoctor weddingConstraint |
	aDoctor := self doctorSanjeetKaur.
	weddingConstraint := HMStaffConstraintTypeExamples new
		customWeddingConstraint.
	weddingConstraint date: (Date year: 2021 month: 5 day: 1).
	aDoctor constraints add: weddingConstraint.
	^ aDoctor
]

{ #category : 'doctors basic' }
HMStaffMemberExamples >> doctorShaneMeuller [
	<gtExample>
	| aDoctor |
	aDoctor := HMDoctor new.
	aDoctor
		firstName: 'Shane';
		lastName: 'Meuller';
		experienceInYears: 4;
		balanceWorkingHours: 24;
		compensationHours: 3.6.
	^ aDoctor
]

{ #category : 'doctors with constraints' }
HMStaffMemberExamples >> doctorShaneMeullerWithVacationConstraint [
	<gtExample>
	| aDoctor vacationConstraint |
	aDoctor := self doctorShaneMeuller.
	vacationConstraint := HMStaffConstraintTypeExamples new
		vacationConstraint.
	vacationConstraint date: (Date year: 2021 month: 5 day: 2).
	aDoctor constraints add: vacationConstraint.
	^ aDoctor
]

{ #category : 'doctors basic' }
HMStaffMemberExamples >> doctorThomasSilva [
	<gtExample>
	| aDoctor |
	aDoctor := HMDoctor new.
	aDoctor
		firstName: 'Thomas';
		lastName: 'Silva';
		experienceInYears: 1;
		balanceWorkingHours: 50;
		compensationHours: 0.9.
	^ aDoctor
]

{ #category : 'nurse basic' }
HMStaffMemberExamples >> nurseChristopherFisher [
	<gtExample>
	| aNurse |
	aNurse := HMNurse new.
	aNurse
		firstName: 'Christopher';
		lastName: 'Fisher';
		experienceInYears: 3;
		balanceWorkingHours: 50;
		compensationHours: 1.8.
	^ aNurse
]

{ #category : 'nurse basic' }
HMStaffMemberExamples >> nurseHermannLang [
	<gtExample>
	| aNurse |
	aNurse := HMNurse new.
	aNurse
		firstName: 'Hermann';
		lastName: 'Lang';
		experienceInYears: 4;
		balanceWorkingHours: 44;
		compensationHours: 1.8.
	^ aNurse
]

{ #category : 'nurse basic' }
HMStaffMemberExamples >> nurseIbrahimLodhi [
	<gtExample>
	| aNurse |
	aNurse := HMNurse new.
	aNurse
		firstName: 'Ibrahim';
		lastName: 'Lodhi';
		experienceInYears: 4;
		balanceWorkingHours: 24;
		compensationHours: 1.8.
	^ aNurse
]

{ #category : 'nurse with constraints' }
HMStaffMemberExamples >> nurseIbrahimLodhiWithVacationConstraint [
	<gtExample>
	| aNurse vacationConstraint |
	aNurse := self nurseIbrahimLodhi.
	vacationConstraint := HMStaffConstraintTypeExamples new
		vacationConstraint.
	vacationConstraint date: (Date year: 2021 month: 5 day: 5).
	aNurse constraints add: vacationConstraint.
	^ aNurse
]

{ #category : 'nurse basic' }
HMStaffMemberExamples >> nurseKajanSchmidt [
	<gtExample>
	| aNurse |
	aNurse := HMNurse new.
	aNurse
		firstName: 'Kajan';
		lastName: 'Schmidt';
		experienceInYears: 12;
		balanceWorkingHours: 10;
		compensationHours: 1.8.
	^ aNurse
]

{ #category : 'nurse with constraints' }
HMStaffMemberExamples >> nurseKajanSchmidtWithSeminarConstraint [
	<gtExample>
	| aNurse seminarConstraint |
	aNurse := self nurseKajanSchmidt.
	seminarConstraint := HMStaffConstraintTypeExamples new
		seminarConstraint.
	seminarConstraint date: (Date year: 2021 month: 5 day: 7).
	aNurse constraints add: seminarConstraint.
	^ aNurse
]

{ #category : 'nurse basic' }
HMStaffMemberExamples >> nurseKarinEgger [
	<gtExample>
	| aNurse |
	aNurse := HMNurse new.
	aNurse
		firstName: 'Karin';
		lastName: 'Egger';
		experienceInYears: 8;
		balanceWorkingHours: 6;
		compensationHours: 1.8.
	^ aNurse
]

{ #category : 'nurse with constraints' }
HMStaffMemberExamples >> nurseKarinEggerWithAvailableWorkingHoursConstraint [
	<gtExample>
	| aNurse availableWorkingHoursConstraint |
	aNurse := self nurseKarinEgger.
	aNurse balanceWorkingHours: 6.
	^ aNurse
]

{ #category : 'nurse basic' }
HMStaffMemberExamples >> nurseLuciFuchs [
	<gtExample>
	| aNurse |
	aNurse := HMNurse new.
	aNurse
		firstName: 'Luci';
		lastName: 'Fuchs';
		experienceInYears: 6;
		balanceWorkingHours: 50;
		compensationHours: 1.8.
	^ aNurse
]

{ #category : 'nurse with constraints' }
HMStaffMemberExamples >> nurseLuciFuchsWithSeminarConstraint [
	<gtExample>
	| aNurse seminarConstraint |
	aNurse := self nurseLuciFuchs.
	seminarConstraint := HMStaffConstraintTypeExamples new
		seminarConstraint.
	seminarConstraint date: (Date year: 2021 month: 5 day: 2).
	aNurse constraints add: seminarConstraint.
	^ aNurse
]

{ #category : 'nurse basic' }
HMStaffMemberExamples >> nurseMalikSahni [
	<gtExample>
	| aNurse |
	aNurse := HMNurse new.
	aNurse
		firstName: 'Malik';
		lastName: 'Sahni';
		experienceInYears: 3;
		balanceWorkingHours: 37;
		compensationHours: 1.8.
	^ aNurse
]

{ #category : 'nurse with constraints' }
HMStaffMemberExamples >> nurseMalikSahniWithVacationConstraint [
	<gtExample>
	| aNurse vacationConstraint |
	aNurse := self nurseMalikSahni.
	vacationConstraint := HMStaffConstraintTypeExamples new
		vacationConstraint.
	vacationConstraint date: (Date year: 2021 month: 5 day: 1).
	aNurse constraints add: vacationConstraint.
	^ aNurse
]

{ #category : 'nurse basic' }
HMStaffMemberExamples >> nurseManuelThompson [
	<gtExample>
	| aNurse |
	aNurse := HMNurse new.
	aNurse
		firstName: 'Manuel';
		lastName: 'Thompson';
		experienceInYears: 5;
		balanceWorkingHours: 50;
		compensationHours: 1.8.
	^ aNurse
]

{ #category : 'nurse basic' }
HMStaffMemberExamples >> nursePatrickSchneider [
	<gtExample>
	| aNurse |
	aNurse := HMNurse new.
	aNurse
		firstName: 'Patrick';
		lastName: 'Schneider';
		experienceInYears: 7;
		balanceWorkingHours: 50;
		compensationHours: 1.8.
	^ aNurse
]

{ #category : 'nurse with constraints' }
HMStaffMemberExamples >> nursePatrickSchneiderWithVacationConstraint [
	<gtExample>
	| aNurse vacationConstraint |
	aNurse := self nursePatrickSchneider.
	10 to: 14 do: [ :index | 
		vacationConstraint := HMStaffConstraintTypeExamples new
			vacationConstraint.
		vacationConstraint date: (Date year: 2021 month: 5 day: index).
		aNurse constraints add: vacationConstraint ].
	^ aNurse
]

{ #category : 'nurse basic' }
HMStaffMemberExamples >> nurseRajKapoor [
	<gtExample>
	| aNurse |
	aNurse := HMNurse new.
	aNurse
		firstName: 'Raj';
		lastName: 'Kapoor';
		experienceInYears: 1;
		balanceWorkingHours: 50;
		compensationHours: 1.8.
	^ aNurse
]

{ #category : 'nurse basic' }
HMStaffMemberExamples >> nurseSabineJakob [
	<gtExample>
	| aNurse |
	aNurse := HMNurse new.
	aNurse
		firstName: 'Sabine';
		lastName: 'Jakob';
		experienceInYears: 8;
		balanceWorkingHours: 42;
		compensationHours: 1.8.
	^ aNurse
]

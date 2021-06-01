Class {
	#name : #HMScheduleAssigner,
	#superclass : #Object,
	#instVars : [
		'doctors',
		'workingDays',
		'nurses'
	],
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMScheduleAssigner >> assignDoctorsToWorkingDay: aWorkingDay [ 
	| availableDoctors |
	availableDoctors := self availableDoctorsForDay: aWorkingDay.
	
	aWorkingDay nightShift do: [ :aShift |
		aShift 
			addStaffMember: (self extractDoctorFrom: availableDoctors);
			addStaffMember: (self extractExperiencedDoctorFrom: availableDoctors) ].
	aWorkingDay dayShift do: [ :aShift |
		aShift 
			addStaffMember: (self extractDoctorFrom: availableDoctors) ]

]

{ #category : #accessing }
HMScheduleAssigner >> assignNursesToWorkingDay: aWorkingDay [
	| availableNurses |
	availableNurses := self availableNursesForDay: aWorkingDay.
	aWorkingDay nightShift
		do: [ :aShift | 
			aShift
				addStaffMember: (self extractNurseFrom: availableNurses);
				addStaffMember: (self extractExperiencedNurseFrom: availableNurses) ].
	aWorkingDay dayShift
		do:
			[ :aShift | aShift addStaffMember: (self extractNurseFrom: availableNurses) ]
]

{ #category : #accessing }
HMScheduleAssigner >> availableDoctorsForDay: aWorkingDay [
	^ self doctors
		select: [ :aDoctor | aDoctor isAvailableOnDay: aWorkingDay ]
]

{ #category : #accessing }
HMScheduleAssigner >> availableNursesForDay: aWorkingDay [
	^ self nurses
		select: [ :aNurse | aNurse isAvailableOnDay: aWorkingDay ]
]

{ #category : #accessing }
HMScheduleAssigner >> doctors [
	^ doctors
]

{ #category : #accessing }
HMScheduleAssigner >> doctors: aCollection [
	doctors := aCollection
]

{ #category : #accessing }
HMScheduleAssigner >> extractDoctorFrom: availableDoctors [ 
	| selectedDoctor |
	selectedDoctor := availableDoctors "shuffle "first.
	availableDoctors remove: selectedDoctor.
	^ selectedDoctor
]

{ #category : #accessing }
HMScheduleAssigner >> extractExperiencedDoctorFrom: availableDoctors [
	| selectedDoctor |
	selectedDoctor := availableDoctors "shuffle"
		detect: [ :aDoctor | aDoctor isExperienced ].
	availableDoctors remove: selectedDoctor.
	^ selectedDoctor
]

{ #category : #accessing }
HMScheduleAssigner >> extractExperiencedNurseFrom: availableNurses [
	| selectedNurse |
	selectedNurse := availableNurses "shuffle"
		detect: [ :aNurse | aNurse isExperienced ].
	availableNurses remove: selectedNurse.
	^ selectedNurse
]

{ #category : #accessing }
HMScheduleAssigner >> extractNurseFrom: availableNurses [
	| selectedNurse |
	selectedNurse := availableNurses "shuffle" first.
	availableNurses remove: selectedNurse.
	^ selectedNurse
]

{ #category : #accessing }
HMScheduleAssigner >> gtViewDaysFor: aView [
	<gtView>
	^ aView list
		title: 'Working Days';
		items: [ self workingDays ];
		itemText: [ :aWorkingDay | aWorkingDay description ]
]

{ #category : #accessing }
HMScheduleAssigner >> nurses [
	^ nurses
]

{ #category : #accessing }
HMScheduleAssigner >> nurses: aCollection [
	nurses := aCollection
]

{ #category : #accessing }
HMScheduleAssigner >> performAssignment [
	self workingDays
		do: [ :aWorkingDay | self assignDoctorsToWorkingDay: aWorkingDay ];
		do: [ :aWorkingDay | self assignNursesToWorkingDay: aWorkingDay ]
]

{ #category : #accessing }
HMScheduleAssigner >> workingDays [
	^ workingDays 
]

{ #category : #accessing }
HMScheduleAssigner >> workingDays: aCollection [
	workingDays := aCollection
]

Class {
	#name : #HMScheduleAssigner,
	#superclass : #Object,
	#instVars : [
		'doctors',
		'workingDays'
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
HMScheduleAssigner >> availableDoctorsForDay: aWorkingDay [ 
	^ self doctors select: [ :aDoctor |
		aDoctor isAvailableOnDay: aWorkingDay ].
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
	selectedDoctor := availableDoctors first.
	availableDoctors remove: selectedDoctor.
	^ selectedDoctor
]

{ #category : #accessing }
HMScheduleAssigner >> extractExperiencedDoctorFrom: availableDoctors [ 
	| selectedDoctor |
	selectedDoctor := availableDoctors detect: [ :aDoctor | 
		aDoctor isExperienced ].
	availableDoctors remove: selectedDoctor.
	^ selectedDoctor
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
HMScheduleAssigner >> performAssignment [
	self workingDays do: [:aWorkingDay |
		self assignDoctorsToWorkingDay: aWorkingDay ]
]

{ #category : #accessing }
HMScheduleAssigner >> workingDays [
	^ workingDays 
]

{ #category : #accessing }
HMScheduleAssigner >> workingDays: aCollection [
	workingDays := aCollection
]

Class {
	#name : #HMHospitalSystem,
	#superclass : #Object,
	#instVars : [
		'staff',
		'schedule'
	],
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMHospitalSystem >> gtScheduleFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Schedule';
		priority: 1;
		items: [ schedule days ];
		column: 'Day' text: [ :aDay | aDay date ]
]

{ #category : #accessing }
HMHospitalSystem >> gtStaffFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Staff';
		priority: 1;
		items: [ staff ];
		column: 'Staff' text: [ :aStaffMember | aStaffMember class ];
		column: 'Experience in years' text: [ :aStaffMember | aStaffMember experienceInYears ].
]

{ #category : #accessing }
HMHospitalSystem >> schedule [
	^ schedule
]

{ #category : #accessing }
HMHospitalSystem >> schedule: aSchedule [
	schedule := aSchedule
]

{ #category : #accessing }
HMHospitalSystem >> staff [
	^ staff
]

{ #category : #accessing }
HMHospitalSystem >> staff: staffMembers [
	staff := staffMembers
]

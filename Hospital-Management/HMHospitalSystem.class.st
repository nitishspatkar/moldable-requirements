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
HMHospitalSystem >> Initialize [
	super initialize.
	staff := OrderedCollection new
]

{ #category : #accessing }
HMHospitalSystem >> gtScheduleFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Schedule';
		priority: 1;
		items: [ schedule days ];
		column: 'Date' text: [ :aDay | aDay date ] width: 100;
		column: 'Day' text: [ :aDay | aDay date weekday ]
]

{ #category : #accessing }
HMHospitalSystem >> gtStaffFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Staff';
		priority: 1;
		items: [ staff ];
		column: 'TYpe'
			text: [ :aStaffMember | aStaffMember class ]
			width: 100;
		column: 'First Name'
			text: [ :aStaffMember | aStaffMember firstName ]
			width: 100;
		column: 'Last Name'
			text: [ :aStaffMember | aStaffMember lastName ]
			width: 100;
		column: 'Experience in years'
			text: [ :aStaffMember | aStaffMember experienceInYears ] width: 150;
		column: 'Remaining working hours'
			text: [ :aStaffMember | aStaffMember balanceWorkingHours ]
]

{ #category : #accessing }
HMHospitalSystem >> initialize [
	super initialize.
	staff := OrderedCollection new
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

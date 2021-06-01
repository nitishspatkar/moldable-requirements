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
HMHospitalSystem >> createScheduleViewForStaff: currentStaff andSchedule: currentSchedule [
	| container  |
	container := BlElement new
		layout: (BlGridLayout new
			columnCount: currentSchedule days size + 1);
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ].
		
	container addChild: (BlElement new size: 5@5).
	currentSchedule days do: [ :aDay |
		container addChild: (BrLabel new
			text: aDay date dayOfMonth asString; 
			aptitude: (BrGlamorousLabelAptitude new))].
		
	currentStaff do: [ :aStaffMember |
		container addChild: (BrLabel new
			text: aStaffMember fullName; 
			aptitude: (BrGlamorousLabelAptitude new)).
		currentSchedule days do: [ :aDay | 
			container addChild: (BrLabel new
				text: ((aStaffMember shiftForDay: aDay)
					ifNil: [ ' - ' ] 
					ifNotNil: [ :aShift | aShift shiftCode ]); 
				aptitude: (BrGlamorousLabelAptitude new)) ] ].
	
	^ container 
]

{ #category : #accessing }
HMHospitalSystem >> doctors [
	^ self  staff select: [ :aStaffMember | 
		aStaffMember isDoctor ]
]

{ #category : #accessing }
HMHospitalSystem >> gViewWorkingDaysFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Working Days';
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
			text: [ :aStaffMember | aStaffMember class name removePrefix: 'HM' ]
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
			text: [ :aStaffMember | aStaffMember balanceWorkingHours ] width: 150;
			column: 'Available compensation hours'
			text: [ :aStaffMember | aStaffMember compensationHours ]
]

{ #category : #accessing }
HMHospitalSystem >> gtViewSchedule2For: aView [
	<gtView>
	| columnView |
	columnView := aView columnedList
		title: 'Schedule2';
		items: [ self staff ].
		
	columnView 
		column: '' text: [ :aStaffMember | aStaffMember fullName ] width: 120.
	self schedule days do: [ :aDay |
		columnView 
			column: aDay date dayOfMonth 
			text: [ :aStaffMember | 
				((aStaffMember shiftForDay: aDay)
					ifNil: [ ' - ' ] 
					ifNotNil: [ :aShift | aShift shiftCode ]) ] ].
		
	^ columnView
]

{ #category : #accessing }
HMHospitalSystem >> gtViewScheduleFor: aView [
	<gtView>
	^ aView explicit
		title: 'Schedule';
		stencil: [  self 
			createScheduleViewForStaff: self staff
			andSchedule: self schedule  ]
]

{ #category : #accessing }
HMHospitalSystem >> initialize [
	super initialize.
	staff := OrderedCollection new
]

{ #category : #accessing }
HMHospitalSystem >> nurses [
	^ self  staff select: [ :aStaffMember | 
		aStaffMember isDoctor not ]
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

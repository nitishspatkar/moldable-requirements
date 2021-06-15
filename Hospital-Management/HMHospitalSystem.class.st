"
# Hospital Management System

Hospital Management System (HMS) is a tiny application to assign medical staff to various shifts over multiple days.
Preparing a schedule is a complicated task as it involves considering various factors and constraints.
In essence, the staff member responsible for preparing a schedule needs to assign medical staff to various shifts on various days.
HMS has a list of medical staff with all their details and a schedule.
The medical staff consists of {{gtClass:HMDoctor|label=Doctors}} and {{gtClass:HMNurse|label=Nurses}}.
A {{gtClass:HMSchedule|label=schedule}} consists of working {{gtClass:HMWorkingDay|label=working days}}, and each day has a total of five {{gtClass:HMShift|label=shifts}}.
The staff member responsible for preparing a schedule needs to assign one of the available doctors and nurses to one shift per day.
While doing so, she needs to consider various {{gtClass:HMStaffConstraint|label=staff related constraints}} and {{gtClass:HMShiftConstraint|label=shift related constraints}}.

Kindly follow the heperlinks to directly jump into the immplementation of the involved domain concepts.
For each concept, you can explore a similarr interactive documentation.

"
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
HMHospitalSystem class >> gtDependenciessViewFor: aView [
	<gtView>
	<gtClassView>
	^ aView explicit
		title: 'Dependencies';
		tooltip: 'Dependencies';
		priority: 40;
		stencil: [ 
			|view  |
		view := GtMondrian new.
	view nodes
		shape: [ :x | BlTextElement new text: x asString asRopedText ];
		with: (1 to: 100).
	view edges connectFrom: [ :x | x // 2 ].
	view edges
		shape: [ :x | 
			BlLineElement new
				border: (BlBorder paint: (Color red alpha: 0.5) width: 2) ];
		passive;
		connect:
			{(1 -> 12).
			(11 -> 19)}
			from: #key
			to: #value.
	view layout tree.
	view ]
]

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

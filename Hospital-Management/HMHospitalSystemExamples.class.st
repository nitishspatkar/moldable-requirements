"
### This tutorial explains step-by-step how a schedule is prepared for a single working day.

First, we need a collection of doctors.  
Let us create that by running the following example.
{{gtExample:HMStaffMemberExamples>>#allDoctorsWithConstraints}}

Next, we need a collection of nurses.
Let us create that by running the following example.
{{gtExample:HMStaffMemberExamples>>#allNursesWithConstraints}}

Now, we need a particular day to assign doctors and nurrses to.
Let us create that by running the following example.

{{gtExample:HMWorkingDayExamples>>#aWorkingDayMayOne}}

Kindly notice, how we created and assigned various shifts to this day.
Also, notice that we needed a collection of doctors from all the doctors we created earlier that are available on this specific day.

Finally, let's use our assigner algorithm that assigns doctors and nurses to various shifts on a specific day.
Kindly run the following example that demonstrates such assignment.

{{gtExample:HMScheduleAssignerExamples>>#oneDaySchedule}}

"
Class {
	#name : #HMHospitalSystemExamples,
	#superclass : #Object,
	#category : #'Hospital-Management-Examples'
}

{ #category : #accessing }
HMHospitalSystemExamples >> aWardleyMap [
<gtExample>
| snippet aWardleyMap aNodeA aNodeB aNodeC aNodeD aNodeE aNode aNodeF aNodeG aNodeH anEdgeFtoG anEdgeFtoD anEdgeCtoE anEdgeCtoA|
	
	
	snippet := LeWardleyMapSnippet new.


	aNodeA := GtWardleyMapNodeModel new.
	aNodeA coordinate: (0.65@0.5).
	aNodeA color: Color gray.
	aNodeA label: 'Web server'.
	
	aNodeB := GtWardleyMapNodeModel new.
	aNodeB coordinate: (0.35@0.55).
	aNodeB color: Color gray.
	aNodeB label: 'Market analysis'.
	
	aNodeC := GtWardleyMapNodeModel new.
	aNodeC coordinate: (0.45@0.7).
	aNodeC color: Color gray.
	aNodeC label: 'Microservice architecture'.
	
	aNodeD := GtWardleyMapNodeModel new.
	aNodeD coordinate: (0.45@0.20).
	aNodeD color: Color blue.
	aNodeD label: 'Custom requirements'.
	
	aNodeE := GtWardleyMapNodeModel new.
	aNodeE coordinate: (0.55@0.5).
	aNodeE color: Color gray.
	aNodeE label: 'Data storage'.
	
	aNodeF := GtWardleyMapNodeModel new.
	aNodeF coordinate: (0.15@0.10).
	aNodeF color: Color blue.
	aNodeF label: 'Scheduling application'.
	
	aNodeH := GtWardleyMapNodeModel new.
	aNodeH coordinate: (0.85@0.2).
	aNodeH color: Color red.
	aNodeH label: 'Cloud Analytics Tools (Tableau, Looer, etc.)'.
	
	aNodeG := GtWardleyMapNodeModel new.
	aNodeG coordinate: (0.30@0.30).
	aNodeG color: Color gray.
	aNodeG label: 'Scheduling algorithm'.

	anEdgeFtoG := GtWardleyMapEdgeModel new
		fromNode: aNodeF;
		toNode: aNodeG;
		arrow: true;
		width: 1.
	anEdgeFtoD := GtWardleyMapEdgeModel new
		fromNode: aNodeF;
		toNode: aNodeD;
		arrow: true;
		width: 1.
	anEdgeCtoE := GtWardleyMapEdgeModel new
		fromNode: aNodeC;
		toNode: aNodeE;
		arrow: true;
		width: 1.
	anEdgeCtoA := GtWardleyMapEdgeModel new
		fromNode: aNodeC;
		toNode: aNodeA;
		arrow: true;
		width: 1.

	aWardleyMap := GtWardleyMapModel new.
	aWardleyMap addNode: aNodeA.
	aWardleyMap addNode: aNodeB.
	aWardleyMap addNode: aNodeC.
	aWardleyMap addNode: aNodeD.
	aWardleyMap addNode: aNodeE.
	aWardleyMap addNode: aNodeF.
	aWardleyMap addNode: aNodeG.
	aWardleyMap addNode: aNodeH.
	aWardleyMap addEdge: anEdgeFtoG.
	aWardleyMap addEdge: anEdgeFtoD.
	aWardleyMap addEdge: anEdgeCtoE.
	aWardleyMap addEdge: anEdgeCtoA.
	
	snippet wardleyMap: aWardleyMap.
	^ snippet
]

{ #category : #accessing }
HMHospitalSystemExamples >> dependencyDiagram [
	<gtExample>
	| m |
	m := CRMondrian new.
	m nodes label
		with:
			((RPackageOrganizer default packageNamed: 'Hospital-Management')
				classes
				"reject: [ :aClass | aClass category = 'Hospital-Management-Examples' ]").
	m edge arrow connectFromAll: #dependentClasses.
	m layout grid.
	^ m
]

{ #category : #accessing }
HMHospitalSystemExamples >> domainModelWithAllConnections [
	<gtExample>
	| aDictionary m |
	aDictionary := Dictionary new.
	m := CRMondrian new.
	aDictionary
		add: HMSchedule -> HMHospitalSystem;
		add: HMStaffMember -> HMHospitalSystem;
		add: HMWorkingDay -> HMSchedule;
		add: HMShift -> HMWorkingDay;
		add: HMShiftConstraint -> HMShift;
		add: HMConsecutiveNightShiftsConstraint -> HMShiftConstraint;
		add: HMNightShiftConstraint -> HMShiftConstraint;
		add: HMShiftExperiencedAndInexperiencedConstraint -> HMShiftConstraint;
		add: HMShiftOneDoctorConstraint -> HMShiftConstraint;
		add: HMDoctor -> HMStaffMember;
		add: HMNurse -> HMStaffMember;
		add: HMStaffConstraint -> HMStaffMember;
		add: HMStaffConstraintType -> HMStaffConstraint;
		add: HMStaffHolidayConstraintType -> HMStaffConstraint;
		add: HMStaffSeminarConstraintType -> HMStaffConstraint;
		add: HMStaffTwoDaysOffAWeekConstraint -> HMStaffConstraint;
		add: HMStaffCustomConstraintType -> HMStaffConstraint;
		add: HMNightShiftConstraint -> HMStaffConstraint;
		add: HMConsecutiveNightShiftsConstraint -> HMStaffConstraint;
		add: HMNightShiftCompensationConstraint -> HMStaffConstraint;
		add: HMConsecutiveShiftsConstraint -> HMStaffConstraint.
	m nodes label
		with:
			((RPackageOrganizer default packageNamed: 'Hospital-Management')
				classes
				reject: [ :aClass | aClass category = 'Hospital-Management-Examples' ]).
	m edge connectFrom: [ :c | aDictionary at: c ifAbsent: [ nil ] ].
	m layout tree.
	^ m
]

{ #category : #accessing }
HMHospitalSystemExamples >> domainModelWithoutAllConnections [
	<gtExample>
	| m |
	m := CRMondrian new.
	m nodes box
		normalizeHeight: #numberOfMethods from: 5 to: 25;
		normalizeWidth: [ :x | x slots size ] from: 5 to: 25;
		normalizeColor: #linesOfCode;
		with:
			((RPackageOrganizer default packageNamed: 'Hospital-Management')
				classes
				reject: [ :aClass | aClass category = 'Hospital-Management-Examples' ]).
	m edge connectFrom: #superclass.
	m layout tree.
	^ m
]

{ #category : #accessing }
HMHospitalSystemExamples >> hospitalManagementSystemWithOneMonthScheduleAndDoctorsWithConstraints [
	<gtExample>
	| hospitalManagementSystem schedule staff assigner |
	hospitalManagementSystem := HMHospitalSystem new.
	schedule := HMScheduleExamples new forOneMonth.
	
	HMStaffMemberExamples new allDoctorsWithConstraints
		do: [ :each | hospitalManagementSystem staff add: each ].
	HMStaffMemberExamples new allNursesWithConstraints
		do: [ :each | hospitalManagementSystem staff add: each ].
	
	assigner := HMScheduleAssigner new.
	assigner 
		doctors: hospitalManagementSystem doctors;
		nurses: hospitalManagementSystem nurses;
		workingDays: schedule days.
	assigner performAssignment.
		
	hospitalManagementSystem schedule: schedule.
	^ hospitalManagementSystem
]

{ #category : #accessing }
HMHospitalSystemExamples >> hospitalManagemmentSystemWithOneWeekScheduleAndDoctorsWithConstraints [
	<gtExample>
	| hospitalManagementSystem schedule staff assigner |
	hospitalManagementSystem := HMHospitalSystem new.
	schedule := HMScheduleExamples new forOneWeek.
	HMStaffMemberExamples new allDoctorsWithConstraints
		do: [ :each | hospitalManagementSystem staff add: each ].
	HMStaffMemberExamples new allNursesWithConstraints
		do: [ :each | hospitalManagementSystem staff add: each ].
		
	assigner := HMScheduleAssigner new.
	assigner 
		doctors: hospitalManagementSystem doctors;
		nurses: hospitalManagementSystem nurses;
		workingDays: schedule days.
	assigner performAssignment.
		
	hospitalManagementSystem schedule: schedule.
	^ hospitalManagementSystem
]

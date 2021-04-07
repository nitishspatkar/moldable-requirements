Class {
	#name : #MyTask,
	#superclass : #Object,
	#instVars : [
		'is',
		'description',
		'done',
		'end',
		'assignees'
	],
	#category : #MyMoldableRequirements
}

{ #category : #accessing }
MyTask class >> fromRawData: taskDict [ 
	^self 
		id: (taskDict at: #id)
		description: (taskDict at: #description)
		done: (taskDict at: #done)
		end: (taskDict at: #end)
		assignees: ((taskDict at: #assignees) collect: [ :assigneesDict | MyAssignees fromRawData: assigneesDict])
]

{ #category : #accessing }
MyTask class >> id: aNumber description: aString done: aBoolean end: aDate assignees: anArray [
^self new
	id: aNumber; 
	description: aString; 
	done: aBoolean;
	end: aDate asDate;
	assignees: anArray asOrderedCollection
	yourself 
]

{ #category : #accessing }
MyTask >> asFormElement: aBlock [
	"an epic presents itself as a form to be filled and save as an object"

	| label textElementDescription |
	textElementDescription := GtDocument new asElementWithoutSaveAction
		vFitContent;
		hMatchParent;
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 2);
		padding: (BlInsets all: 3);
		margin: (BlInsets top: 3 bottom: 3);
		geometry: (BlRectangle cornerRadius: 5).
	^ BlElement new
		layout: BlLinearLayout vertical;
		padding: (BlInsets all: 5);
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal exact: 300 ];
		addChild:
			(BrLabel new
				look: BrGlamorousLabelLook;
				text: 'Task:';
				beNormalSize);
		addChild: textElementDescription;
		addChild:
			(BrButton new
				look: BrGlamorousButtonWithIconLook;
				icon: BrGlamorousVectorIcons accept;
				beSmallSize;
				label: 'Save';
				action: [ description := textElementDescription document text asString.
					"The following line means that when we click the save button, the arguement i.e., aBlock is evaluated"
					aBlock value ];
				yourself);
		yourself
]

{ #category : #accessing }
MyTask >> assignees: anArray [
	assignees := anArray
]

{ #category : #accessing }
MyTask >> description [
^description
]

{ #category : #accessing }
MyTask >> description: aString [ 
description := aString
]

{ #category : #accessing }
MyTask >> done [
^done
]

{ #category : #accessing }
MyTask >> done: aBoolean [ 
done := aBoolean
]

{ #category : #accessing }
MyTask >> end: aDate [ 
end := aDate
]

{ #category : #accessing }
MyTask >> getTaskDescription: aTask [
"gets taskdescription with checkbox"

  | taskDescription checkbox |
	taskDescription := BlElement new
						layout: BlLinearLayout horizontal;
						constraintsDo: [ :c | 
							c horizontal matchParent.
							c vertical fitContent ].
					checkbox := BrCheckbox new
						look: BrGlamorousCheckboxLook;
						margin: (BlInsets right: 10);
						whenCheckedDo: [ aTask done: 'true' ];
						whenUncheckedDo: [ aTask done: 'false' ].
					aTask done = 'true'
						ifTrue: [ checkbox check ]
						ifFalse: [ checkbox uncheck ].
					taskDescription
						addChild: checkbox;
						addChild:
							(BrLabel new
								text: aTask description;
								look: BrGlamorousLabelLook;
								beNormalSize;
								constraintsDo: [ :c | 
									c horizontal matchParent.
									c vertical fitContent ]).
					^taskDescription
]

{ #category : #accessing }
MyTask >> id: aNumber [ 
is := aNumber
]

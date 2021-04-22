Class {
	#name : #MyTaskOld,
	#superclass : #Object,
	#instVars : [
		'is',
		'description',
		'done',
		'end',
		'assignees',
		'userStory'
	],
	#category : #'MyMoldableRequirements-Models'
}

{ #category : #accessing }
MyTaskOld class >> fromRawData: taskDict [ 
	^self 
		id: (taskDict at: #id)
		description: (taskDict at: #description)
		done: (taskDict at: #done)
		end: (taskDict at: #end)
		assignees: ((taskDict at: #assignees) collect: [ :assigneesDict | MyTeamMembers fromRawData: assigneesDict])
]

{ #category : #accessing }
MyTaskOld class >> id: aNumber description: aString done: aBoolean end: aDate assignees: anArray [
^self new
	id: aNumber; 
	description: aString; 
	done: aBoolean;
	end: aDate asDate;
	assignees: anArray asOrderedCollection
	yourself 
]

{ #category : #accessing }
MyTaskOld >> asFormElement: aBlock [
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
				aptitude: BrGlamorousLabelAptitude;
				text: 'Task:';
				beNormalSize);
		addChild: textElementDescription;
		addChild:
			(BrButton new
				aptitude: BrGlamorousButtonWithIconAptitude;
				icon: BrGlamorousVectorIcons accept;
				beSmallSize;
				label: 'Save';
				action: [ description := textElementDescription document text asString. (self userStory announcer) announce: MyUserStoryStatusChanged.
					"The following line means that when we click the save button, the arguement i.e., aBlock is evaluated"
					aBlock value ];
				yourself);
		yourself
]

{ #category : #accessing }
MyTaskOld >> assignees: anArray [
	assignees := anArray
]

{ #category : #accessing }
MyTaskOld >> description [
^description
]

{ #category : #accessing }
MyTaskOld >> description: aString [ 
description := aString
]

{ #category : #accessing }
MyTaskOld >> done [
^done
]

{ #category : #accessing }
MyTaskOld >> done: aBoolean [ 
done := aBoolean
]

{ #category : #accessing }
MyTaskOld >> end: aDate [ 
end := aDate
]

{ #category : #accessing }
MyTaskOld >> getTaskDescription: aTask [
"gets taskdescription with checkbox"

  | taskDescription checkbox |
	taskDescription := BlElement new
						layout: BlLinearLayout horizontal;
						constraintsDo: [ :c | 
							c horizontal matchParent.
							c vertical fitContent ].
					checkbox := BrCheckbox new
						aptitude: BrGlamorousCheckboxAptitude;
						margin: (BlInsets right: 10);
						whenCheckedDo: [ aTask done: 'true' ];
						whenUncheckedDo: [ aTask done: 'false' ].
					aTask done = 'true'
						ifTrue: [ checkbox check ]
						ifFalse: [ checkbox uncheck ].
					taskDescription
						addChild: checkbox;
						addChild:
							(BrButton new
								label: aTask description;
								aptitude: BrGlamorousLabelAptitude;
								beNormalSize;
								action: [:button | button phlow spawnObject: aTask];
								constraintsDo: [ :c | 
									c horizontal matchParent.
									c vertical fitContent ]).
					^taskDescription
]

{ #category : #accessing }
MyTaskOld >> id: aNumber [ 
is := aNumber
]

{ #category : #accessing }
MyTaskOld >> printOn: aStream [
	aStream nextPutAll: description
]

{ #category : #accessing }
MyTaskOld >> userStory [
^userStory
]

{ #category : #accessing }
MyTaskOld >> userStory: aStory [
userStory := aStory
]

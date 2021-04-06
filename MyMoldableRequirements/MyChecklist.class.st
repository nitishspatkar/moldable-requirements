Class {
	#name : #MyChecklist,
	#superclass : #Object,
	#instVars : [
		'tasks'
	],
	#category : #MyMoldableRequirements
}

{ #category : #accessing }
MyChecklist class >> fromRawData: checklistDict [ 
 ^self
 	list: ((checklistDict at: #tasks) collect: [ :taskDict | MyTask fromRawData: taskDict])
]

{ #category : #accessing }
MyChecklist class >> list: anArray [
	^ self new tasks: anArray asOrderedCollection
]

{ #category : #accessing }
MyChecklist >> addTaskDropdownLook [
	^ BrGlamorousWithDropdownLook 
	handle: [BrButton new
				look: BrGlamorousButtonRectangularLook + BrGlamorousButtonIconLook;
				icon: BrGlamorousIcons add
	]
	content: [ | task |
			task := MyTask
				id: nil
				description: ''
				done: 'false'
				end: '01.01.2021'
				assignees: OrderedCollection new.
			task asFormElement: [ tasks add: task ].
	]
]

{ #category : #accessing }
MyChecklist >> tasks [
^ tasks
]

{ #category : #accessing }
MyChecklist >> tasks: anArray [
 tasks := anArray
]

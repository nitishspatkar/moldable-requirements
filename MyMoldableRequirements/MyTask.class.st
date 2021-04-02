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
MyTask >> assignees: anArray [
	assignees := anArray
]

{ #category : #accessing }
MyTask >> description: aString [ 
description := aString
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
MyTask >> id: aNumber [ 
is := aNumber
]

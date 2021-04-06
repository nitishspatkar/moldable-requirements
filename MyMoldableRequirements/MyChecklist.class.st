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
MyChecklist >> tasks [
^ tasks
]

{ #category : #accessing }
MyChecklist >> tasks: anArray [
 tasks := anArray
]

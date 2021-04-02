Class {
	#name : #MyChecklist,
	#superclass : #Object,
	#classInstVars : [
		'tasks'
	],
	#category : #MyMoldableRequirements
}

{ #category : #accessing }
MyChecklist class >> fromRawData: checklistDict [ 
 ^self
 	tasks: ((checklistDict at: #tasks) collect: [ :taskDict | MyTask fromRawData: taskDict])
]

{ #category : #accessing }
MyChecklist class >> tasks: anArray [
	tasks := anArray asOrderedCollection
]

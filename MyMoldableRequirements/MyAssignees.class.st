Class {
	#name : #MyAssignees,
	#superclass : #Object,
	#instVars : [
		'name',
		'shorthand'
	],
	#category : #MyMoldableRequirements
}

{ #category : #accessing }
MyAssignees class >> fromRawData: assigneesDict [ 
^ self
	name: (assigneesDict at: #name)
	shorthand: (assigneesDict at: #shorthand)
]

{ #category : #accessing }
MyAssignees class >> name: aString shorthand: anotherString [
^self new
	name: aString;
	shorthand: anotherString
	yourself
]

{ #category : #accessing }
MyAssignees >> name: aString [ 
name := aString
]

{ #category : #accessing }
MyAssignees >> shorthand: anotherString [ 
shorthand := anotherString
]

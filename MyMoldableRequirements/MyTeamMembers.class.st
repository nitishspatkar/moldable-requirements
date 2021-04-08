Class {
	#name : #MyTeamMembers,
	#superclass : #Object,
	#instVars : [
		'name',
		'shorthand'
	],
	#category : #MyMoldableRequirements
}

{ #category : #accessing }
MyTeamMembers class >> fromRawData: teamDict [ 
^ self 
	name: (teamDict at: #name)
	shorthand: (teamDict at: #shorthand)
]

{ #category : #accessing }
MyTeamMembers class >> name: aString shorthand: anotherString [
^ self new
	name: aString;
	shorthand: anotherString
	yourself 
]

{ #category : #accessing }
MyTeamMembers >> name: aString [ 
name := aString
]

{ #category : #accessing }
MyTeamMembers >> shorthand: aString [
shorthand := aString
]

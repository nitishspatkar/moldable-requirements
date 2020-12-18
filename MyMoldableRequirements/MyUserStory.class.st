Class {
	#name : #MyUserStory,
	#superclass : #Object,
	#instVars : [
		'id',
		'description',
		'status',
		'points'
	],
	#category : #MyMoldableRequirements
}

{ #category : #accessing }
MyUserStory class >> fromRawData: userStoryDict [
	^ self
		id: (userStoryDict at: #id)
		status: (userStoryDict at: #status)
		description: (userStoryDict at: #description)
		points: (userStoryDict at: #points)
]

{ #category : #accessing }
MyUserStory class >> id: aString status: anotherString description: yetAnotherString points: aNumber [
	^ self new
		id: aString;
		status: anotherString;
		description: yetAnotherString;
		points: aNumber;
		yourself
]

{ #category : #accessing }
MyUserStory >> description: yetAnotherString [
	description := yetAnotherString
]

{ #category : #accessing }
MyUserStory >> id: aString [
	id := aString
]

{ #category : #accessing }
MyUserStory >> points: aNumber [
	points := aNumber
]

{ #category : #accessing }
MyUserStory >> status: anotherString [
	status := anotherString
]

{ #category : #accessing }
MyUserStory >> title: anotherString [ 
]

Class {
	#name : #MyUserStoryStatusButton,
	#superclass : #BrButton,
	#instVars : [
		'userStory'
	],
	#category : #'MyMoldableRequirements-Views'
}

{ #category : #'private - event handling' }
MyUserStoryStatusButton >> onStatusChanged: anAnnouncement [
	self background: self userStory statusColor
]

{ #category : #accessing }
MyUserStoryStatusButton >> userStory [
	^ userStory
]

{ #category : #accessing }
MyUserStoryStatusButton >> userStory: anObject [
	userStory := anObject.
	
	self background: self userStory statusColor.
	
	userStory announcer weak
		when: MyUserStoryStatusChange
		send: #onStatusChanged:
		to: self
]

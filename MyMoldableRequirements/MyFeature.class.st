Class {
	#name : #MyFeature,
	#superclass : #Object,
	#instVars : [
		'id',
		'title',
		'description',
		'userStories'
	],
	#category : #MyMoldableRequirements
}

{ #category : #accessing }
MyFeature class >> fromRawData: epicDict [
	^ self
		id: (epicDict at: #id)
		title: (epicDict at: #title)
		description: (epicDict at: #description)
		userStories:
			((epicDict at: #'user-stories')
				collect: [ :userStoriesDict | MyUserStory fromRawData: userStoriesDict ])
]

{ #category : #accessing }
MyFeature class >> id: aString title: anotherString description: yetAnotherString userStories: anArray [
	^ self new
		id: aString;
		title: anotherString;
		description: yetAnotherString;
		userStories: anArray;
		yourself
]

{ #category : #accessing }
MyFeature >> description: yetAnotherString [
	description := yetAnotherString
]

{ #category : #accessing }
MyFeature >> id: aString [
	id := aString
]

{ #category : #accessing }
MyFeature >> printOn: aStream [
	aStream nextPutAll: title
]

{ #category : #accessing }
MyFeature >> title: anotherString [
	title := anotherString
]

{ #category : #accessing }
MyFeature >> userStories: anArray [
	userStories := anArray
]

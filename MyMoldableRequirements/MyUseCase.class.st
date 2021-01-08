Class {
	#name : #MyUseCase,
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
MyUseCase class >> fromRawData: useCaseDict [
	^ self
		id: (useCaseDict at: #id)
		title: (useCaseDict at: #title)
		description: (useCaseDict at: #description)
		userStories:
			((useCaseDict at: #'user-stories')
				collect: [ :userStoryDict | MyUserStory fromRawData: userStoryDict ])
]

{ #category : #accessing }
MyUseCase class >> id: aString title: anotherString description: yetAnotherString userStories: anArray [
^ self new
		id: aString;
		title: anotherString;
		description: yetAnotherString;
		userStories: anArray;
		yourself

]

{ #category : #accessing }
MyUseCase >> description: yetAnotherString [
	description := yetAnotherString
]

{ #category : #accessing }
MyUseCase >> id: aString [
	id := aString
]

{ #category : #accessing }
MyUseCase >> printOn: aStream [
	aStream nextPutAll: title
]

{ #category : #accessing }
MyUseCase >> title: anotherString [
	title := anotherString
]

{ #category : #accessing }
MyUseCase >> userStories: anArray [
	userStories := anArray
]

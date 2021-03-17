Class {
	#name : #MyEpic,
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
MyEpic class >> fromRawData: epicDict [
	^ self
		id: (epicDict at: #id)
		title: (epicDict at: #title)
		description: (epicDict at: #description)
		userStories:
			((epicDict at: #'user-stories')
				collect: [ :userStoriesDict | MyUserStory fromRawData: userStoriesDict ])
]

{ #category : #accessing }
MyEpic class >> id: aString title: anotherString description: yetAnotherString userStories: anArray [
	^ self new
		id: aString;
		title: anotherString;
		description: yetAnotherString;
		userStories: anArray asOrderedCollection;
		yourself
]

{ #category : #accessing }
MyEpic >> description: yetAnotherString [
	description := yetAnotherString
]

{ #category : #accessing }
MyEpic >> gtUserStoriesFor: aView [
	<gtView>
	^ (userStories gtItemsFor: aView)
		title: 'User stories';
		actionDropdownButtonIcon: BrGlamorousVectorIcons add
			tooltip: 'Add a user story'
			content: [ | story |
			story := MyUserStory
				id: nil
				status: ''
				description: ''
				points: nil
				scenarios: nil.
			story asFormElement: [ userStories add: story ] ]
]

{ #category : #accessing }
MyEpic >> id: aString [
	id := aString
]

{ #category : #accessing }
MyEpic >> printOn: aStream [
	aStream nextPutAll: title
]

{ #category : #accessing }
MyEpic >> title: anotherString [
	title := anotherString
]

{ #category : #accessing }
MyEpic >> userStories: anArray [
	userStories := anArray
]

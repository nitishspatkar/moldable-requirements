Class {
	#name : #MyUserStoryExamples,
	#superclass : #Object,
	#category : #'MyMoldableRequirements-Examples'
}

{ #category : #examples }
MyUserStoryExamples >> changeAcceptanceCriteria [
	| aUserStory aSubscription announcements |
	<gtExample>
	
	aUserStory := self newUserStory.
	
	announcements := OrderedCollection new.
	aSubscription := aUserStory announcer
		when: MyUserStoryAcceptanceCriteriaChanged
		do: [ :anAnnouncement | announcements add: anAnnouncement ].

	aUserStory acceptanceCriteria: 'when user story is finished'.

	aUserStory announcer removeSubscription: aSubscription.

	self assert: aUserStory acceptanceCriteria equals: 'when user story is finished'.
	self assert: announcements size equals: 1.

	^ aUserStory
]

{ #category : #examples }
MyUserStoryExamples >> changeAcceptanceCriteriaToTheSame [
	| aUserStory aSubscription announcements |
	<gtExample>
	
	aUserStory := self newUserStory.
	
	announcements := OrderedCollection new.
	aSubscription := aUserStory announcer
		when: MyUserStoryAcceptanceCriteriaChanged
		do: [ :anAnnouncement | announcements add: anAnnouncement ].

	aUserStory acceptanceCriteria: ''.

	aUserStory announcer removeSubscription: aSubscription.

	self assert: aUserStory acceptanceCriteria equals: ''.
	self assert: announcements size equals: 0.

	^ aUserStory
]

{ #category : #examples }
MyUserStoryExamples >> changeStatus [
	| aUserStory aSubscription announcements |
	<gtExample>
	
	aUserStory := self newUserStory.
	
	announcements := OrderedCollection new.
	aSubscription := aUserStory announcer
		when: MyUserStoryStatusChanged
		do: [ :anAnnouncement | announcements add: anAnnouncement ].

	aUserStory status: MyUserStatusInProgress new.

	aUserStory announcer removeSubscription: aSubscription.

	self assert: aUserStory status equals: MyUserStatusInProgress new.
	self assert: announcements size equals: 1.

	^ aUserStory
]

{ #category : #examples }
MyUserStoryExamples >> changeStatusToTheSame [
	| aUserStory aSubscription announcements |
	<gtExample>
	
	aUserStory := self newUserStory.
	
	announcements := OrderedCollection new.
	aSubscription := aUserStory announcer
		when: MyUserStoryStatusChanged
		do: [ :anAnnouncement | announcements add: anAnnouncement ].

	aUserStory status: aUserStory status.

	aUserStory announcer removeSubscription: aSubscription.

	self assert: aUserStory status equals: MyUserStatusNotStarted new.
	self assert: announcements size equals: 0.

	^ aUserStory
]

{ #category : #examples }
MyUserStoryExamples >> newUserStory [
	| aUserStory |
	<gtExample>
	
	aUserStory := MyUserStory new.
	self assert: aUserStory status equals: MyUserStatusNotStarted new.
	self assert: aUserStory acceptanceCriteria equals: ''.

	^ aUserStory
]

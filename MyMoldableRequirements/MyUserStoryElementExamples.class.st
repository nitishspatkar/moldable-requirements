Class {
	#name : #MyUserStoryElementExamples,
	#superclass : #Object,
	#category : #'MyMoldableRequirements-Examples'
}

{ #category : #'instance creation' }
MyUserStoryElementExamples >> newUserStoryElement [
	<gtExample>
	| aUserStoryElement |
	
	aUserStoryElement := MyUserStoryElement new.
	aUserStoryElement userStoryModel: MyUserStoryExamples new newUserStory.
	
	^ aUserStoryElement
]

Class {
	#name : #MyUserStoryAnnotatingElementExamples,
	#superclass : #Object,
	#category : 'MyMoldableRequirements-Examples'
}

{ #category : #'examples - waiter' }
MyUserStoryAnnotatingElementExamples >> annotateWaiterUserStory [
	<gtExample>
	| aUserStory anAnnotatingElement |
	
	aUserStory := MyUserStoryExamples new waiterUserStory.
	anAnnotatingElement := MyUserStoryAnnotatingElement new userStory: aUserStory.
	
	^ anAnnotatingElement
]

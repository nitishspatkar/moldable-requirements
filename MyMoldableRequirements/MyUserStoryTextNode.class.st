Class {
	#name : #MyUserStoryTextNode,
	#superclass : #MyUserStoryParseNode,
	#instVars : [
		'text'
	],
	#category : 'MyMoldableRequirements-Ast'
}

{ #category : #'visitor-double dispatching' }
MyUserStoryTextNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitTextNode: self
]

{ #category : #variables }
MyUserStoryTextNode >> otherVariables [
	^ #(#text)
]

{ #category : #accessing }
MyUserStoryTextNode >> text [
	^ text
]

{ #category : #accessing }
MyUserStoryTextNode >> text: anObject [
	text := anObject
]

Class {
	#name : 'MyUserStoryAnnotationNode',
	#superclass : 'MyUserStoryParseNode',
	#instVars : [
		'annotation',
		'name'
	],
	#category : 'MyMoldableRequirements-Ast'
}

{ #category : 'visitor-double dispatching' }
MyUserStoryAnnotationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitAnnotationNode: self
]

{ #category : 'accessing' }
MyUserStoryAnnotationNode >> annotation [
	^ annotation
]

{ #category : 'accessing' }
MyUserStoryAnnotationNode >> annotation: anObject [
	annotation := anObject
]

{ #category : 'accessing' }
MyUserStoryAnnotationNode >> name [
	^ name
]

{ #category : 'accessing' }
MyUserStoryAnnotationNode >> name: anObject [
	name := anObject
]

{ #category : 'variables' }
MyUserStoryAnnotationNode >> otherVariables [
	^ #(#name)
]

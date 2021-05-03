Class {
	#name : #MyUserStoryParseNode,
	#superclass : #SmaCCParseNode,
	#category : #'MyMoldableRequirements-Ast'
}

{ #category : #'visitor-double dispatching' }
MyUserStoryParseNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitParseNode: self
]

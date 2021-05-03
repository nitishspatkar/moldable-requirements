Class {
	#name : #MyUserStoryNode,
	#superclass : #MyUserStoryParseNode,
	#instVars : [
		'nodes'
	],
	#category : #'MyMoldableRequirements-Ast'
}

{ #category : #'visitor-double dispatching' }
MyUserStoryNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitStoryNode: self
]

{ #category : #variables }
MyUserStoryNode >> compositeNodeVariables [
	^ #(nodes)
]

{ #category : #initialization }
MyUserStoryNode >> initialize [
	super initialize.

	nodes := OrderedCollection new: 2.
]

{ #category : #accessing }
MyUserStoryNode >> nodes [
	^ nodes
]

{ #category : #accessing }
MyUserStoryNode >> nodes: anOrderedCollection [
	self setParents: self nodes to: nil.
	nodes := anOrderedCollection.
	self setParents: self nodes to: self
]

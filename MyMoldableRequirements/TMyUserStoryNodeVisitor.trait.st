Trait {
	#name : #TMyUserStoryNodeVisitor,
	#traits : 'TSmaCCParseNodeVisitor',
	#classTraits : 'TSmaCCParseNodeVisitor classTrait',
	#category : #'MyMoldableRequirements-Ast'
}

{ #category : #visiting }
TMyUserStoryNodeVisitor >> visitAnnotationNode: anAnnotationNode [
	^ self visitParseNode: anAnnotationNode
]

{ #category : #visiting }
TMyUserStoryNodeVisitor >> visitParseNode: aParseNode [
	^ self visitSmaCCParseNode: aParseNode
]

{ #category : #visiting }
TMyUserStoryNodeVisitor >> visitStoryNode: anStoryNode [
	^ self visitParseNode: anStoryNode
]

{ #category : #visiting }
TMyUserStoryNodeVisitor >> visitTextNode: aTextNode [
	^ self visitParseNode: aTextNode
]

Class {
	#name : #MyUserStoryAnnotationStyler,
	#superclass : #GtCoderAstStyler,
	#traits : 'TMyUserStoryNodeVisitor',
	#classTraits : 'TMyUserStoryNodeVisitor classTrait',
	#category : #'MyMoldableRequirements-Coder'
}

{ #category : #'api - styling' }
MyUserStoryAnnotationStyler >> style: aText ast: theAst [
	text := aText.
	[ self accept: theAst ]
		ensure: [ text := nil ]
]

{ #category : #visiting }
MyUserStoryAnnotationStyler >> visitAnnotationNode: anAnnotationNode [
	self
		attributes: { BlTextDecorationAttribute new underline color: Color blue }
		from: anAnnotationNode startPosition
		to: anAnnotationNode stopPosition
]

Class {
	#name : #MyUserStoryParser,
	#superclass : #Object,
	#instVars : [
		'annotations'
	],
	#category : 'MyMoldableRequirements-Ast'
}

{ #category : #parsing }
MyUserStoryParser class >> parse: aString withAnnotations: aCollectionOfAnnotations [
	^ self new
		annotations: aCollectionOfAnnotations;
		parse: aString
]

{ #category : #accessing }
MyUserStoryParser >> annotations [
	^ annotations
]

{ #category : #accessing }
MyUserStoryParser >> annotations: anObject [
	annotations := anObject
]

{ #category : #parsing }
MyUserStoryParser >> findAnyAnnotation: aCollectionOfAnnotations in: aString startingAt: aStartIndex [
	| theAnnotationsWithIndex |
	
	theAnnotationsWithIndex := aCollectionOfAnnotations collect: [ :eachAnnotation |
		eachAnnotation -> (aString
			findString: eachAnnotation name
			startingAt: aStartIndex
			caseSensitive: false) ].
		
	theAnnotationsWithIndex := theAnnotationsWithIndex select: [ :each | each value > 0 ].
	theAnnotationsWithIndex := theAnnotationsWithIndex sorted: [ :a :b |
		a value = b value
			ifTrue: [ a name > b name ]
			ifFalse: [ a value < b value ] ].
		
	^ theAnnotationsWithIndex
		ifEmpty: [ nil ]
		ifNotEmpty: [ theAnnotationsWithIndex first ]
]

{ #category : #parsing }
MyUserStoryParser >> parse: aString [
	| storyNode index |

	storyNode := MyUserStoryNode new.
	storyNode completeSource: aString.
	
	index := 1.
	[
		(self findAnyAnnotation: annotations in: aString startingAt: index)
			ifNil: [
				| aTextNode |
				
				aTextNode := MyUserStoryTextNode new.
				aTextNode text: (SmaCCToken value: (aString copyFrom: index to: aString size) start: index ids: #()).
				storyNode addNode: aTextNode to: storyNode nodes.
				index := aString size.
				false ]
			ifNotNil: [ :anAnnotationAndIndex |
				| anAnnotationStartIndex anAnnotation anAnnotationNode |
				
				anAnnotation := anAnnotationAndIndex key.
				anAnnotationStartIndex := anAnnotationAndIndex value.
				
				anAnnotationStartIndex = index
					ifFalse: [
						| aTextNode |
					
						aTextNode := MyUserStoryTextNode new.
						aTextNode text: (SmaCCToken value: (aString copyFrom: index to: anAnnotationStartIndex - 1) start: index ids: #()).
						storyNode addNode: aTextNode to: storyNode nodes ].
				
				anAnnotationNode := MyUserStoryAnnotationNode new.
				anAnnotationNode annotation: anAnnotation.
				anAnnotationNode name: (SmaCCToken value: anAnnotation name start: anAnnotationStartIndex ids: #()).
				storyNode addNode: anAnnotationNode to: storyNode nodes.
				index := anAnnotationStartIndex + anAnnotation name size.
				true ] ] whileTrue.
	^ storyNode
]

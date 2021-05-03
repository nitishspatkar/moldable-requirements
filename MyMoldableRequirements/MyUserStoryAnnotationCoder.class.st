Class {
	#name : #MyUserStoryAnnotationCoder,
	#superclass : #GtTextCoder,
	#instVars : [
		'annotations'
	],
	#category : #'MyMoldableRequirements-Coder'
}

{ #category : #accessing }
MyUserStoryAnnotationCoder >> addAnnotation: aMyUserStoryAnnotation [
	self annotations add: aMyUserStoryAnnotation.
	self sourceChanged
]

{ #category : #accessing }
MyUserStoryAnnotationCoder >> annotations [
	^ annotations
]

{ #category : #accessing }
MyUserStoryAnnotationCoder >> annotations: aCollectionOfAnnotations [
	annotations := aCollectionOfAnnotations.

	self sourceChanged
]

{ #category : #'api - ast' }
MyUserStoryAnnotationCoder >> computeAst: theSourceString [
	^ MyUserStoryParser
		parse: theSourceString
		withAnnotations: self annotations
]

{ #category : #initialize }
MyUserStoryAnnotationCoder >> initialize [
	super initialize.
	
	annotations := OrderedCollection new
]

{ #category : #initialization }
MyUserStoryAnnotationCoder >> initializeAddOns: addOns [
	super initializeAddOns: addOns.
	
	addOns addStyler: MyUserStoryAnnotationStyler new.
	
	addOns
		addContextMenuItem: 'Annotate'
		action: [  :aCoderViewModel :anEvent :anEditorElement |
			aCoderViewModel hasSelection
				ifTrue: [
					| aNewAnnotationText |
					aNewAnnotationText := self currentSourceString copyFrom: (aCoderViewModel selection from + 1) to: aCoderViewModel selection to.
					self addAnnotation: (MyUserStoryAnnotation new name: aNewAnnotationText) ] ]
]

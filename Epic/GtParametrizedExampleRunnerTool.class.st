Class {
	#name : #GtParametrizedExampleRunnerTool,
	#superclass : #GtPhlowTool,
	#instVars : [
		'object'
	],
	#category : #'Epic-Examples'
}

{ #category : #'api - converting' }
GtParametrizedExampleRunnerTool >> asElementDo: aOneArgBlock [
	| anElement |
	anElement := (self object gtViewParameters2For: GtPhlowEmptyView new) asElementDo: [ :e | e ].

	^ aOneArgBlock cull: anElement
]

{ #category : #'private - converting' }
GtParametrizedExampleRunnerTool >> asTabElement [
	"Return a tool element that is going to be used as a part of ${class:GtPhlowCompositeTool}$"
	<return: #BlElement>
	| aContainer |
	aContainer := super asTabElement.
	"aContainer addEventHandler: (GtPhlowToolChangedObjectHandler new
		onChangeSend: #entity: to: aContainer)."
	^ aContainer
]

{ #category : #'api - converting' }
GtParametrizedExampleRunnerTool >> icon [ 
	^ BrGlamorousVectorIcons largebranching asElement asScalableElement size: 16@16
]

{ #category : #'api - accessing' }
GtParametrizedExampleRunnerTool >> name [
	^ 'connector'
]

{ #category : #'api - accessing' }
GtParametrizedExampleRunnerTool >> object [
	^ object
]

{ #category : #'api - accessing' }
GtParametrizedExampleRunnerTool >> object: anObject [
	object := anObject
]

{ #category : #'private - accessing' }
GtParametrizedExampleRunnerTool >> tabAptitude [
	^ BrGlamorousTabSwitcherWithIconAptitude
]

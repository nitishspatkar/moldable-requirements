"
I represent a finder for requirement references to classes.

I store requirement containers and search them for requirements that reference any given class.
"
Class {
	#name : #RequirementRefFinder,
	#superclass : #Object,
	#classInstVars : [
		'containers'
	],
	#category : #'Epic-Model'
}

{ #category : #accessing }
RequirementRefFinder class >> addContainer: aRequirementContainer [
	"I add a container to my base of containers that I will search through to find references."
	self
		assert: aRequirementContainer class
		equals: ERequirementContainer.
	(containers includes: aRequirementContainer) ifFalse: [ containers add: aRequirementContainer ].
]

{ #category : #accessing }
RequirementRefFinder class >> containers [
	^containers
]

{ #category : #'reference finding' }
RequirementRefFinder class >> findReferencesTo: aClass [
	| references |
	references := SortedCollection sortUsing: [ :elem1 :elem2 | elem1 class name < elem2 class name ].
	containers do: [ :aContainer | 
		aContainer getEpics do: [ :anEpic | 
			(anEpic getReferencesFrom: anEpic children) 
					do: [ :aRef | 
						(aRef class = RGMethodDefinition) ifFalse: [ (aRef = aClass) ifTrue: [ references add: anEpic ] ]
						].
			anEpic children do: [ :aUseCase | 
				(aUseCase getReferencesFrom: aUseCase children)
					do: [ :aRef | 
						(aRef class = RGMethodDefinition) ifFalse: [ (aRef = aClass) ifTrue: [ references add: aUseCase ] ]
						 ].
				aUseCase children do: [ :aUserStory | 
					(aUserStory getReferencesFrom: aUserStory parseStory)
						do: [ :aRef | 
							(aRef class = RGMethodDefinition) ifFalse: [ (aRef = aClass) ifTrue: [ references add: aUserStory ] ]
							 ]
					 ]
				 ].
			]
		 ].
	
	^references 
]

{ #category : #'class initialization' }
RequirementRefFinder class >> initialize [
	containers := OrderedCollection new.
]

{ #category : #views }
RequirementRefFinder class >> viewWithItemsFor: aClass [
	"I set up and return a view of the requirements that reference a given class. This is used in the 'Requirement References' gtView for any class in GToolkit."
	| view element references |
	references := self findReferencesTo: aClass.
	view := GtPhlowView empty list.
	view itemStencil: [ :x | 
		element := BrLabel new.
		element aptitude: BrGlamorousLabelAptitude new.
		element text: (x asString, ': ', x title) asRopedText.
		].
	view items: references.
	view title: 'Requirement References' translated.
	view priority: 2.
	^ view
]

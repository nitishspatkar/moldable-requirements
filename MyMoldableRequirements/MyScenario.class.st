Class {
	#name : #MyScenario,
	#superclass : #Object,
	#instVars : [
		'id',
		'description',
		'exampleMethod',
		'exampleMethods',
		'parameterizedExamples',
		'descriptionText',
		'simpleExampleText',
		'userStory'
	],
	#category : #MyMoldableRequirements
}

{ #category : #accessing }
MyScenario class >> fromRawData: scenariosDict [
	^ self
		id: (scenariosDict at: #id)
		description: (scenariosDict at: #description)
]

{ #category : #accessing }
MyScenario class >> id: aString description: anotherString [
	^ self new
		id: aString;
		description: anotherString;
		yourself
]

{ #category : #accessing }
MyScenario >> children [
	^ self parametrizedExamples
]

{ #category : #accessing }
MyScenario >> createAddExampleButton [
	^ BrButton new
		aptitude: BrGlamorousButtonWithLabelAptitude new;
		label: 'New parameterized example';
		action: [ ":button |
			button phlow spawnObject: (EScenarioParametrizedExampleCreationHelper new asScrollableElement) " ];
		margin:
			(BlInsets
				top: 10
				left: 10
				bottom: 10
				right: 0);
		constraintsDo: [ :c | c linear horizontal alignLeft ]
]

{ #category : #accessing }
MyScenario >> description [
	^ description
]

{ #category : #accessing }
MyScenario >> description: aString [
	description := aString
]

{ #category : #accessing }
MyScenario >> descriptionText [
	^ descriptionText
]

{ #category : #accessing }
MyScenario >> descriptionText: anObject [
	descriptionText := anObject
]

{ #category : #accessing }
MyScenario >> exampleMethod [
	^ exampleMethod
]

{ #category : #accessing }
MyScenario >> exampleMethod: aMethod [
	exampleMethod := aMethod
]

{ #category : #accessing }
MyScenario >> exampleMethods [
	^ exampleMethods
]

{ #category : #accessing }
MyScenario >> exampleMethods: list [
	list do: [ :item | self exampleMethods add: item ]
]

{ #category : #accessing }
MyScenario >> gtListOfExamplesFor: aView [
	<gtView>
	^ aView forward
		title: 'Examples';
		priority: 1;
		object: [ GtExampleGroup withAll: self exampleMethods asArray ];
		view: #gtExamplesFor:
]

{ #category : #accessing }
MyScenario >> gtListOfParametrizedExamplesFor: aView [
	<gtView>
	| phlowList listElement viewElement container |
	container := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
	phlowList := GtPhlowColumnedListView new
		items: [ self parametrizedExamples ];
		column: 'Index' item: [ :anElement :anIndex | anIndex ] width: 30;
		column: 'Method'
			item: [ :anElement | anElement exampleMethod gtParametrizedExample label ].
	listElement := phlowList
		asElementDo: [ :e | 
			e
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical fitContent ].
			e addChild: self createAddExampleButton ].
	container addChild: listElement.
	viewElement := aView explicit
		title: 'Parametrized examples';
		priority: 3;
		stencil: [ container ].
	^ viewElement
]

{ #category : #accessing }
MyScenario >> gtViewSource: aView [
	<gtView>
	self exampleMethod ifNil: [ ^ aView empty ].
	^ self exampleMethod gtCoderSourceFor: aView
]

{ #category : #accessing }
MyScenario >> id: aString [
	id := aString
]

{ #category : #accessing }
MyScenario >> parametrizedExamples [
	^ parameterizedExamples
]

{ #category : #accessing }
MyScenario >> printOn: aStream [
	aStream nextPutAll: description
]

{ #category : #accessing }
MyScenario >> simpleExampleText [
	^ simpleExampleText
]

{ #category : #accessing }
MyScenario >> simpleExampleText: anObject [
	simpleExampleText := anObject
]

{ #category : #accessing }
MyScenario >> userStory [
^userStory
]

{ #category : #accessing }
MyScenario >> userStory: aUserStory [
userStory := aUserStory
]

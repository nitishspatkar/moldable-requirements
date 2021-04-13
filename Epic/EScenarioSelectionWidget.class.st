Class {
	#name : #EScenarioSelectionWidget,
	#superclass : #EScenarioInputWidget,
	#traits : 'BuilderStringForGtExample + TypeFieldDependentChoice',
	#classTraits : 'BuilderStringForGtExample classTrait + TypeFieldDependentChoice classTrait',
	#instVars : [
		'exampleList'
	],
	#category : #'Epic-Model'
}

{ #category : #'instance creation' }
EScenarioSelectionWidget class >> forIndex: anIndex widgetModel: aWidget parametrizedExample: aParametrizedExample [
	| gtExamplesForClass methodDictionary |
	gtExamplesForClass:= self examplesForParametrizedExample: aParametrizedExample widgetModel: aWidget index: anIndex.
	methodDictionary := aParametrizedExample
		createMapFromCompiledMethodList: gtExamplesForClass.
	^  self new
			parameterIndex: anIndex;
			parameterName: aWidget parameterName;
			examples: methodDictionary values
]

{ #category : #accessing }
EScenarioSelectionWidget class >> widgetType [
	^ 'list'
]

{ #category : #initialization }
EScenarioSelectionWidget >> examples: aListOfExamples [
	exampleList items: aListOfExamples
]

{ #category : #initialization }
EScenarioSelectionWidget >> initialize [
	super initialize.
	exampleList := BrSimpleList new.
	"exampleList addEventHandler: (GtPhlowListToSelectHandler new)."
	exampleList
		itemStencil: [
			BrLabel new
				aptitude: BrGlamorousLabelAptitude new + (BrStyleCommonAptitude new
					selected: [ :aStyle | aStyle background: Color veryVeryLightGray ]);
				constraintsDo: [ :c | c horizontal matchParent ];
				hMatchParent;
				padding: (BlInsets all: 6) ];
		itemDataBinder: [ :eachElement :anExample :eachIndex | eachElement text: anExample label asRopedText ];
	
		"stencil: [ :anExample :index | 
			BrLabel new
				text: anExample label asRopedText;
				aptitude: BrLabelAptitude;
				constraintsDo: [ :c | c horizontal matchParent ];
				padding: (BlInsets all: 6);
				when: BlClickEvent
					do: [ :anEvent | 
						self halt.
						anEvent consumed: true.
						exampleList selectOne: index ] ];"
		fitContent;
		margin:
			(BlInsets
				left: 0;
				right: 0);
		border: (BlBorder paint: (Color fromHexString: 'D9D9D9') width: 0.5);
		geometry: (BlRectangle cornerRadius: 10).
	self addChild: exampleList
]

{ #category : #'grammar - Parameter' }
EScenarioSelectionWidget >> parameterValue [
	^ exampleList selectedIndices 
		ifEmpty: [ nil ]
		ifNotEmpty: [ :selectedIndexes | exampleList items at: selectedIndexes first ]. 
	
]

Class {
	#name : #EScenarioSelectionSpotterMultipleSelectionWidget,
	#superclass : #EScenarioInputWidget,
	#traits : 'BuilderStringForGtExampleArray + TypeFieldDependentChoice',
	#classTraits : 'BuilderStringForGtExampleArray classTrait + TypeFieldDependentChoice classTrait',
	#instVars : [
		'exampleContainer',
		'spotterDropDownAptitude',
		'examplesGroup',
		'selectedExamples'
	],
	#category : #'Epic-Model'
}

{ #category : #'instance creation' }
EScenarioSelectionSpotterMultipleSelectionWidget class >> forIndex: anIndex widgetModel: aWidget parametrizedExample: aParametrizedExample [
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
EScenarioSelectionSpotterMultipleSelectionWidget class >> widgetType [
	^ 'multipleSearch'
]

{ #category : #'as yet unclassified' }
EScenarioSelectionSpotterMultipleSelectionWidget >> actOnExampleDeleted: aChild [
	selectedExamples removeKey: aChild.
	self inform: selectedExamples.
	"exampleContainer removeChildren."
	"self halt."
	exampleContainer removeChild: aChild.
]

{ #category : #examples }
EScenarioSelectionSpotterMultipleSelectionWidget >> actOnExampleSelected: anExample [
	|labelElement|
	labelElement:= self createLabelForExample: anExample.
	selectedExamples at: labelElement put: anExample.
	exampleContainer addChild: labelElement.
	spotterDropDownAptitude hide
]

{ #category : #examples }
EScenarioSelectionSpotterMultipleSelectionWidget >> createLabelForExample: anExample [
	| container generatedlabel crossBox clickHandler |
	container := BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		background: (Color fromHexString: 'eaeaea');
		geometry: (BlRectangle cornerRadius: 5);
		margin: (BlInsets top: 2 bottom: 2).
	generatedlabel := BrLabel new
		text: anExample label;
		padding: (BlInsets all: 3);
		
		background: (Color fromHexString: 'eaeaea');
		aptitude: BrGlamorousLabelAptitude new glamorousRegularFontAndSize;
		constraintsDo: [ :c | c linear vertical alignCenter ].
	crossBox:= self getRemoveExampleButton
		constraintsDo: [ :c | c linear vertical alignCenter ].
		
	clickHandler := BlEventHandler
		on: BlClickEvent
		do: [
			self actOnExampleDeleted: container
			 ].
	crossBox addEventHandler: clickHandler.
	
	container addChild: generatedlabel.
	container addChild: crossBox.
	
	^ container
]

{ #category : #examples }
EScenarioSelectionSpotterMultipleSelectionWidget >> createSearchIcon [
	^ BrButton new
		background: (Color fromHexString: 'eaeaea');
		icon: BrGlamorousIcons search asElement;
		label: 'Search'
]

{ #category : #examples }
EScenarioSelectionSpotterMultipleSelectionWidget >> createSearchIconButtonWithNoExteriorAptitude [
	^ BrButton new
		aptitude: BrGlamorousButtonWithIconAptitude - BrGlamorousButtonExteriorAptitude;
		icon: BrGlamorousIcons search asElement
]

{ #category : #examples }
EScenarioSelectionSpotterMultipleSelectionWidget >> createSpotterDropdown [
	^ self createSearchIcon
		aptitude:
			BrGlamorousButtonWithIconAptitude
				+
					(spotterDropDownAptitude := BrGlamorousWithDropdownAptitude
						stencil: [ | model spotterElement |
							model := GtSpotter new initializeWith: self spotterStartModel.
							model announcer
								when: GtSpotterActOn
								do: [ :anEvent | 
									self actOnExampleSelected: anEvent realItem example.
									anEvent actedUpon: true ].
							model announcer
								when: GtSpotterExitAnnouncement
								do: [ :e | spotterDropDownAptitude hide ].
							spotterElement := GtSpotterElement new
								spotterModel: model;
								size: 700 @ 500.
							BlElement new
								aptitude:
									(BrGlamorousDropdownAptitude new
										handle: self createSearchIconButtonWithNoExteriorAptitude;
										content: spotterElement);
								background: BrGlamorousColors secondaryHeaderBackgroundColor ])
]

{ #category : #initialization }
EScenarioSelectionSpotterMultipleSelectionWidget >> examples: aListOfExamples [
	examplesGroup := GtExampleGroup withAll: aListOfExamples.
	examplesGroup examples do: #run
]

{ #category : #accessing }
EScenarioSelectionSpotterMultipleSelectionWidget >> examplesGroup [
	^ examplesGroup
]

{ #category : #'as yet unclassified' }
EScenarioSelectionSpotterMultipleSelectionWidget >> getCrossedBox [
	| box firstLine secondLine container |
	container := BlElement new
		"border: (BlBorder paint: Color green width: 5);"
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent ].
	box := BlElement new
		size: 18 @ 25;
		background: (Color fromHexString: 'eaeaea')
		"border:
			(BlBorder builder
				width: 0.7;
				paint: Color gray;
				build)".
	firstLine := BlLineElement new
		border: (BlBorder paint: (Color black)); constraintsDo: [ :c | c ignoreByLayout ].
	firstLine fromAnchor: (BlElementTopLeftAnchor element: box).
	firstLine toAnchor: (BlElementBottomRightAnchor element: box).
	secondLine := BlLineElement new
		border: (BlBorder paint: (Color black)); constraintsDo: [ :c | c ignoreByLayout ].
	secondLine fromAnchor: (BlElementTopRightAnchor element: box).
	secondLine toAnchor: (BlElementBottomLeftAnchor element: box).
	container addChild: box.
	container addChild: firstLine.
	container addChild: secondLine.
		
	^ container
]

{ #category : #'as yet unclassified' }
EScenarioSelectionSpotterMultipleSelectionWidget >> getRemoveExampleButton [
	^ BrButton new
		aptitude: BrGlamorousButtonWithIconAptitude - BrGlamorousButtonExteriorAptitude;
		icon: BrGlamorousIcons close asElement;
		beTiny;
		label: 'Remove example';
		margin: (BlInsets left: 5)";
		action: [ :button | self class gtBrowseFrom: button ]"

]

{ #category : #examples }
EScenarioSelectionSpotterMultipleSelectionWidget >> initialize [
	| container |
	super initialize.
	selectedExamples:= IdentityDictionary new.
	container := BlElement new
		layout: BlLinearLayout horizontal;
		padding: (BlInsets all: 6);
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal matchParent ].
	exampleContainer := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal matchParent ].
	container addChild: exampleContainer.
	container addChild: self createSpotterDropdown.
	self addChild: container
]

{ #category : #'grammar - Parameter' }
EScenarioSelectionSpotterMultipleSelectionWidget >> parameterValue [
	"^ selectedExamples values collect: [ :ex | ex run returnValue ]"
	^ selectedExamples values
]

{ #category : #examples }
EScenarioSelectionSpotterMultipleSelectionWidget >> spotterStartModel [
	^ ESearchableExamplesSpotterStartModel new
		viewSelector: #gtViewSpotterPreview:;
		examplesGroup: self examplesGroup
]

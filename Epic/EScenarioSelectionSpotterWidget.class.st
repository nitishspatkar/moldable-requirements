Class {
	#name : #EScenarioSelectionSpotterWidget,
	#superclass : #EScenarioInputWidget,
	#traits : 'BuilderStringForGtExample + TypeFieldDependentChoice',
	#classTraits : 'BuilderStringForGtExample classTrait + TypeFieldDependentChoice classTrait',
	#instVars : [
		'exampleContainer',
		'spotterDropDownAptitude',
		'examplesGroup',
		'selectedExample'
	],
	#category : #'Epic-Model'
}

{ #category : #'instance creation' }
EScenarioSelectionSpotterWidget class >> forIndex: anIndex widgetModel: aWidget parametrizedExample: aParametrizedExample [
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
EScenarioSelectionSpotterWidget class >> widgetType [
	^ 'search'
]

{ #category : #examples }
EScenarioSelectionSpotterWidget >> actOnExampleSelected:  anExample [
	selectedExample := anExample.
									exampleContainer removeChildren.
									exampleContainer
										addChild: (self createLabelForExample: anExample).
									
									spotterDropDownAptitude hide.
]

{ #category : #examples }
EScenarioSelectionSpotterWidget >> createLabelForExample: anExample [
	^ BrLabel new
		text: anExample label;
		margin: (BlInsets right: 5);
		padding: (BlInsets all: 3);
		geometry: (BlRectangle cornerRadius: 5);
		background: (Color fromHexString: 'eaeaea');
		aptitude: BrGlamorousLabelAptitude new glamorousRegularFontAndSize;
		constraintsDo: [ :c | c linear vertical alignCenter ]
]

{ #category : #examples }
EScenarioSelectionSpotterWidget >> createSearchIcon [
	^ BrButton new
		background: (Color fromHexString: 'eaeaea');
		icon: BrGlamorousIcons search asElement;
		label: 'Search'
]

{ #category : #examples }
EScenarioSelectionSpotterWidget >> createSearchIconButtonWithNoExteriorAptitude [
	^ BrButton new
												aptitude: BrGlamorousButtonWithIconAptitude - BrGlamorousButtonExteriorAptitude;
												icon: BrGlamorousIcons search asElement
]

{ #category : #examples }
EScenarioSelectionSpotterWidget >> createSpotterDropdown [
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
EScenarioSelectionSpotterWidget >> examples: aListOfExamples [
	examplesGroup := GtExampleGroup withAll: aListOfExamples.
	examplesGroup examples do: #run.
]

{ #category : #initialization }
EScenarioSelectionSpotterWidget >> examplesGroup [
	^ examplesGroup
]

{ #category : #examples }
EScenarioSelectionSpotterWidget >> initialize [
	| container |
	super initialize.
	container := BlElement new
		layout: BlLinearLayout horizontal;
		padding: (BlInsets all: 6);
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal matchParent ].
	exampleContainer := BlElement new
		layout: BlFrameLayout new;
		constraintsDo: [ :c | 
			c vertical matchParent.
			c horizontal matchParent ].
	container addChild: exampleContainer.
	container addChild: self createSpotterDropdown.
	self addChild: container
]

{ #category : #'grammar - Parameter' }
EScenarioSelectionSpotterWidget >> parameterValue [
	^ selectedExample 
]

{ #category : #examples }
EScenarioSelectionSpotterWidget >> spotterStartModel [
	^ (ESearchableExamplesSpotterStartModel new
			viewSelector: #gtViewSpotterPreview:;
			examplesGroup: self examplesGroup)
]

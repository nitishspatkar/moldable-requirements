Class {
	#name : #EScenarioTextInputWidget,
	#superclass : #EScenarioInputWidget,
	#traits : 'BuilderStringForString',
	#classTraits : 'BuilderStringForString classTrait',
	#instVars : [
		'editor'
	],
	#category : #'Epic-Model'
}

{ #category : #'instance creation' }
EScenarioTextInputWidget class >> forIndex: anIndex widgetModel: aWidget parametrizedExample: aParametrizedExample [
	^ self new
			parameterIndex: anIndex;
			parameterName: aWidget parameterName
]

{ #category : #accessing }
EScenarioTextInputWidget class >> widgetType [
	^ 'StringInput'
]

{ #category : #'as yet unclassified' }
EScenarioTextInputWidget >> initialize [
	| editorAptitude interactiveAptitude |
	super initialize.

	editorAptitude := BrGlamorousRegularEditorAptitude new fontSize: 15.
	editor := BrEditor new
		text: '';
		aptitude:
			editorAptitude;
		border: (BlBorder paint: BrGlamorousColors editorBorderColor width: 1);
		geometry: (BlRectangle cornerRadius: 10);
		"hFitContent;"
			hMatchParent;
		vExact: 40;
		"vExact: 40;"
			constraintsDo: [ :c | 
			c minWidth: 100.
			c padding: (BlInsets all: 10).
			c linear horizontal alignLeft.
			"c vertical matchParent."
			c linear weight: 0.3 ].
	editor
		in: [ :e | 
			e editor
				when: BrTextEditorInsertedEvent
				do: [" self inform: 'Target ' , e editor text "] ].
	self addChild: editor
]

{ #category : #'grammar - Parameter' }
EScenarioTextInputWidget >> parameterValue [
	^ editor editor text asString
]

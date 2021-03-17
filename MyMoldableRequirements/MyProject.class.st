Class {
	#name : #MyProject,
	#superclass : #Object,
	#instVars : [
		'id',
		'title',
		'epics'
	],
	#category : #MyMoldableRequirements
}

{ #category : #accessing }
MyProject class >> fromRawData: projectDict [
	^ self
		id: (projectDict at: #id)
		title: (projectDict at: #title)
		epics:
			((projectDict at: #epics)
				collect: [ :featureDict | MyEpic fromRawData: featureDict ])
]

{ #category : #accessing }
MyProject class >> id: aString title: anotherString epics: anArray [
	^ self new
		id: aString;
		title: anotherString;
		epics: anArray;
		yourself
]

{ #category : #accessing }
MyProject >> epics: anArray [
	epics := anArray asOrderedCollection
]

{ #category : #accessing }
MyProject >> gtEpicsFor: aView [
	<gtView>
	^ (epics gtItemsFor: aView)
		title: 'Epics';
		actionDropdownButtonIcon: BrGlamorousVectorIcons add
			tooltip: 'Add an Epic'
			content: [ | label |
			BlElement new
				layout: BlLinearLayout horizontal;
				constraintsDo: [ :c | 
					c vertical fitContent.
					c horizontal fitContent ];
				padding: (BlInsets all: 5);
				addChild:
					(label := BrEditableLabel new
						look: BrGlamorousEditableLabelLook new glamorousRegularFontAndSize;
						yourself);
				addChild:
					(BrButton new
						look: BrGlamorousButtonWithIconLook;
						icon: BrGlamorousVectorIcons accept;
						label: 'Save';
						action: [ epics
								add:
									(MyEpic
										id: nil
										title: label text asString
										description: ''
										userStories: OrderedCollection new) ];
						yourself);
				yourself ]
]

{ #category : #accessing }
MyProject >> gtParseJSONExample [
	<gtExample>
	| rawData projectsDictionaries |
	rawData := FileLocator imageDirectory asFileReference
		/
			'pharo-local/iceberg/nitishspatkar/GT-hands-on/dummy_json_requirements.json'.
	projectsDictionaries := STONJSON fromString: rawData.
	^ projectsDictionaries
		collect: [ :projectDict | MyProject fromRawData: projectDict ]
]

{ #category : #accessing }
MyProject >> id: aString [
	id := aString
]

{ #category : #accessing }
MyProject >> printOn: aStream [
	aStream nextPutAll: title
]

{ #category : #accessing }
MyProject >> title: anotherString [
	title := anotherString
]

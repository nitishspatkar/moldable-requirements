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
		id: (projectDict at: #id ifAbsent: nil)
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
			tooltip: 'Add an epic'
			content: [ | epic |
			epic := MyEpic
				id: nil
				title: ''
				description: ''
				userStories: [  ].
			epic asFormElement: [ epics add: epic ] ]
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

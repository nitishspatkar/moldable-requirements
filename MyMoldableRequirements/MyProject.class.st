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
				collect: [ :epicDict | MyEpic fromRawData: epicDict ])
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
	epics := anArray
]

{ #category : #accessing }
MyProject >> gtParseJSONExample [
	<gtExample>
	| rawData projectsDictionaries |
	rawData := 'pharo-local/iceberg/nitishspatkar/GT-hands-on/dummy_json_requirements.json'
		asFileReference.
	projectsDictionaries := STONJSON fromString: rawData.
	^ projectsDictionaries collect: [ :projectDict | MyProject new ]
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

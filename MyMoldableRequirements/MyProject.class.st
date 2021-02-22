Class {
	#name : #MyProject,
	#superclass : #Object,
	#instVars : [
		'id',
		'title',
		'features'
	],
	#category : #MyMoldableRequirements
}

{ #category : #accessing }
MyProject class >> fromRawData: projectDict [
	^ self
		id: (projectDict at: #id)
		title: (projectDict at: #title)
		features:
			((projectDict at: #features)
				collect: [ :featureDict | MyFeature fromRawData: featureDict ])
]

{ #category : #accessing }
MyProject class >> id: aString title: anotherString features: anArray [
	^ self new
		id: aString;
		title: anotherString;
		features: anArray;
		yourself
]

{ #category : #accessing }
MyProject >> features: anArray [
	features := anArray
]

{ #category : #accessing }
MyProject >> gtParseJSONExample [
	<gtExample>
	| rawData projectsDictionaries |
	rawData := 'pharo-local/iceberg/nitishspatkar/GT-hands-on/dummy_json_requirements.json'
		asFileReference.
	projectsDictionaries := STONJSON fromString: rawData.
	^ projectsDictionaries collect: [ :projectDict | MyProject fromRawData: projectDict ]
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

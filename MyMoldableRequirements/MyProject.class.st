Class {
	#name : #MyProject,
	#superclass : #Object,
	#category : #MyMoldableRequirements
}

{ #category : #accessing }
MyProject >> gtParseJSONExample [
	<gtExample>
	| rawData projectsDictionaries |
	rawData := 'pharo-local/iceberg/nitishspatkar/GT-hands-on/dummy_json_requirements.json'
		asFileReference.
	projectsDictionaries := STONJSON fromString: rawData.
	^ projectsDictionaries collect: [ :projectDict | MyProject new ]
]

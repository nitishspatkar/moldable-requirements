Class {
	#name : #MyProject,
	#superclass : #Object,
	#instVars : [
		'id',
		'title',
		'epics',
		'teamMembers',
		'personas'
	],
	#category : #MyMoldableRequirements
}

{ #category : #accessing }
MyProject class >> fromRawData: projectDict [
	^ self
		id: (projectDict at: #id)
		title: (projectDict at: #title)
		teamMembers: ((projectDict at: #teamMembers) collect: [ :teamDict | MyTeamMembers fromRawData: teamDict ])
		epics:
			((projectDict at: #epics)
				collect: [ :featureDict | MyEpic fromRawData: featureDict ])
		personas: ((projectDict at: #personas)
				collect: [ :personaDict | MyPersona fromRawData: personaDict ])
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
MyProject class >> id: aString title: anotherString teamMembers: anArray epics: anotherArray personas: yetAnotherArray [
	^ self new
		id: aString;
		title: anotherString;
		teamMembers: anArray;
		epics: anotherArray;
		personas: yetAnotherArray;
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
MyProject >> personas: yetAnotherArray [ 
personas := yetAnotherArray
]

{ #category : #accessing }
MyProject >> printOn: aStream [
	aStream nextPutAll: title
]

{ #category : #accessing }
MyProject >> teamMembers: anArray [ 
teamMembers := anArray
]

{ #category : #accessing }
MyProject >> title: anotherString [
	title := anotherString
]

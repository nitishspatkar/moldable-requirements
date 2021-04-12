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
MyProject class >> id: aString title: anotherString teamMembers: anArray epics: anotherArray personas: yetAnotherArray [
	^ self new
		id: aString;
		title: anotherString;
		teamMembers: anArray;
		epics: anotherArray asOrderedCollection;
		personas: yetAnotherArray;
		yourself
]

{ #category : #accessing }
MyProject >> epics: anArray [
	epics := anArray do: [ :each | each project: self]
]

{ #category : #accessing }
MyProject >> gtEpicsFor: aView [
	<gtView>
	^ (epics gtItemsFor: aView)
		title: 'Epics';
		priority: 0;
		actionDropdownButtonIcon: BrGlamorousVectorIcons add
			tooltip: 'Add an epic'
			content: [ | epic |
			epic := MyEpic
				id: nil
				title: ''
				description: ''
				userStories:OrderedCollection new.
			epic project: self.
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
MyProject >> gtPersonasFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Personas';
		priority: 1;
		items: [personas];
		column: 'Index'
			text: [:eachPersona :eachIndex | eachIndex]
			width: 50;
		column: 'Name'
			text: [:eachPersona | eachPersona name]
			width: 200;
		column: 'Description'
			text: [:eachPersona | eachPersona description];		
		actionDropdownButtonIcon: BrGlamorousVectorIcons add
			tooltip: 'Add a persona'
			content: [ | persona |
			persona := MyPersona
				name: ''
				description: ''.
			persona asFormElement: [ personas add: persona ] ]
]

{ #category : #accessing }
MyProject >> gtTeamMembersFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Team';
		priority: 2;
		items: [teamMembers];
		column: 'Index'
			text: [:eachMember :eachIndex | eachIndex]
			width: 50;
		column: 'Name'
			text: [:eachMember | eachMember name];
		column: 'Shorthand'
			text: [:eachMember | eachMember shorthand];
		actionDropdownButtonIcon: BrGlamorousVectorIcons add
			tooltip: 'Add a teammember'
			content: [ | member |
			member := MyTeamMembers
				name: ''
				shorthand: ''.
			member asFormElement: [ teamMembers add: member ] ]
]

{ #category : #accessing }
MyProject >> id: aString [
	id := aString
]

{ #category : #accessing }
MyProject >> personas [
^personas
]

{ #category : #accessing }
MyProject >> personas: yetAnotherArray [ 
personas := yetAnotherArray asOrderedCollection
]

{ #category : #accessing }
MyProject >> printOn: aStream [
	aStream nextPutAll: title
]

{ #category : #accessing }
MyProject >> teamMember [
^teamMembers
]

{ #category : #accessing }
MyProject >> teamMembers [
^teamMembers
]

{ #category : #accessing }
MyProject >> teamMembers: anArray [ 
teamMembers := anArray asOrderedCollection
]

{ #category : #accessing }
MyProject >> title: anotherString [
	title := anotherString
]

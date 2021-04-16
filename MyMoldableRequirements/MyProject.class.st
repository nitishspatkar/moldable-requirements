Class {
	#name : #MyProject,
	#superclass : #Object,
	#instVars : [
		'id',
		'title',
		'epics',
		'teamMembers',
		'personas',
		'labels',
		'announcer',
		'board'
	],
	#category : #'MyMoldableRequirements-Models'
}

{ #category : #accessing }
MyProject class >> fromRawData: projectDict [
	^ self
		id: (projectDict at: #id)
		title: (projectDict at: #title)
		board: (projectDict at: #board)
		teamMembers: ((projectDict at: #teamMembers) collect: [ :teamDict | MyTeamMembers fromRawData: teamDict ])
		epics:
			((projectDict at: #epics)
				collect: [ :featureDict | MyEpic fromRawData: featureDict ])
		personas: ((projectDict at: #personas)
				collect: [ :personaDict | MyPersona fromRawData: personaDict ])
		labels: ((projectDict at: #labels)
				collect: [ :labelDict | MyLabel fromRawData: labelDict ])
]

{ #category : #accessing }
MyProject class >> id: aString title: anotherString board: aBoard teamMembers: anArray epics: anotherArray personas: yetAnotherArray labels: labelArray [
	^ self new
		id: aString;
		title: anotherString;
		board: aBoard;
		teamMembers: anArray asOrderedCollection;
		epics: anotherArray asOrderedCollection;
		personas: yetAnotherArray asOrderedCollection;
		labels: labelArray asOrderedCollection;
		yourself
]

{ #category : #accessing }
MyProject class >> id: aString title: anotherString teamMembers: anArray epics: anotherArray personas: yetAnotherArray labels: labelArray [
	^ self new
		id: aString;
		title: anotherString;
		teamMembers: anArray asOrderedCollection;
		epics: anotherArray asOrderedCollection;
		personas: yetAnotherArray asOrderedCollection;
		labels: labelArray asOrderedCollection;
		yourself
]

{ #category : #accessing }
MyProject >> announcer [
^announcer
]

{ #category : #accessing }
MyProject >> announcer: anAnnouncer [
announcer := anAnnouncer
]

{ #category : #accessing }
MyProject >> board: aBoard [
board := MyBoard new fromRawData: aBoard
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
		updateWhen: MyUserStoryStatusChange in: [ announcer ];
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
MyProject >> gtLabelsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Labels';
		priority: 3;
		updateWhen: MyUserStoryStatusChange in: [ announcer ];
		items: [labels];
		column: 'Index'
			text: [:eachLabel :eachIndex | eachIndex]
			width: 50;
		column: 'Description'
			text: [:eachLabel | eachLabel description]
			width: 200;	
		actionDropdownButtonIcon: BrGlamorousVectorIcons add
			tooltip: 'Add a label'
			content: [ | label |
			label := MyLabel
				id: nil
				description: ''
				color: ''.
			label project: self.
			label asFormElement: [ labels add: label ] ]
]

{ #category : #accessing }
MyProject >> gtParseJSONExample [
	<gtExample>
	| rawData projectsDictionaries |
		
	rawData := GtResourcesUtility uniqueInstance resourceAtPath: 'nitishspatkar/moldable-requirements/dummy_json_requirements.json'.
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
		updateWhen: MyUserStoryStatusChange in: [announcer];
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
			persona project: self.
			persona asFormElement: [ personas add: persona ] ]
]

{ #category : #accessing }
MyProject >> gtTeamMembersFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Team';
		priority: 2;
		updateWhen: MyUserStoryStatusChange in: [ announcer ];
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
			member project: self.
			member asFormElement: [ teamMembers add: member ] ]
]

{ #category : #accessing }
MyProject >> id: aString [
	id := aString
]

{ #category : #accessing }
MyProject >> initialize [
	super initialize.
	announcer:= Announcer new
]

{ #category : #accessing }
MyProject >> labels [
^labels
]

{ #category : #accessing }
MyProject >> labels: anArray [
labels := anArray do: [ :each | each project: self]
]

{ #category : #accessing }
MyProject >> personas [
^personas
]

{ #category : #accessing }
MyProject >> personas: yetAnotherArray [ 
personas := yetAnotherArray do: [ :each | each project: self]
]

{ #category : #accessing }
MyProject >> printOn: aStream [
	aStream nextPutAll: title
]

{ #category : #accessing }
MyProject >> teamMembers [
^teamMembers
]

{ #category : #accessing }
MyProject >> teamMembers: anArray [ 
teamMembers := anArray do: [ :each | each project: self]
]

{ #category : #accessing }
MyProject >> title: anotherString [
	title := anotherString
]

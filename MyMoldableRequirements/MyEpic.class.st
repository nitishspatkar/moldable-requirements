Class {
	#name : #MyEpic,
	#superclass : #Object,
	#instVars : [
		'id',
		'title',
		'description',
		'userStories',
		'statusColor',
		'project',
		'announcer'
	],
	#category : #MyMoldableRequirements
}

{ #category : #accessing }
MyEpic class >> fromRawData: epicDict [
	^ self
		id: (epicDict at: #id)
		title: (epicDict at: #title)
		description: (epicDict at: #description)
		userStories:
			((epicDict at: #'user-stories')
				collect: [ :userStoriesDict | MyUserStory fromRawData: userStoriesDict ])
]

{ #category : #accessing }
MyEpic class >> id: aString title: anotherString description: yetAnotherString userStories: anArray [
	^ self new
		id: aString;
		title: anotherString;
		description: yetAnotherString;
		userStories: anArray asOrderedCollection;
		yourself
]

{ #category : #accessing }
MyEpic >> announcer [
^announcer
]

{ #category : #accessing }
MyEpic >> announcer: anAnnouncer [
announcer := anAnnouncer
]

{ #category : #accessing }
MyEpic >> asFormElement: aBlock [
	"an epic presents itself as a form to be filled and save as an object"

	| label textElementDescription |
	textElementDescription := GtDocument new asElementWithoutSaveAction
		vFitContent;
		hMatchParent;
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 2);
		padding: (BlInsets all: 3);
		margin: (BlInsets top: 3 bottom: 3);
		geometry: (BlRectangle cornerRadius: 5).
	^ BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal exact: 300 ];
		padding: (BlInsets all: 5);
		addChild:
			(BrLabel new
				look: BrGlamorousLabelLook;
				beLargeSize;
				text: 'Epic Description';
				yourself);
		addChild: textElementDescription;
		addChild:
			(BrButton new
				look: BrGlamorousButtonWithIconLook;
				icon: BrGlamorousVectorIcons accept;
				label: 'Save';
				action: [ title := textElementDescription document text asString.
					"The following line means that when we click the save button, the arguement i.e., aBlock is evaluated"
					aBlock value ];
				yourself);
		yourself
]

{ #category : #accessing }
MyEpic >> description: yetAnotherString [
	description := yetAnotherString
]

{ #category : #accessing }
MyEpic >> gtUserStoriesFor: aView [
	<gtView>
	^ (userStories gtItemsFor: aView)
		title: 'User stories';
		priority: 0;
		actionDropdownButtonIcon: BrGlamorousVectorIcons add
			tooltip: 'Add a user story'
			content: [ | story |
			story := MyUserStory
				id: nil
				role: ''
				means: ''
				benefit: ''
				acceptanceCriteria: ''
				status: ''
				points: nil
				scenarios: OrderedCollection new
				personas: OrderedCollection new
				assignees: OrderedCollection new
				labels: OrderedCollection new
				tasks: OrderedCollection new
				notes: OrderedCollection new.
			story epic: self.
			story asFormElement: [ userStories add: story ] ]
]

{ #category : #accessing }
MyEpic >> gtViewMindMapStoryTree: aView [
"Tree Mind Map for epic status and its user stories"
	<gtView>
	^ aView mondrian
		title: 'Tree' translated;
			priority: 1;
			updateWhen: MyUserStoryStatusChange in: [announcer];
			painting: [ :view |
				view nodes 
					stencil: [ :x | 
						BlElement new 
							border: (BlBorder paint: Color black width: 0.5);
							background: x statusColor;
							geometry: BlEllipse new;
							size: (20)@(20)];
					with: (self requirements).
					view edges connectFrom: [ :x | x ] toAll: [ :x | x subItems ];
		shape: [ :x | 
			BlLineElement new
				border: (BlBorder paint: (Color red alpha: 0.5) width: 5) ].
				view layout tree]
]

{ #category : #accessing }
MyEpic >> id: aString [
	id := aString
]

{ #category : #accessing }
MyEpic >> initialize [
	super initialize.
	announcer := Announcer new.
]

{ #category : #accessing }
MyEpic >> printOn: aStream [
	aStream nextPutAll: title
]

{ #category : #accessing }
MyEpic >> project [ 
^project
]

{ #category : #accessing }
MyEpic >> project: aProject [
project := aProject
]

{ #category : #accessing }
MyEpic >> requirements [
"requirements for the tree mind map view"
	| requirements |
	requirements := userStories copy.
	requirements add: self.
	^requirements
]

{ #category : #accessing }
MyEpic >> statusColor [
	| countNot countDoing countDone |
	countNot := 0.
	countDoing := 0.
	countDone := 0.
	userStories
		collect: [ :each | 
			each status = 'not-started'
				ifTrue: [ countNot := countNot + 1 ].
			each status = 'in-progress'
				ifTrue: [ countDoing := countDoing + 1 ].
			each status = 'done'
				ifTrue: [ countDone := countDone + 1 ] ].
	countDoing ~= 0
		ifTrue: [ ^Color lightYellow ]
		ifFalse: [ countNot ~= 0
				ifTrue: [ ^Color lightRed ]
				ifFalse: [^Color lightGreen ] ]
]

{ #category : #accessing }
MyEpic >> subItems [
	^ self userStories
]

{ #category : #accessing }
MyEpic >> title [ 
^title
]

{ #category : #accessing }
MyEpic >> title: anotherString [
	title := anotherString
]

{ #category : #accessing }
MyEpic >> userStories [
	^ userStories
]

{ #category : #accessing }
MyEpic >> userStories: anArray [
	
	userStories := anArray do: [ :each | each notNil ifTrue: [each epic: self]]
		
]

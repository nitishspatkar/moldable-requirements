Class {
	#name : #MyNotes,
	#superclass : #Object,
	#instVars : [
		'note',
		'author',
		'id',
		'userStory'
	],
	#category : #'MyMoldableRequirements-Models'
}

{ #category : #accessing }
MyNotes class >> fromRawData: notesDict [ 
^ self
	id: (notesDict at: #id)
	note: (notesDict at: #description)
	author: (notesDict at: #author)
]

{ #category : #accessing }
MyNotes class >> id: aNumber note: aString author: anotherString [
^ self new
	id: aNumber;
	notes: aString;
	author: anotherString
	yourself 
]

{ #category : #accessing }
MyNotes >> asFormElement: aBlock [
	"an epic presents itself as a form to be filled and save as an object"

	| label textElementDescription authorElementDescription |
	textElementDescription := GtDocument new asElementWithoutSaveAction
		vFitContent;
		hMatchParent;
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 2);
		padding: (BlInsets all: 3);
		margin: (BlInsets top: 3 bottom: 3);
		geometry: (BlRectangle cornerRadius: 5).
	authorElementDescription := GtDocument new asElementWithoutSaveAction
		vFitContent;
		hMatchParent;
		border: (BlBorder paint: (Color fromHexString: 'eaeaea') width: 2);
		padding: (BlInsets all: 3);
		margin: (BlInsets top: 3 bottom: 3);
		geometry: (BlRectangle cornerRadius: 5).
	^ BlElement new
		layout: BlLinearLayout vertical;
		padding: (BlInsets all: 5);
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal exact: 300 ];
		addChild:
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				text: 'Note:';
				beNormalSize);
		addChild: textElementDescription;
		addChild:
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				text: 'Your Name:';
				beNormalSize);
		addChild: authorElementDescription;
		addChild:
			(BrButton new
				aptitude: BrGlamorousButtonWithIconAptitude;
				icon: BrGlamorousVectorIcons accept;
				beSmallSize;
				label: 'Save';
				action: [ 
				note := textElementDescription document text asString.
				author := authorElementDescription document text asString.
				self assert:[author notEmpty].
				(self userStory announcer) announce: MyUserStoryStatusChange.
					"The following line means that when we click the save button, the arguement i.e., aBlock is evaluated"
					aBlock value ];
				yourself);
		yourself
]

{ #category : #accessing }
MyNotes >> author [
^author
]

{ #category : #accessing }
MyNotes >> author: aString [
author := aString 
]

{ #category : #accessing }
MyNotes >> description [
^note
]

{ #category : #accessing }
MyNotes >> id: aNumber [ 
id := aNumber
]

{ #category : #accessing }
MyNotes >> notes: aString [
note := aString 
]

{ #category : #accessing }
MyNotes >> printOn: aStream [
	aStream nextPutAll: note
]

{ #category : #accessing }
MyNotes >> userStory [
^userStory
]

{ #category : #accessing }
MyNotes >> userStory: aStory [
userStory := aStory
]

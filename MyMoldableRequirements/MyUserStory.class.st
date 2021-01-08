Class {
	#name : #MyUserStory,
	#superclass : #Object,
	#instVars : [
		'id',
		'description',
		'status',
		'points'
	],
	#category : #MyMoldableRequirements
}

{ #category : #accessing }
MyUserStory class >> fromRawData: userStoryDict [
	^ self
		id: (userStoryDict at: #id)
		status: (userStoryDict at: #status)
		description: (userStoryDict at: #description)
		points: (userStoryDict at: #points)
]

{ #category : #accessing }
MyUserStory class >> id: aString status: anotherString description: yetAnotherString points: aNumber [
	^ self new
		id: aString;
		status: anotherString;
		description: yetAnotherString;
		points: aNumber;
		yourself
]

{ #category : #accessing }
MyUserStory >> asStoryCard [
	"Returns a bloc element that renders a card"

	^ BlElement new
		layout: BlLinearLayout vertical;
		addChild:
			(BrEditableLabel new
				look: BrGlamorousEditableLabelLook new glamorousRegularFontAndSize;
				text: description;
				when: BrEditorAcceptWish
					do: [ :aWish | description := aWish text ];
				yourself);
		addChild:
			(BrEditableLabel new
				look: BrGlamorousEditableLabelLook new glamorousRegularFontAndSize;
				text: status;
				when: BrEditorAcceptWish
					do: [ :aWish | status := aWish text ];
				yourself);
		addChild:
			(BrEditableLabel new
				look: BrGlamorousEditableLabelLook new glamorousRegularFontAndSize;
				text: points;
				when: BrEditorAcceptWish
					do: [ :aWish | points := aWish text ];
				yourself);
		yourself
]

{ #category : #accessing }
MyUserStory >> description: yetAnotherString [
	description := yetAnotherString
]

{ #category : #accessing }
MyUserStory >> gtStoryCardFor: aView [
	<gtView>
	^ aView explicit
		title: 'Story card';
		priority: 1;
		stencil: [ self asStoryCard
				look: BrShadowLook;
				background: Color white;
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ];
				padding: (BlInsets all: 5);
				yourself ]
]

{ #category : #accessing }
MyUserStory >> id: aString [
	id := aString
]

{ #category : #accessing }
MyUserStory >> points: aNumber [
	points := aNumber
]

{ #category : #accessing }
MyUserStory >> printOn: aStream [
	aStream nextPutAll: description
]

{ #category : #accessing }
MyUserStory >> status: anotherString [
	status := anotherString
]

{ #category : #accessing }
MyUserStory >> title: anotherString [ 
]

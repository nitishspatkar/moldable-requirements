Class {
	#name : #ReqIFHeader,
	#superclass : #Object,
	#instVars : [
		'comment',
		'creationTime',
		'identifier',
		'repositoryId',
		'reqIFToolId',
		'reqIFVersion',
		'sourceToolId',
		'title',
		'documentRoot'
	],
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
ReqIFHeader >> asEditView [
	| container lineContainer |
	
	container := BlElement new
		layout: BlLinearLayout vertical;
		margin: (BlInsets left: 10);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent].

	"Title"
	lineContainer := BlElement new
		layout: BlLinearLayout horizontal;
		margin: (BlInsets top: 10);
		background: Color white;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent].
	lineContainer addChild:
		(BrLabel new
			aptitude: BrGlamorousLabelAptitude;
			beLargeSize;
			margin: (BlInsets right: 20);
			text: 'Title';
			yourself).
	lineContainer addChild: 
		(BrEditableLabel new
			aptitude: BrGlamorousEditableLabelAptitude new glamorousRegularFontAndSize;
			text: title;
			when: BrEditorAcceptWish do: [ :aWish | 
				title := aWish text asString.
				documentRoot announcer announce: (HeaderChanged new) ];
			yourself).
	
	container addChild: lineContainer.
	
	"Comment"
	lineContainer := BlElement new
		layout: BlLinearLayout horizontal;
		margin: (BlInsets top: 10);
		background: Color white;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent].
	lineContainer addChild:
		(BrLabel new
			aptitude: BrGlamorousLabelAptitude;
			beLargeSize;
			margin: (BlInsets right: 20);
			text: 'Comment';
			yourself).
	lineContainer addChild: 
		(BrEditableLabel new
			aptitude: BrGlamorousEditableLabelAptitude new glamorousRegularFontAndSize;
			text: comment;
			when: BrEditorAcceptWish do: [ :aWish | 
				comment := aWish text asString.
				documentRoot announcer announce: (HeaderChanged new) ];
			yourself).
	
	container addChild: lineContainer.
	
	^ container
]

{ #category : #accessing }
ReqIFHeader >> comment [
	^ comment
]

{ #category : #accessing }
ReqIFHeader >> comment: anObject [
	comment := anObject
]

{ #category : #accessing }
ReqIFHeader >> creationTime [
	^ creationTime
]

{ #category : #accessing }
ReqIFHeader >> creationTime: anObject [
	creationTime := anObject
]

{ #category : #accessing }
ReqIFHeader >> documentRoot [
	^ documentRoot
]

{ #category : #accessing }
ReqIFHeader >> documentRoot: anObject [
	documentRoot := anObject
]

{ #category : #accessing }
ReqIFHeader >> gtEditHeaderOn: aView [
	<gtView>
	^ aView explicit
		title: 'Edit Header';
		priority: 0;
		stencil: [
			self asEditView
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical fitContent ];
				yourself
		]
]

{ #category : #accessing }
ReqIFHeader >> identifier [
	^ identifier
]

{ #category : #accessing }
ReqIFHeader >> identifier: anObject [
	identifier := anObject
]

{ #category : #accessing }
ReqIFHeader >> repositoryId [
	^ repositoryId
]

{ #category : #accessing }
ReqIFHeader >> repositoryId: anObject [
	repositoryId := anObject
]

{ #category : #accessing }
ReqIFHeader >> reqIFToolId [
	^ reqIFToolId
]

{ #category : #accessing }
ReqIFHeader >> reqIFToolId: anObject [
	reqIFToolId := anObject
]

{ #category : #accessing }
ReqIFHeader >> reqIFVersion [
	^ reqIFVersion
]

{ #category : #accessing }
ReqIFHeader >> reqIFVersion: anObject [
	reqIFVersion := anObject
]

{ #category : #accessing }
ReqIFHeader >> sourceToolId [
	^ sourceToolId
]

{ #category : #accessing }
ReqIFHeader >> sourceToolId: anObject [
	sourceToolId := anObject
]

{ #category : #accessing }
ReqIFHeader >> title [
	^ title
]

{ #category : #accessing }
ReqIFHeader >> title: anObject [
	title := anObject
]

{ #category : #accessing }
ReqIFHeader >> writeOn: aWriter [	
	aWriter tag
		name: 'REQ-IF-HEADER';
		attributeAt: 'IDENTIFIER' put: (self identifier);
		with: [
			aWriter
				tag: 'COMMENT' with: (self comment);
				tag: 'CREATION-TIME' with: (self creationTime);
				tag: 'REQ-IF-TOOL-ID' with: 'GT-ReqIF';
				tag: 'REQ-IF-VERSION' with: (self reqIFVersion);
				tag: 'SOURCE-TOOL-ID' with: (self sourceToolId);
				tag: 'TITLE' with: (self title).
		]
]

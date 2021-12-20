Class {
	#name : #MyUserStoryDomainConceptsListElement,
	#superclass : #BrVerticalPane,
	#traits : 'TMyWithUserStoryDomainConcepts',
	#classTraits : 'TMyWithUserStoryDomainConcepts classTrait',
	#instVars : [
		'list'
	],
	#category : 'MyMoldableRequirements-User Story - Views'
}

{ #category : #initialization }
MyUserStoryDomainConceptsListElement >> initialize [
	super initialize.
	
	self matchParent.
	
	list := BrSimpleList new.
	list itemStencil: [
		BrLabel new
			hMatchParent;
			aptitude: BrGlamorousLabelAptitude + BrGlamorousListItemAptitude;
			padding: (BlInsets all: 3);
			when: BlClickEvent do: [ :anEvent |
				anEvent consumed: true.
				anEvent currentTarget phlow spawnTool: (GtPhlowValuableTool new valuable: (MyUserStoryDomainConceptEditorElement new userStoryDomainConcept: anEvent currentTarget viewModel model)) ] ].
	list itemDataBinder: [ :eachElement :eachConcept |
		eachElement viewModel model: eachConcept.
		eachElement text: eachConcept name ].
	
	self addChild: list
]

{ #category : #'api - user story domain concepts' }
MyUserStoryDomainConceptsListElement >> onUserStoryDomainConceptsChanged [
	"Is sent when a new userStoryDomainConcepts is assigned to the receiver.
	Note: #onUserStoryDomainConceptsChanged is sent before #subscribeToUserStoryDomainConcepts
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostUserStoryDomainConceptsChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
	
	list items: self userStoryDomainConcepts userStoryDomainConcepts
]

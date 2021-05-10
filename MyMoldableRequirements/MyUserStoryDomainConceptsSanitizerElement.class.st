Class {
	#name : #MyUserStoryDomainConceptsSanitizerElement,
	#superclass : #BrVerticalPane,
	#traits : 'TMyWithUserStoryDomainConcepts',
	#classTraits : 'TMyWithUserStoryDomainConcepts classTrait',
	#instVars : [
		'list',
		'acceptConcepts'
	],
	#category : #'MyMoldableRequirements-User Story - Views'
}

{ #category : #initialization }
MyUserStoryDomainConceptsSanitizerElement >> initialize [
	super initialize.
	
	self matchParent.
	
	list := BrSimpleList new.
	list itemStencil: [ MyUserStoryDomainConceptElement new ].
	list itemDataBinder: [ :eachElement :eachConcept | eachElement userStoryDomainConcept: eachConcept ].
	
	self addChild: list.
	
	acceptConcepts := BrButton new
		aptitude: BrGlamorousButtonWithLabelAptitude new;
		label: 'Accept';
		action: [ :aButton |
			| allDomainConcepts theDomainConceptsListElement |
			
			allDomainConcepts := MyUserStoryDomainConcepts new.
			
			self userStoryDomainConcepts userStoryDomainConcepts
				do: [ :eachUserStoryDomainConcept | allDomainConcepts addUserStoryDomainConcept: eachUserStoryDomainConcept ].
			self userStoryDomainConcepts userStoryDomainConcepts
				do: [ :eachUserStoryDomainConcept |
					eachUserStoryDomainConcept userStoryDomainConcept hasName
						ifTrue: [ allDomainConcepts addUserStoryDomainConcept: eachUserStoryDomainConcept userStoryDomainConcept ] ].
			
			theDomainConceptsListElement := MyUserStoryDomainConceptsListElement new.
			theDomainConceptsListElement userStoryDomainConcepts: allDomainConcepts.

			aButton phlow spawnTool: (GtPhlowValuableTool new valuable: theDomainConceptsListElement) ].
		
	self addChild: acceptConcepts
]

{ #category : #'api - user story domain concepts' }
MyUserStoryDomainConceptsSanitizerElement >> onUserStoryDomainConceptsChanged [
	"Is sent when a new userStoryDomainConcepts is assigned to the receiver.
	Note: #onUserStoryDomainConceptsChanged is sent before #subscribeToUserStoryDomainConcepts
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostUserStoryDomainConceptsChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
	
	list items: self userStoryDomainConcepts userStoryDomainConcepts
]

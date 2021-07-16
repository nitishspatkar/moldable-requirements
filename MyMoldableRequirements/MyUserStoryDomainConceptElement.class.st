Class {
	#name : 'MyUserStoryDomainConceptElement',
	#superclass : 'BrHorizontalPane',
	#traits : 'TMyWithUserStoryDomainConcept',
	#classTraits : 'TMyWithUserStoryDomainConcept classTrait',
	#instVars : [
		'name',
		'kind'
	],
	#category : 'MyMoldableRequirements-User Story - Views'
}

{ #category : 'initialization' }
MyUserStoryDomainConceptElement >> initialize [
	super initialize.
	
	self hMatchParent.
	self vFitContent.
	self cellSpacing: 10.
	self padding: (BlInsets top: 4 bottom: 4).
	
	name := BrEditableLabel new
		aptitude: BrGlamorousEditableLabelAptitude new;
		when: BrEditorAcceptWish do: [ :anEvent |
			self userStoryDomainConcept name: anEvent text ].
	
	kind := BrEditableLabel new
		aptitude: BrGlamorousEditableLabelAptitude new;
		when: BrEditorAcceptWish do: [ :anEvent |
			self userStoryDomainConcept userStoryDomainConcept name: anEvent text ].
		
	self addChild: name.
	self addChild: (BrLabel new
		aptitude: BrGlamorousLabelAptitude;
		text: 'kind of').
	self addChild: kind.
]

{ #category : 'private - event handling' }
MyUserStoryDomainConceptElement >> onDomainConceptKindNameChanged [

	kind text: (self userStoryDomainConcept userStoryDomainConcept hasName
		ifTrue: [ self userStoryDomainConcept userStoryDomainConcept name ]
		ifFalse: [ 'Object' ])
]

{ #category : 'private - event handling' }
MyUserStoryDomainConceptElement >> onDomainConceptNameChanged [

	name text: self userStoryDomainConcept name
]

{ #category : 'api - user story domain concept' }
MyUserStoryDomainConceptElement >> onUserStoryDomainConceptChanged [
	"Is sent when a new userStoryDomainConcept is assigned to the receiver.
	Note: #onUserStoryDomainConceptChanged is sent before #subscribeToUserStoryDomainConcept
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostUserStoryDomainConceptChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
	
	self onDomainConceptNameChanged.
	self onDomainConceptKindNameChanged
]

{ #category : 'api - user story domain concept' }
MyUserStoryDomainConceptElement >> subscribeToUserStoryDomainConcept [
	"Is sent after a new userStoryDomainConcept is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromUserStoryDomainConcept if the receiver subscribes to them"
	<modelSubscriber: #domainConcept>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
	
	self userStoryDomainConcept
		when: MyUserStoryDomainConceptNameChanged
		send: #onDomainConceptNameChanged
		to: self.
		
	self userStoryDomainConcept userStoryDomainConcept
		when: MyUserStoryDomainConceptNameChanged
		send: #onDomainConceptKindNameChanged
		to: self
]

{ #category : 'api - user story domain concept' }
MyUserStoryDomainConceptElement >> unsubscribeFromUserStoryDomainConcept [
	"Is sent before a new userStoryDomainConcept is assigned to the receiver.
	Objects that subscribe to userStoryDomainConcept are required to implement this method."
	<modelUnsubscriber: #domainConcept>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
	
	self userStoryDomainConcept unsubscribe: self.
	self userStoryDomainConcept userStoryDomainConcept unsubscribe: self
]

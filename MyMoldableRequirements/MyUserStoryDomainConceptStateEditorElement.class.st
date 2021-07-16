Class {
	#name : 'MyUserStoryDomainConceptStateEditorElement',
	#superclass : 'BrEditableLabel',
	#traits : 'TMyWithUserStoryDomainConceptState',
	#classTraits : 'TMyWithUserStoryDomainConceptState classTrait',
	#category : 'MyMoldableRequirements-User Story - Views'
}

{ #category : 'initialization' }
MyUserStoryDomainConceptStateEditorElement >> initialize [
	super initialize.
	
	self aptitude: BrGlamorousEditableLabelAptitude.
	
	self when: BrEditorAcceptWish do: [ :anEvent |
		self userStoryDomainConceptState name: anEvent text ].
	
	self addEditorShortcut: (BlShortcutWithAction new
		combination: BlKeyCombination backspace;
		action: [ self userStoryDomainConceptState parentUserStoryDomainConceptStates removeUserStoryDomainConceptState: self userStoryDomainConceptState ])
]

{ #category : 'api - user story domain concept state' }
MyUserStoryDomainConceptStateEditorElement >> onUserStoryDomainConceptStateChanged [
	"Is sent when a new userStoryDomainConceptState is assigned to the receiver.
	Note: #onUserStoryDomainConceptStateChanged is sent before #subscribeToUserStoryDomainConceptState
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostUserStoryDomainConceptStateChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
	
	self text: self userStoryDomainConceptState name
]

{ #category : 'api - user story domain concept state' }
MyUserStoryDomainConceptStateEditorElement >> subscribeToUserStoryDomainConceptState [
	"Is sent after a new userStoryDomainConceptState is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromUserStoryDomainConceptState if the receiver subscribes to them"
	<modelSubscriber: #domainConceptState>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
	
	self userStoryDomainConceptState
		when: MyUserStoryDomainConceptStateNameChanged
		send: #onUserStoryDomainConceptStateChanged
		to: self
]

{ #category : 'api - user story domain concept state' }
MyUserStoryDomainConceptStateEditorElement >> unsubscribeFromUserStoryDomainConceptState [
	"Is sent before a new userStoryDomainConceptState is assigned to the receiver.
	Objects that subscribe to userStoryDomainConceptState are required to implement this method."
	<modelUnsubscriber: #domainConceptState>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
	
	self userStoryDomainConceptState unsubscribe: self
]

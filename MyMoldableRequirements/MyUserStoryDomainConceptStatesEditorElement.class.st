Class {
	#name : #MyUserStoryDomainConceptStatesEditorElement,
	#superclass : #BrVerticalPane,
	#traits : 'TMyWithUserStoryDomainConceptStates',
	#classTraits : 'TMyWithUserStoryDomainConceptStates classTrait',
	#instVars : [
		'statesContainer'
	],
	#category : #'MyMoldableRequirements-User Story - Views'
}

{ #category : #initialization }
MyUserStoryDomainConceptStatesEditorElement >> initialize [
	super initialize.

	self hMatchParent.
	self vFitContent.

	self addChild: (BrLabel new
		aptitude: BrGlamorousLabelAptitude;
		text: 'Contained information').
		
	statesContainer := BrHorizontalFlow new.
	statesContainer
		hMatchParent;
		vFitContent.

	self addChild: statesContainer
]

{ #category : #'api - user story domain concept states' }
MyUserStoryDomainConceptStatesEditorElement >> onUserStoryDomainConceptStatesChanged [
	"Is sent when a new userStoryDomainConceptStates is assigned to the receiver.
	Note: #onUserStoryDomainConceptStatesChanged is sent before #subscribeToUserStoryDomainConceptStates
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostUserStoryDomainConceptStatesChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
	
	statesContainer removeChildren.
	statesContainer addChildren: (self userStoryDomainConceptStates userStoryDomainConceptStates collect: [ :eachUserStoryDomainConceptState |
		MyUserStoryDomainConceptStateEditorElement new
			margin: (BlInsets all: 2);
			userStoryDomainConceptState: eachUserStoryDomainConceptState ]).
		
	statesContainer addChild: (BrButton new
		beTinySize;
		aptitude: BrGlamorousButtonWithIconAptitude;
		icon: BrGlamorousVectorIcons add;
		constraintsDo: [ :c | c flow vertical alignCenter ];
		action: [ self userStoryDomainConceptStates addUserStoryDomainConceptState: (MyUserStoryDomainConceptState new name: 'state') ])
]

{ #category : #'api - user story domain concept states' }
MyUserStoryDomainConceptStatesEditorElement >> subscribeToUserStoryDomainConceptStates [
	"Is sent after a new userStoryDomainConceptStates is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromUserStoryDomainConceptStates if the receiver subscribes to them"
	<modelSubscriber: #domainConceptStates>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
	
	self userStoryDomainConceptStates
		when: MyUserStoryDomainConceptStateAddedAnnouncement, MyUserStoryDomainConceptStateRemovedAnnouncement
		send: #onUserStoryDomainConceptStatesChanged
		to: self
]

{ #category : #'api - user story domain concept states' }
MyUserStoryDomainConceptStatesEditorElement >> unsubscribeFromUserStoryDomainConceptStates [
	"Is sent before a new userStoryDomainConceptStates is assigned to the receiver.
	Objects that subscribe to userStoryDomainConceptStates are required to implement this method."
	<modelUnsubscriber: #domainConceptStates>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
	
	self userStoryDomainConceptStates unsubscribe: self
]

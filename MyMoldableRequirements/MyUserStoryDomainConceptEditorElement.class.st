Class {
	#name : #MyUserStoryDomainConceptEditorElement,
	#superclass : #BrVerticalPane,
	#traits : 'TMyWithUserStoryDomainConcept',
	#classTraits : 'TMyWithUserStoryDomainConcept classTrait',
	#instVars : [
		'states',
		'name'
	],
	#category : 'MyMoldableRequirements-User Story - Views'
}

{ #category : #initialization }
MyUserStoryDomainConceptEditorElement >> initialize [
	super initialize.
	
	self hMatchParent.
	self vMatchParent.
	
	self background: BrGlamorousColors backdropColor.
	self padding: (BlInsets all: 30).
	
	name := BrLabel new
		beHugeSize;
		aptitude: BrGlamorousLabelAptitude.

	states := MyUserStoryDomainConceptStatesEditorElement new.
	
	self addChild: (BrVerticalPane new
		background: Color white;
		cellSpacing: 10;
		padding: (BlInsets left: 10 right: 10);
		geometry: (BlRoundedRectangleGeometry cornerRadius: 4);
		matchParent;
		addAptitude: (BrShadowAptitude new beLarge);
		addChild: name;
		addChild: states) 
]

{ #category : #'api - user story domain concept' }
MyUserStoryDomainConceptEditorElement >> onUserStoryDomainConceptChanged [
	"Is sent when a new userStoryDomainConcept is assigned to the receiver.
	Note: #onUserStoryDomainConceptChanged is sent before #subscribeToUserStoryDomainConcept
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostUserStoryDomainConceptChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
	
	name text: self userStoryDomainConcept name.
	states userStoryDomainConceptStates: self userStoryDomainConcept userStoryDomainConceptStates
]

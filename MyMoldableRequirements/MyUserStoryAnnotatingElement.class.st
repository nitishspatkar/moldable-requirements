Class {
	#name : #MyUserStoryAnnotatingElement,
	#superclass : #BrVerticalPane,
	#traits : 'TMyWithUserStory',
	#classTraits : 'TMyWithUserStory classTrait',
	#instVars : [
		'title',
		'annotationsCoder',
		'annotationsCoderElement',
		'sanitizeButton'
	],
	#category : 'MyMoldableRequirements-User Story - Views'
}

{ #category : #initialization }
MyUserStoryAnnotatingElement >> initialize [
	super initialize.

	self matchParent.
	self cellSpacing: 10.
	self background: BrGlamorousColors backdropColor.
	self padding: (BlInsets left: 10 right: 10).

	title := BrLabel new
		aptitude: (BrGlamorousLabelAptitude new foreground: Color gray);
		text: 'Annotate the main domain concepts in the story:'.

	annotationsCoder := MyUserStoryAnnotationCoder new.
	annotationsCoderElement := annotationsCoder asElement.
	annotationsCoderElement
		hMatchParent
		vFitContent;
		padding: (BlInsets all: 5);
		geometry: (BlRoundedRectangleGeometry cornerRadius: 4);
		addAptitude: BrGlamorousEditorSpacingAptitude.

	sanitizeButton := BrButton new
		aptitude: BrGlamorousButtonWithLabelAptitude new;
		label: 'Sanitize';
		action: [ :aButton |
			| theDomainConceptsElement |
			
			theDomainConceptsElement := MyUserStoryDomainConceptsSanitizerElement new.
			theDomainConceptsElement userStoryDomainConcepts: self userStory annotations asDomainConcepts.
			
			aButton phlow spawnTool: (GtPhlowValuableTool new valuable: theDomainConceptsElement) ].
	
	self addChildren: { title. annotationsCoderElement . sanitizeButton }
]

{ #category : #'api - user story' }
MyUserStoryAnnotatingElement >> onUserStoryChanged [
	"Is sent when a new userStory is assigned to the receiver.
	Note: #onUserStoryChanged is sent before #subscribeToUserStory
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostUserStoryChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
	
	annotationsCoder
		userStoryAnnotations: self userStory annotations;
		forString: self userStory description
]

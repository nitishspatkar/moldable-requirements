Class {
	#name : #MyUserStoryAcceptanceCriteriaElement,
	#superclass : #BrVerticalPane,
	#traits : 'TMyWithUserStoryModel',
	#classTraits : 'TMyWithUserStoryModel classTrait',
	#instVars : [
		'label',
		'editor'
	],
	#category : 'MyMoldableRequirements-User Story - Views'
}

{ #category : #initialization }
MyUserStoryAcceptanceCriteriaElement >> initialize [
	super initialize.
	
	self hMatchParent.
	self vFitContent.
	self padding: (BlInsets bottom: 20).
	
	label := BrLabel new
		aptitude: BrGlamorousLabelAptitude;
		beLargeSize;
		text: 'Acceptance Criteria:'.
	
	editor := BrEditableLabel new
		aptitude: BrGlamorousEditableLabelAptitude new glamorousRegularFontAndSize;
		when: BrEditorAcceptWish do: [ :aWish | self userStoryModel acceptanceCriteria: aWish text ].
		
	self addChildren: { 
		label.
		editor
	}
]

{ #category : #'private - event handling' }
MyUserStoryAcceptanceCriteriaElement >> onAcceptanceCriteriaChanged [
	"Is sent when acceptance criteria of the user story changes"

	self updateAcceptanceCriteria
]

{ #category : #'api - user story model' }
MyUserStoryAcceptanceCriteriaElement >> onUserStoryModelChanged [
	"Is sent when a new userStoryModel is assigned to the receiver.
	Note: #onUserStoryModelChanged is sent before #subscribeToUserStoryModel
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostUserStoryModelChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
	
	self updateAcceptanceCriteria
]

{ #category : #'api - user story model' }
MyUserStoryAcceptanceCriteriaElement >> subscribeToUserStoryModel [
	"Is sent after a new userStoryModel is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromUserStoryModel if the receiver subscribes to them"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
	
	self userStoryModel announcer weak
		when: MyUserStoryAcceptanceCriteriaChanged
		send: #onAcceptanceCriteriaChanged
		to: self
]

{ #category : #'api - user story model' }
MyUserStoryAcceptanceCriteriaElement >> unsubscribeFromUserStoryModel [
	"Is sent before a new userStoryModel is assigned to the receiver.
	Objects that subscribe to userStoryModel are required to implement this method."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
	
	self userStoryModel announcer unsubscribe: self
]

{ #category : #'private - updating' }
MyUserStoryAcceptanceCriteriaElement >> updateAcceptanceCriteria [
	editor text: self userStoryModel acceptanceCriteria
]

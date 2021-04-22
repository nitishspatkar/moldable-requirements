Class {
	#name : #MyUserStoryElement,
	#superclass : #BrVerticalPane,
	#traits : 'TMyWithUserStoryModel',
	#classTraits : 'TMyWithUserStoryModel classTrait',
	#instVars : [
		'acceptanceCriteria',
		'status',
		'notes'
	],
	#category : #'MyMoldableRequirements-Views'
}

{ #category : #initialization }
MyUserStoryElement >> initialize [
	super initialize.
	
	self hMatchParent.
	self vFitContent.
	
	acceptanceCriteria := MyUserStoryAcceptanceCriteriaElement new
		hMatchParent;
		vFitContent.

	status := MyUserStoryStatusElement new.

	notes := MyUserStoryNotesElement new.

	self addChildren: {
		acceptanceCriteria.
		status.
		notes
	}
]

{ #category : #'api - user story model' }
MyUserStoryElement >> onUserStoryModelChanged [
	"Is sent when a new userStoryModel is assigned to the receiver.
	Note: #onUserStoryModelChanged is sent before #subscribeToUserStoryModel
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostUserStoryModelChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
	
	acceptanceCriteria userStoryModel: self userStoryModel.
	status userStoryModel: self userStoryModel.
	notes notes: self userStoryModel notes
]

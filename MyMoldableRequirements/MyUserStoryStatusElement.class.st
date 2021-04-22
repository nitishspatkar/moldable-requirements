Class {
	#name : #MyUserStoryStatusElement,
	#superclass : #BrVerticalPane,
	#traits : 'TMyWithUserStoryModel',
	#classTraits : 'TMyWithUserStoryModel classTrait',
	#instVars : [
		'label',
		'statusButton'
	],
	#category : #'MyMoldableRequirements-Views'
}

{ #category : #initialization }
MyUserStoryStatusElement >> initialize [
	super initialize.
	
	self hMatchParent.
	self vFitContent.
	
	label := BrLabel new
		aptitude: BrGlamorousLabelAptitude;
		beLargeSize;
		text: 'Satus:'.
	
	statusButton := MyUserStoryStatusButton new.
		
	self addChildren: { 
		label.
		statusButton
	}
]

{ #category : #'api - user story model' }
MyUserStoryStatusElement >> onUserStoryModelChanged [
	"Is sent when a new userStoryModel is assigned to the receiver.
	Note: #onUserStoryModelChanged is sent before #subscribeToUserStoryModel
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostUserStoryModelChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
	
	statusButton userStoryModel: self userStoryModel
]

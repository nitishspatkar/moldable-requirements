Class {
	#name : #MyUserStoryElement,
	#superclass : #BrVerticalPane,
	#traits : 'TMyWithUserStoryModel',
	#classTraits : 'TMyWithUserStoryModel classTrait',
	#instVars : [
		'acceptanceCriteria',
		'status',
		'notes',
		'notesLabel',
		'notesButton',
		'notesLabelAndButtonContainer'
	],
	#category : #'MyMoldableRequirements-User Story - Views'
}

{ #category : #initialization }
MyUserStoryElement >> addNoteDropdownAptitude [
^ BrGlamorousWithDropdownAptitude 
	handle: [BrButton new
				aptitude: BrGlamorousButtonRectangularAptitude + BrGlamorousButtonIconAptitude;
				icon: BrGlamorousIcons add
	]
	content: [ | note |
			note := MyNote
				id: nil
				description: ''
				author: ''.
			note asFormElement: [ userStoryModel notes addNote: note ]]
]

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
	
	notesLabelAndButtonContainer := BrHorizontalPane new
		hMatchParent;
		vFitContent.
		
	notesLabel := BrLabel new
		text: 'Notes:';
		aptitude: BrGlamorousLabelAptitude;
		margin:
			(BlInsets
				top: 20
				left: 0
				bottom: 5
				right: 20);
		beLargeSize.
		
	notesButton := BrButton new
		aptitude: BrGlamorousButtonWithIconAptitude + self addNoteDropdownAptitude;
		icon: BrGlamorousVectorIcons add;
		margin:
			(BlInsets
				top: 20
				left: 0
				bottom: 5
				right: 0);
		beTinySize;
		label: 'Add a Note'.
		
	notesLabelAndButtonContainer
		addChildren:
			{notesLabel.
			notesButton}.
	self
		addChildren:
			{status.
			acceptanceCriteria.
			notesLabelAndButtonContainer.
			notes}
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

Class {
	#name : 'MyUserStoryStatusButton',
	#superclass : 'BrButton',
	#traits : 'TMyWithUserStoryModel',
	#classTraits : 'TMyWithUserStoryModel classTrait',
	#category : 'MyMoldableRequirements-User Story - Views'
}

{ #category : 'initialization' }
MyUserStoryStatusButton >> createDropdownContent [
	
	^ BrSimpleList new
		itemStencil: [
			BrButton new
				aptitude: BrGlamorousLabelAptitude new
						+ (BrStyleCommonAptitude new selected: [ :aStyle | aStyle background: Color veryVeryLightGray ]);
				padding: (BlInsets all: 5);
				action: [ :aButton |
					self userStoryModel status: aButton model.
					aButton fireEvent: BrDropdownHideWish new ] ];
		itemDataBinder: [ :eachButton :eachStatus |
			(eachStatus = self userStoryModel status)
				ifTrue: [ eachButton label: '> ', eachStatus label ]
				ifFalse: [ eachButton label: eachStatus label ].
				
			eachButton model: eachStatus ];
		items: self userStoryModel allStati
]

{ #category : 'initialization' }
MyUserStoryStatusButton >> initialize [
	super initialize.
	
	self
		size: 20 @ 20;
		geometry: (BlRoundedRectangleGeometry cornerRadius: 10);
		label: 'Status'.
	
	self addAptitude: (BrGlamorousWithDropdownAptitude
		handle: [ BrButton new
				size: 20@20;
				geometry: (BlRoundedRectangleGeometry cornerRadius: 10);
				icon: BrGlamorousIcons menu ]
		content: [ self createDropdownContent ])
]

{ #category : 'private - event handling' }
MyUserStoryStatusButton >> onStatusChanged: anAnnouncement [
	self updateStatusColor
]

{ #category : 'api - user story model' }
MyUserStoryStatusButton >> onUserStoryModelChanged [
	"Is sent when a new userStoryModel is assigned to the receiver.
	Note: #onUserStoryModelChanged is sent before #subscribeToUserStoryModel
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostUserStoryModelChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>
	
	self updateStatusColor
]

{ #category : 'api - user story model' }
MyUserStoryStatusButton >> subscribeToUserStoryModel [
	"Is sent after a new userStoryModel is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromUserStoryModel if the receiver subscribes to them"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
	
	self userStoryModel announcer weak
		when: MyUserStoryStatusChanged
		send: #onStatusChanged:
		to: self
]

{ #category : 'api - user story model' }
MyUserStoryStatusButton >> unsubscribeFromUserStoryModel [
	"Is sent before a new userStoryModel is assigned to the receiver.
	Objects that subscribe to userStoryModel are required to implement this method."
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
	
	self userStoryModel announcer unsubscribe: self
]

{ #category : 'private - updating' }
MyUserStoryStatusButton >> updateStatusColor [
	self background: self userStoryModel statusColor
]

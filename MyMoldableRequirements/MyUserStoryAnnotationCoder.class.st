Class {
	#name : #MyUserStoryAnnotationCoder,
	#superclass : #GtTextCoder,
	#traits : 'TMyWithUserStoryAnnotations',
	#classTraits : 'TMyWithUserStoryAnnotations classTrait',
	#category : #'MyMoldableRequirements-Coder'
}

{ #category : #accessing }
MyUserStoryAnnotationCoder >> addUserStoryAnnotation: aMyUserStoryAnnotation [
	self userStoryAnnotations addUserStoryAnnotation: aMyUserStoryAnnotation
]

{ #category : #'api - ast' }
MyUserStoryAnnotationCoder >> computeAst: theSourceString [
	^ MyUserStoryParser
		parse: theSourceString
		withAnnotations: self userStoryAnnotations userStoryAnnotations
]

{ #category : #initialize }
MyUserStoryAnnotationCoder >> initialize [
	super initialize.
	
	self userStoryAnnotations: MyUserStoryAnnotations new
]

{ #category : #initialization }
MyUserStoryAnnotationCoder >> initializeAddOns: addOns [
	super initializeAddOns: addOns.
	
	addOns addStyler: MyUserStoryAnnotationStyler new.
	
	addOns
		addContextMenuItem: 'Annotate'
		action: [  :aCoderViewModel :anEvent :anEditorElement |
			aCoderViewModel hasSelection
				ifTrue: [
					| aNewAnnotationText |
					aNewAnnotationText := self currentSourceString copyFrom: (aCoderViewModel selection from + 1) to: aCoderViewModel selection to.
					self addUserStoryAnnotation: (MyUserStoryAnnotation new name: aNewAnnotationText) ] ]
]

{ #category : #'private - event handling' }
MyUserStoryAnnotationCoder >> onUserStoryAnnotationsChanged [
	"Is sent when a new userStoryAnnotations is assigned to the receiver.
	Note: #onUserStoryAnnotationsChanged is sent before #subscribeToUserStoryAnnotations
	which means that if you perform any operation that triggers an announcement it will be ignored because the receiver
	didn't get a chance to subscribe to any announcement. Override #onPostUserStoryAnnotationsChanged if you
	wish to perform an operation that requires an announcement, but keep in mind that this is not the most efficient way"
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#onObjectChangedTemplate'>

	self sourceChanged
]

{ #category : #'api - user story annotations' }
MyUserStoryAnnotationCoder >> subscribeToUserStoryAnnotations [
	"Is sent after a new userStoryAnnotations is assigned to the receiver.
	It is required to unsubscribe from the previously subscribed objects by implementing
	#unsubscribeFromUserStoryAnnotations if the receiver subscribes to them"
	<modelSubscriber: #annotations>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#subscribeToObjectTemplate'>
	
	self userStoryAnnotations
		when: MyUserStoryAnnotationAddedAnnouncement, MyUserStoryAnnotationRemovedAnnouncement
		send: #onUserStoryAnnotationsChanged
		to: self
]

{ #category : #'api - user story annotations' }
MyUserStoryAnnotationCoder >> unsubscribeFromUserStoryAnnotations [
	"Is sent before a new userStoryAnnotations is assigned to the receiver.
	Objects that subscribe to userStoryAnnotations are required to implement this method."
	<modelUnsubscriber: #annotations>
	<generatedFrom: #'TGtRobocoderWithObjectTraitTemplate>>#unsubscribeFromObjectTemplate'>
	
	self userStoryAnnotations unsubscribe: self
]

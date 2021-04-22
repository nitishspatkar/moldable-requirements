Trait {
	#name : #TMyWithStatus,
	#instVars : [
		'status'
	],
	#category : #'MyMoldableRequirements-Models'
}

{ #category : #'api - status' }
TMyWithStatus >> hasStatus [
	<return: #Boolean>
	<propertyTester: #status>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#propertyTesterTemplate'>

	^ status notNil
]

{ #category : #'api - status' }
TMyWithStatus >> notifyStatusChanged [
	"Override this notify method to announce changes to the property"
	<propertyChangeNotifier: #status>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#notifyPropertyChangedTemplate'>
]

{ #category : #'api - status' }
TMyWithStatus >> onNewStatusSet: aNewStatus [
	"Is sent after a new value of the status is assigned"
	<propertySetHook: #status>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#onNewPropertySetHookTemplate'>
]

{ #category : #'api - status' }
TMyWithStatus >> onPreviousStatusUnset: aPreviousStatus [
	"Is sent after a previous value of the status is de-assigned"
	<propertyUnsetHook: #status>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#onPreviousPropertyUnsetHookTemplate'>
]

{ #category : #'api - status' }
TMyWithStatus >> status [
	<return: #MyUserStatusOld>
	<propertyGetter: #status>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#propertyGetterTemplate'>

	^ status
]

{ #category : #'api - status' }
TMyWithStatus >> status: aNewStatus [
	<propertySetter: #status>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#propertySetterTemplate'>

	(self hasStatus
		and: [ self status = aNewStatus ])
			ifTrue: [ ^ self ].
	
	self hasStatus
		ifTrue: [
			| aPreviousStatus |
			aPreviousStatus := status.
			status := nil.
			self onPreviousStatusUnset: aPreviousStatus ].
	status := aNewStatus.
	self onNewStatusSet: aNewStatus.
	self notifyStatusChanged
]

{ #category : #'api - status' }
TMyWithStatus >> unsetStatus [
	<propertyUnsetter: #status>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#propertyUnsetterTemplate'>
	| aPreviousStatus |

	self hasStatus
		ifFalse: [ ^ self ].

	aPreviousStatus := status.
	status := nil.
	self onPreviousStatusUnset: aPreviousStatus.
	self notifyStatusChanged
]

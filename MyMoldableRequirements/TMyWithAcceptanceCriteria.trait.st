Trait {
	#name : #TMyWithAcceptanceCriteria,
	#instVars : [
		'acceptanceCriteria'
	],
	#category : #'MyMoldableRequirements-Models'
}

{ #category : #'api - acceptance criteria' }
TMyWithAcceptanceCriteria >> acceptanceCriteria [
	<return: #String>
	<propertyGetter: #acceptanceCriteria>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#propertyGetterTemplate'>

	^ acceptanceCriteria
]

{ #category : #'api - acceptance criteria' }
TMyWithAcceptanceCriteria >> acceptanceCriteria: aNewAcceptanceCriteria [
	<propertySetter: #acceptanceCriteria>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#propertySetterTemplate'>

	(self hasAcceptanceCriteria
		and: [ self acceptanceCriteria = aNewAcceptanceCriteria ])
			ifTrue: [ ^ self ].
	
	self hasAcceptanceCriteria
		ifTrue: [
			| aPreviousAcceptanceCriteria |
			aPreviousAcceptanceCriteria := acceptanceCriteria.
			acceptanceCriteria := nil.
			self onPreviousAcceptanceCriteriaUnset: aPreviousAcceptanceCriteria ].
	acceptanceCriteria := aNewAcceptanceCriteria.
	self onNewAcceptanceCriteriaSet: aNewAcceptanceCriteria.
	self notifyAcceptanceCriteriaChanged
]

{ #category : #'api - acceptance criteria' }
TMyWithAcceptanceCriteria >> hasAcceptanceCriteria [
	<return: #Boolean>
	<propertyTester: #acceptanceCriteria>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#propertyTesterTemplate'>

	^ acceptanceCriteria notNil
]

{ #category : #'api - acceptance criteria' }
TMyWithAcceptanceCriteria >> notifyAcceptanceCriteriaChanged [
	"Override this notify method to announce changes to the property"
	<propertyChangeNotifier: #acceptanceCriteria>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#notifyPropertyChangedTemplate'>
]

{ #category : #'api - acceptance criteria' }
TMyWithAcceptanceCriteria >> onNewAcceptanceCriteriaSet: aNewAcceptanceCriteria [
	"Is sent after a new value of the acceptanceCriteria is assigned"
	<propertySetHook: #acceptanceCriteria>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#onNewPropertySetHookTemplate'>
]

{ #category : #'api - acceptance criteria' }
TMyWithAcceptanceCriteria >> onPreviousAcceptanceCriteriaUnset: aPreviousAcceptanceCriteria [
	"Is sent after a previous value of the acceptanceCriteria is de-assigned"
	<propertyUnsetHook: #acceptanceCriteria>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#onPreviousPropertyUnsetHookTemplate'>
]

{ #category : #'api - acceptance criteria' }
TMyWithAcceptanceCriteria >> unsetAcceptanceCriteria [
	<propertyUnsetter: #acceptanceCriteria>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#propertyUnsetterTemplate'>
	| aPreviousAcceptanceCriteria |

	self hasAcceptanceCriteria
		ifFalse: [ ^ self ].

	aPreviousAcceptanceCriteria := acceptanceCriteria.
	acceptanceCriteria := nil.
	self onPreviousAcceptanceCriteriaUnset: aPreviousAcceptanceCriteria.
	self notifyAcceptanceCriteriaChanged
]

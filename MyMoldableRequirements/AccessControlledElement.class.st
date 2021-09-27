Class {
	#name : #AccessControlledElement,
	#superclass : #Identifiable,
	#instVars : [
		'isEditable'
	],
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
AccessControlledElement >> isEditable [
	^ isEditable
]

{ #category : #accessing }
AccessControlledElement >> isEditable: aBoolean [
	isEditable := aBoolean
]

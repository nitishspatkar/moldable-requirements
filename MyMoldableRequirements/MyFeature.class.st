Class {
	#name : #MyFeature,
	#superclass : #Object,
	#instVars : [
		'id',
		'title',
		'description',
		'useCases'
	],
	#category : #MyMoldableRequirements
}

{ #category : #accessing }
MyFeature class >> fromRawData: featureDict [
	^ self
		id: (featureDict at: #id)
		title: (featureDict at: #title)
		description: (featureDict at: #description)
		useCases:
			((featureDict at: #'use-cases')
				collect: [ :useCaseDict | MyUseCase fromRawData: useCaseDict ])
]

{ #category : #accessing }
MyFeature class >> id: aString title: anotherString description: yetAnotherString useCases: anArray [
	^ self new
		id: aString;
		title: anotherString;
		description: yetAnotherString;
		useCases: anArray;
		yourself
]

{ #category : #accessing }
MyFeature >> description: yetAnotherString [
	description := yetAnotherString
]

{ #category : #accessing }
MyFeature >> id: aString [
	id := aString
]

{ #category : #accessing }
MyFeature >> printOn: aStream [
	aStream nextPutAll: title
]

{ #category : #accessing }
MyFeature >> title: anotherString [
	title := anotherString
]

{ #category : #accessing }
MyFeature >> useCases: anArray [
	useCases := anArray
]

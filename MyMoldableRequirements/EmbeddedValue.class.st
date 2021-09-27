Class {
	#name : #EmbeddedValue,
	#superclass : #Object,
	#instVars : [
		'key',
		'otherContent',
		'enumValue'
	],
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
EmbeddedValue class >> fromRawData: aProperty [ 
	^ self
		key: (aProperty attributeAt: 'KEY')
		otherContent: (aProperty attributeAt: 'OTHER-CONTENT')	
]

{ #category : #accessing }
EmbeddedValue class >> key: anInteger otherContent: aString [
	^ self new
		key: anInteger;
		otherContent: aString;
		yourself 
]

{ #category : #accessing }
EmbeddedValue >> enumValue [
	^ enumValue
]

{ #category : #accessing }
EmbeddedValue >> enumValue: anObject [
	enumValue := anObject
]

{ #category : #accessing }
EmbeddedValue >> key [
	^ key
]

{ #category : #accessing }
EmbeddedValue >> key: anObject [
	key := anObject
]

{ #category : #accessing }
EmbeddedValue >> otherContent [
	^ otherContent
]

{ #category : #accessing }
EmbeddedValue >> otherContent: anObject [
	otherContent := anObject
]

{ #category : #accessing }
EmbeddedValue >> writeOn: aWriter [
	aWriter tag: 'EMBEDDED-VALUE'
]

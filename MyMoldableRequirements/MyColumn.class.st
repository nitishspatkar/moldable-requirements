Class {
	#name : #MyColumn,
	#superclass : #Object,
	#instVars : [
		'id',
		'title'
	],
	#category : 'MyMoldableRequirements-Models'
}

{ #category : #accessing }
MyColumn class >> fromRawData: columnDict [ 
	^self 
		id: (columnDict at: #id)
		title: (columnDict at: #title)
]

{ #category : #accessing }
MyColumn class >> id: aNumber title: aString [
	^self new
		id: aNumber;
		title: aString;
		yourself
]

{ #category : #accessing }
MyColumn >> id: aNumber [
id := aNumber
]

{ #category : #accessing }
MyColumn >> printOn: aStream [
	aStream nextPutAll: title
]

{ #category : #accessing }
MyColumn >> title [
^title
]

{ #category : #accessing }
MyColumn >> title: aString [
title := aString
]

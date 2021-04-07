Class {
	#name : #MyNotes,
	#superclass : #Object,
	#instVars : [
		'note',
		'author',
		'id'
	],
	#category : #MyMoldableRequirements
}

{ #category : #accessing }
MyNotes class >> fromRawData: notesDict [ 
^ self
	id: (notesDict at: #id)
	note: (notesDict at: #description)
	author: (notesDict at: #author)
]

{ #category : #accessing }
MyNotes class >> id: aNumber note: aString author: anotherString [
^ self new
	id: aNumber;
	note: aString;
	author: anotherString
	yourself 
]

{ #category : #accessing }
MyNotes >> author: aString [
author := aString 
]

{ #category : #accessing }
MyNotes >> id: aNumber [ 
id := aNumber
]

{ #category : #accessing }
MyNotes >> note: aString [
note := aString 
]

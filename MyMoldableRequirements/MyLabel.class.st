Class {
	#name : #MyLabel,
	#superclass : #Object,
	#instVars : [
		'id',
		'description',
		'color'
	],
	#category : #MyMoldableRequirements
}

{ #category : #accessing }
MyLabel class >> fromRawData: labelDict [ 
^ self
	id: (labelDict at: #id)
	description: (labelDict at: #description)
	color: (labelDict at: #color)
]

{ #category : #accessing }
MyLabel class >> id: aNumber description: aString color: anotherString [ 
^ self new 
	id: aNumber;
	description: aString;
	color: anotherString
	yourself
]

{ #category : #accessing }
MyLabel >> asLabel [
^ BrLabel new
	layout: BlLinearLayout horizontal;
	size: 20@20;
	geometry: (BlRectangleGeometry new);
	background: Color white;
	margin: (BlInsets all: 5);
	text: self des
	beTinySize;
	constraintsDo: [ :c | c horizontal fitContent.
											c vertical fitContent]
]

{ #category : #accessing }
MyLabel >> color [
^color
]

{ #category : #accessing }
MyLabel >> color: aString [
color := aString
]

{ #category : #accessing }
MyLabel >> description: aString [ 
description := aString
]

{ #category : #accessing }
MyLabel >> gtCircleViewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Label';
		priority: 0;
		stencil: [ self asLabel
					look: BrShadowLook;
					constraintsDo: [ :c | c horizontal fitContent.
											c vertical fitContent];
					padding: (BlInsets all: 5);
					yourself]
]

{ #category : #accessing }
MyLabel >> id: aNumber [ 
id := aNumber
]

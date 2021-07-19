Class {
	#name : 'HMShiftConstraint',
	#superclass : 'Object',
	#instVars : [
		'type'
	],
	#category : 'Hospital-Management-Model'
}

{ #category : 'as yet unclassified' }
HMShiftConstraint class >> gtViewConstraintTypesFor: aView [ 	
	<gtView>
	<gtClassView>
	^  aView tree
		title: 'Types of constraints';
		items: [ { self } ];
		children: [ :each | each subclasses ];
		sendTool: [ :aClass | GtClassCoderTool forClass: aClass ];
		expandOneLevel 
]

{ #category : 'as yet unclassified' }
HMShiftConstraint class >> yourself [
	<gtExample>
	^ self
]

{ #category : 'accessing' }
HMShiftConstraint >> type [
	^ type
]

{ #category : 'accessing' }
HMShiftConstraint >> type: aString [
	type := aString
]

Class {
	#name : 'HMStaffConstraintType',
	#superclass : 'Object',
	#instVars : [
		'description'
	],
	#category : 'Hospital-Management-Model'
}

{ #category : 'accessing' }
HMStaffConstraintType class >> gtViewConstraintTypesFor: aView [ 	
	<gtView>
	<gtClassView>
	^  aView tree
		title: 'Types of constraints';
		items: [ { self } ];
		children: [ :each | each subclasses ];
		sendTool: [ :aClass | GtClassCoderTool forClass: aClass ];
		expandOneLevel 
]

{ #category : 'accessing' }
HMStaffConstraintType class >> yourself [
	<gtExample>
	^ self
]

{ #category : 'accessing' }
HMStaffConstraintType >> description [
	^ description
]

{ #category : 'accessing' }
HMStaffConstraintType >> description: aString [
	description := aString
]

Class {
	#name : #AttributeValue,
	#superclass : #Object,
	#instVars : [
		'specElAt',
		'definition',
		'owningDefinition'
	],
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
AttributeValue >> asEditView [
	"Returns a BlElement containing elements to edit this attribute"
	
	| lineContainer |

	lineContainer := BlElement new
		layout: BlLinearLayout horizontal;
		margin: (BlInsets top: 10);
		background: Color white;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent].
	lineContainer addChild:
		(BrLabel new
			aptitude: BrGlamorousLabelAptitude;
			beLargeSize;
			margin: (BlInsets right: 20);
			text: self attributeName;
			yourself).
	lineContainer addChild: self asValueEditor.
	
	^ lineContainer
]

{ #category : #accessing }
AttributeValue >> asValueEditor [
	"Returns an editing element for the value of this attribute."
	
	^ (BrLabel new
		aptitude: BrGlamorousLabelAptitude;
		beLargeSize;
		margin: (BlInsets right: 20);
		text: 'Editing for this type is not implemented';
		yourself).
]

{ #category : #accessing }
AttributeValue >> attributeName [
	"Return the name of this attribute as a pretty string"
	
	^ self definition longName asCamelCase
]

{ #category : #accessing }
AttributeValue >> definition [
	^ definition
]

{ #category : #accessing }
AttributeValue >> definition: anObject [
	definition := anObject
]

{ #category : #accessing }
AttributeValue >> initialize [
	super initialize.
	announcer := Announcer new.
]

{ #category : #accessing }
AttributeValue >> owningDefinition [
	^ owningDefinition
]

{ #category : #accessing }
AttributeValue >> owningDefinition: anObject [
	owningDefinition := anObject
]

{ #category : #accessing }
AttributeValue >> specElAt [
	^ specElAt
]

{ #category : #accessing }
AttributeValue >> specElAt: anObject [
	specElAt := anObject
]

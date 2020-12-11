Class {
	#name : #BaselineOfMyMoldableRequirements,
	#superclass : #BaselineOf,
	#category : #BaselineOfMyMoldableRequirements
}

{ #category : #accessing }
BaselineOfMyMoldableRequirements >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec package: 'MyMoldableRequirements' ]
]

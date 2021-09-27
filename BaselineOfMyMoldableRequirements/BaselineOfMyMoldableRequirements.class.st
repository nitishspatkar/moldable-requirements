Class {
	#name : #BaselineOfMyMoldableRequirements,
	#superclass : #BaselineOf,
	#category : #BaselineOfMyMoldableRequirements
}

{ #category : #accessing }
BaselineOfMyMoldableRequirements >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				baseline: 'XPath' with: [
					spec repository: 'github://pharo-contributions/XML-XPath/src'];
				baseline: 'XMLWriter' with: [
					spec repository: 'github://pharo-contributions/XML-XMLWriter/src'].
					
			spec
				package: 'MyMoldableRequirements' with: [ spec requires: #(#'XPath' #'XMLWriter') ];
				package: 'Epic';
				package: 'AddressBook' with: [ spec requires: #(Epic) ] ]
]

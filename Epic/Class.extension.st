Extension { #name : #Class }

{ #category : #'*Epic' }
Class >> gtRequirementsFor: aView [
	<gtView>
	^ RequirementRefFinder viewWithItemsFor: self.
]

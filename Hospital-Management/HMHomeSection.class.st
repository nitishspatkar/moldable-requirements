Class {
	#name : 'HMHomeSection',
	#superclass : 'GtHomeSection',
	#category : 'Hospital-Management'
}

{ #category : 'api - instantiation' }
HMHomeSection >> create [
	| sectionContainer cardsContainer |
	sectionContainer := self newSectionContainer.
	sectionContainer addChild: (self newSectionTitle: 'Hospital Management System').
	cardsContainer := self newCardsContainer.
	
	cardsContainer addChild: (self
		newHeaderCardWithTitle: 'Hospital Management System'
		description: 'Hospital Management System'
		size: 200@150
		content:
			(BrLabel new
				text: 'Hospital Management System';
				aptitude: BrGlamorousLabelAptitude new
					bold;
				padding: (BlInsets all: 20)) asScalableElement
		action: [ :card | 
			| startPage |
			startPage := LeDatabasesRegistry default currentLoadedDefaultLogicalDatabase 
				pageNamed: 'Hospital Management System'.
			GtWorldUtility 
				showSpaceWithTitle: startPage title
				inPagerWith: [ startPage
					asLepiterPagePhlowTool asElementDo: [ :e | e ] ] asStencil
				from: card ]).
				
	sectionContainer addChild: cardsContainer.
	^ sectionContainer
]

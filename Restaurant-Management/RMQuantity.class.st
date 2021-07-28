Class {
	#name : #RMQuantity,
	#superclass : #RMObject,
	#category : #'Restaurant-Management-Model'
}

{ #category : #ui }
RMQuantity >> gtOverviewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Overview';
		stencil: [ 
			| parentElement |
			parentElement := BlElement new 
				constraintsDo: [ :c | c vertical fitContent. c horizontal fitContent ];
				layout: BlLinearLayout new.
			self asOverviewElementIn: parentElement.
			parentElement asPannableElement ]
]

{ #category : #scripting }
RMQuantity >> of: aQuantity [
	self subclassResponsibility
]

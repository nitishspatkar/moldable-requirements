Class {
	#name : #RMTaxComputation,
	#superclass : #RMObject,
	#category : #'Restaurant-Management-Model'
}

{ #category : #'public interface' }
RMTaxComputation >> taxMoneyFor: aMoney [
	self subclassResponsibility
]

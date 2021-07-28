Class {
	#name : #RMTaxComputation,
	#superclass : #UObject,
	#category : #'Restaurant-Management-Model'
}

{ #category : #'public interface' }
RMTaxComputation >> taxMoneyFor: aMoney [
	self subclassResponsibility
]

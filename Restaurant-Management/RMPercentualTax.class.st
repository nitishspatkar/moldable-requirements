Class {
	#name : #RMPercentualTax,
	#superclass : #RMTaxComputation,
	#instVars : [
		'percentage'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #ui }
RMPercentualTax >> gtDisplayOn: stream [
	stream nextPutAll: (self percentage * 100) asString, '%'
]

{ #category : #accessing }
RMPercentualTax >> percentage [
	^ percentage
]

{ #category : #accessing }
RMPercentualTax >> percentage: anObject [
	percentage := anObject
]

{ #category : #'public interface' }
RMPercentualTax >> taxMoneyFor: aMoney [
	^ aMoney * self percentage
]

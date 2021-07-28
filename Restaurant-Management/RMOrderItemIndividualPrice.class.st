Class {
	#name : #RMOrderItemIndividualPrice,
	#superclass : #RMDerivedPrice,
	#category : #'Restaurant-Management-Model'
}

{ #category : #accessing }
RMOrderItemIndividualPrice >> money [
	^ self reference menuItem price money
]

Class {
	#name : #RMOrderItemTotalPrice,
	#superclass : #RMDerivedPrice,
	#category : #'Restaurant-Management-Model'
}

{ #category : #accessing }
RMOrderItemTotalPrice >> money [
	^ self reference individualPrice money * self reference quantity
]

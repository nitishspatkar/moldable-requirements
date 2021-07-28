Class {
	#name : #RMMenuItemPrice,
	#superclass : #RMDerivedPrice,
	#category : #'Restaurant-Management-Model'
}

{ #category : #accessing }
RMMenuItemPrice >> money [
	^ self reference consumable price money
]

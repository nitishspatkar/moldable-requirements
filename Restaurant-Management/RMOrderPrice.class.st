Class {
	#name : #RMOrderPrice,
	#superclass : #RMDerivedPrice,
	#category : #'Restaurant-Management-Model'
}

{ #category : #accessing }
RMOrderPrice >> money [
	^ (self reference orderItems isEmpty
		ifTrue: [ RMZeroMoney new ]
		ifFalse: [ (self reference orderItems rmSum: [ :each | each price ]) money ])
]

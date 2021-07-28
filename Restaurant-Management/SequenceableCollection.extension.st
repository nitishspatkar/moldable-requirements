Extension { #name : #SequenceableCollection }

{ #category : #'*Restaurant-Management' }
SequenceableCollection >> rmSum: aBlock [
	"we do not use the default sum: because
	we do not want to remove the initial element at the end"
	| result |
	result := aBlock value: self first.
	^ self allButFirst inject: result into: [ :sum :each | sum + (aBlock value: each) ]
]

Class {
	#name : 'MyUserStatusOld',
	#superclass : 'Object',
	#category : 'MyMoldableRequirements-Models'
}

{ #category : 'instance creation' }
MyUserStatusOld class >> fromString: aString [
	| aStatusClass |
	
	aStatusClass := { 
		#'in-progress' -> MyUserStatusInProgress.
		#'not-started' -> MyUserStatusNotStarted.
		#'done' -> MyUserStatusDone
	}	asDictionary
			at: aString asSymbol
			ifAbsent: [ self error: 'Unknown status: ', aString ].
	
	^ aStatusClass new
]

{ #category : 'comparing' }
MyUserStatusOld >> = anObject [
	self == anObject
		ifTrue: [ ^ true ].
		
	^ self class = anObject class
]

{ #category : 'comparing' }
MyUserStatusOld >> hash [
	^ self class hash
]

{ #category : 'testing' }
MyUserStatusOld >> isDone [
	^ false
]

{ #category : 'testing' }
MyUserStatusOld >> isInProgress [
	^ false
]

{ #category : 'accessing' }
MyUserStatusOld >> label [
	^ self subclassResponsibility
]

{ #category : 'printing' }
MyUserStatusOld >> printOn: aStream [
	aStream nextPutAll: 'Status:'; space; nextPutAll: self label
]

{ #category : 'accessing' }
MyUserStatusOld >> statusColor [
	^ self subclassResponsibility
]

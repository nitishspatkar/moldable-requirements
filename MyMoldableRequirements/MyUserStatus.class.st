Class {
	#name : #MyUserStatus,
	#superclass : #Object,
	#category : #'MyMoldableRequirements-Models'
}

{ #category : #'instance creation' }
MyUserStatus class >> fromString: aString [
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

{ #category : #comparing }
MyUserStatus >> = anObject [
	self == anObject
		ifTrue: [ ^ true ].
		
	^ self class = anObject class
]

{ #category : #comparing }
MyUserStatus >> hash [
	^ self class hash
]

{ #category : #testing }
MyUserStatus >> isDone [
	^ false
]

{ #category : #testing }
MyUserStatus >> isInProgress [
	^ false
]

{ #category : #accessing }
MyUserStatus >> label [
	^ self subclassResponsibility
]

{ #category : #printing }
MyUserStatus >> printOn: aStream [
	aStream nextPutAll: 'Status:'; space; nextPutAll: self label
]

{ #category : #accessing }
MyUserStatus >> statusColor [
	^ self subclassResponsibility
]

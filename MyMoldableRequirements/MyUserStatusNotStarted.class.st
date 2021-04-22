Class {
	#name : #MyUserStatusNotStarted,
	#superclass : #MyUserStatusOld,
	#category : #'MyMoldableRequirements-Models'
}

{ #category : #accessing }
MyUserStatusNotStarted >> label [
	^ 'Not started'
]

{ #category : #accessing }
MyUserStatusNotStarted >> statusColor [
	^ Color lightRed
]

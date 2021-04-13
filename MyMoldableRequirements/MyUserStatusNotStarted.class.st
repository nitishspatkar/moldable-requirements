Class {
	#name : #MyUserStatusNotStarted,
	#superclass : #MyUserStatus,
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

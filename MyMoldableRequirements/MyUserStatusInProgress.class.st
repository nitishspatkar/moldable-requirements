Class {
	#name : #MyUserStatusInProgress,
	#superclass : #MyUserStatus,
	#category : #'MyMoldableRequirements-Models'
}

{ #category : #testing }
MyUserStatusInProgress >> isInProgress [
	^ true
]

{ #category : #accessing }
MyUserStatusInProgress >> label [
	^ 'In progress'
]

{ #category : #accessing }
MyUserStatusInProgress >> statusColor [
	^ Color lightYellow
]

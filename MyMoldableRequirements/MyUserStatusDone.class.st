Class {
	#name : #MyUserStatusDone,
	#superclass : #MyUserStatus,
	#category : #'MyMoldableRequirements-Models'
}

{ #category : #testing }
MyUserStatusDone >> isDone [
	^ true
]

{ #category : #accessing }
MyUserStatusDone >> label [
	^ 'Done'
]

{ #category : #accessing }
MyUserStatusDone >> statusColor [
	^ Color lightGreen
]

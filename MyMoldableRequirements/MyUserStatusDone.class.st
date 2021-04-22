Class {
	#name : #MyUserStatusDone,
	#superclass : #MyUserStatusOld,
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

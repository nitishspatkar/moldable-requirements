Class {
	#name : 'MyUserStatusInProgress',
	#superclass : 'MyUserStatusOld',
	#category : 'MyMoldableRequirements-Models'
}

{ #category : 'testing' }
MyUserStatusInProgress >> isInProgress [
	^ true
]

{ #category : 'accessing' }
MyUserStatusInProgress >> label [
	^ 'In progress'
]

{ #category : 'accessing' }
MyUserStatusInProgress >> statusColor [
	^ Color lightYellow
]

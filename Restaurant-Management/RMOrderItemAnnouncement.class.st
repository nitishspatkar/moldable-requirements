Class {
	#name : #RMOrderItemAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'orderItem'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #accessing }
RMOrderItemAnnouncement >> orderItem [
	^ orderItem
]

{ #category : #accessing }
RMOrderItemAnnouncement >> orderItem: anObject [
	orderItem := anObject
]

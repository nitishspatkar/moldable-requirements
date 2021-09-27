"
Generate a DateTime string that is compatible to the ReqIF format.
"
Class {
	#name : #LastChangeDateTimeGenerator,
	#superclass : #DateAndTime,
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
LastChangeDateTimeGenerator class >> dateTimeString [
	| dateTime stream |
	dateTime := super now.
	stream := String new writeStream.
	dateTime printOn: stream.
	
	^ stream contents 
	
]

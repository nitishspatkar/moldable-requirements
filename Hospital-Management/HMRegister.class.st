"
I keep track of the records of the staff member, such as their requests for vacations or seminras.

"
Class {
	#name : 'HMRegister',
	#superclass : 'Object',
	#instVars : [
		'records'
	],
	#category : 'Hospital-Management-Model'
}

{ #category : 'accessing' }
HMRegister >> gtRegisterFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Records';
		priority: 1;
		items: [ self days ];
		column: 'Day' text: [ :aDay | aDay ]
]

{ #category : 'initialize' }
HMRegister >> initialize [
	records := OrderedCollection new
]

{ #category : 'accessing' }
HMRegister >> records [
	^ records
]

{ #category : 'accessing' }
HMRegister >> records: aCollectionOfRecords [
	records := aCollectionOfRecords
]

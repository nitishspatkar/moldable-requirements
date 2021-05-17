"
I keep track of the records of the staff member, such as their requests for vacations or seminras.
"
Class {
	#name : #HMRegister,
	#superclass : #Object,
	#instVars : [
		'days'
	],
	#category : #'Hospital-Management-Model'
}

{ #category : #accessing }
HMRegister >> days: aNumber [
	"return a number of specified days"

	days := (1 to: aNumber) collect: [ :each | HMDay new aDayWithWishes ]
]

{ #category : #accessing }
HMRegister >> forOneMonth [
	<gtExample>
	| aRegister |
	aRegister := HMRegister new.
	aRegister days: 30.
	^ aRegister
]

{ #category : #accessing }
HMRegister >> gtRegisterFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Records';
		priority: 1;
		items: [ days ];
		"actionUpdateButtonTooltip: 'Update item list';"
			column: 'Index'
			item:
				[ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Item' text: [ :eachItem | eachItem gtDisplayText ]
]

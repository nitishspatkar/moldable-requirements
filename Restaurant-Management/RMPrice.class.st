Class {
	#name : #RMPrice,
	#superclass : #RMObject,
	#category : #'Restaurant-Management-Model'
}

{ #category : #'as yet unclassified' }
RMPrice class >> gtViewClassHierarchyIn: aView [
	<gtView>
	^ aView mondrian
		title: 'Map';
		priority: 101;
		painting: [ :view |
			| classes |
			classes := {RMPrice. RMConcretePrice}, 
				RMModifiedPrice withAllSubclasses.
			view nodes
				umlClassShapeWithName: [:x | x name ];
				"shape: [ :aClass |
					BlTextElement new
						text: aClass name asRopedText ];"
				with: classes.
			view edges 
				fromCenterBottom;
				toCenterTop;
				connectFrom: #superclass.
			view layout custom: GtGradVerticalTreeLayout new.
			view ]
]

{ #category : #operations }
RMPrice >> * aNumber [
	self assert: [ aNumber isKindOf: Number ].
	^ RMMultipliedPrice new
		price: self;
		multiplier: aNumber
]

{ #category : #operations }
RMPrice >> + anAdditionalPrice [
	self assert: [ anAdditionalPrice isKindOf: RMPrice ].
	^ RMSummedPrice new
		price: self;
		additionalPrice: anAdditionalPrice
]

{ #category : #operations }
RMPrice >> - anotherPrice [
	[ anotherPrice isKindOf: RMPrice ] assert.
	^ (self money - anotherPrice money) asPrice.
]

{ #category : #operations }
RMPrice >> / aDivisor [
	^ aDivisor dividingPrice: self

]

{ #category : #comparing }
RMPrice >> < aPrice [
	^ (aPrice isKindOf: RMPrice) and: [ 
		self money < aPrice money ]
]

{ #category : #comparing }
RMPrice >> = aPrice [
	^ (aPrice isKindOf: RMPrice) and: [ 
		aPrice money = self money ]
]

{ #category : #comparing }
RMPrice >> > aPrice [
	^ (aPrice isKindOf: RMPrice) and: [ 
		self money > aPrice money ]
]

{ #category : #operations }
RMPrice >> adaptToNumber: aNumber andSend: aString [
	^self perform: aString asSymbol withArguments: { aNumber }
]

{ #category : #ui }
RMPrice >> asOverviewChildrenIn: containerElement [
	| childrenElement |
	childrenElement := BlElement new
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent ];
		layout: BlLinearLayout horizontal;
		margin: (BlInsets all: 10).
	containerElement addChild: childrenElement.
	self children
		do: [ :child | child asOverviewElementIn: childrenElement ]
]

{ #category : #ui }
RMPrice >> asOverviewElementIn: aParentElement [
	| containerElement contentElement labelElement className |
	containerElement := BlElement new
			constraintsDo: [ :c | 
				c vertical fitContent.
				c horizontal fitContent ];
		background: Color white;
		look: BrShadowLook;
		margin: (BlInsets all: 10);
		layout: BlLinearLayout vertical.
	aParentElement addChild: containerElement.
	className := ((self class name first isVowel ifTrue: ['an '] ifFalse: ['a ']), self class name) asRopedText foreground: Color gray.
	
	containerElement addChild: (BrLabel new 
	look: (BrGlamorousLabelLook new fontSize: 10);
		text: className; 
		padding: (BlInsets all: 5);
		constraintsDo: [ :c | 
				c vertical exact: 5.
				c horizontal fitContent ]).
	contentElement := BlElement new
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent.
			c linear vertical alignCenter ];
		layout: BlLinearLayout horizontal.
	labelElement := BrLabel new 
		look: BrGlamorousLabelLook;
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent.
			c linear vertical alignCenter ];
		text: self money gtDisplayString;
		padding: (BlInsets all: 10).
	contentElement addChild: labelElement.
	containerElement addChild: contentElement.
	self children notEmpty ifTrue: [ 
		| equalElement childrenElement |
		equalElement := BrLabel new look: BrGlamorousLabelLook; text: '='; constraintsDo: [:c | c vertical fitContent. c horizontal fitContent. c linear vertical alignCenter ].
		contentElement addChild: equalElement.
		childrenElement := BlElement new
			constraintsDo: [ :c | 
				c vertical fitContent.
				c horizontal fitContent ];
			padding: (BlInsets all: 10);
			layout: BlLinearLayout horizontal alignCenter.
		contentElement addChild: childrenElement.
		self asOverviewChildrenIn: childrenElement ].
	containerElement addChild: (BrLabel new 
	look: (BrGlamorousLabelLook); 
			text: ' ';
			padding: (BlInsets all: 5);
			constraintsDo: [ :c | 
					c vertical exact: 5.
					c horizontal fitContent ])
]

{ #category : #accessing }
RMPrice >> children [
	^ {  }
]

{ #category : #operations }
RMPrice >> discountedBy: aMoneyOrPercentage [
	^ aMoneyOrPercentage discountFrom: self
]

{ #category : #operations }
RMPrice >> dividingPrice: aPrice [
	^ aPrice money / self money
]

{ #category : #printing }
RMPrice >> gtDisplayOn: stream [
	self moneyDisplayOn: stream
]

{ #category : #ui }
RMPrice >> gtElementForConnector [
	| parentElement |
	parentElement := BlElement new 
		constraintsDo: [ :c | 
				c vertical fitContent. 
				c horizontal fitContent ];
		layout: BlLinearLayout new.
	self asOverviewElementIn: parentElement.
	parentElement children first look: BrLook new.
	^ parentElement
]

{ #category : #ui }
RMPrice >> gtOverviewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Overview';
		priority: 104;
		stencil: [ 
			| parentElement |
			parentElement := BlElement new 
				constraintsDo: [ :c | c vertical fitContent. c horizontal fitContent ];
				layout: BlLinearLayout new.
			self asOverviewElementIn: parentElement.
			parentElement asPannableElement ]
]

{ #category : #ui }
RMPrice >> gtViewChildrenStructureIn: aView [
	<gtView>
	^ aView columnedTree
		title: 'Children';
		priority: 102;
		items: {self};
		children: [ :aPrice | aPrice children ];
		column: 'Total'
			text: [ :aTreeNode | aTreeNode value gtDisplayString ];
		column: 'Price/Operation'
			text: [ :aTreeNode | 
			String
				streamContents:
					[ :stream | aTreeNode value localWithPossibleParanthesesDisplayOn: stream ] ]
]

{ #category : #printing }
RMPrice >> localWithPossibleParanthesesDisplayOn: stream [
	self moneyDisplayOn: stream
]

{ #category : #accessing }
RMPrice >> max: aUprice [

	self > aUprice
		ifTrue: [ ^self ]
		ifFalse: [ ^ aUprice ]
]

{ #category : #accessing }
RMPrice >> money [
	^ self subclassResponsibility
]

{ #category : #printing }
RMPrice >> moneyDisplayOn: stream [
	self money gtDisplayOn: stream
]

{ #category : #printing }
RMPrice >> printOn: stream [
	super printOn: stream.
	stream space.
	self money gtDisplayOn: stream
]

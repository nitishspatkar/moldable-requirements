Class {
	#name : #RMInvoice,
	#superclass : #RMTimestampedObject,
	#instVars : [
		'announcer',
		'invoiceItems',
		'price'
	],
	#category : #'Restaurant-Management-Model'
}

{ #category : #ui }
RMInvoice class >> gtCoderParametrizedExamplesFor: aView [
	<gtClassView>
	^ aView list
		title: 'Parametized examples';
		priority: 20;
		items: [ 
			{
				RMInvoiceExamplesParametrized >> #invoiceForOrderItems:atTimestamp:.
				RMInvoiceExamplesParametrized >> #invoiceForOrderItemsReducedTax:regularTax:atTimestamp:.
				RMInvoiceExamplesParametrized >> #orderWithItemNamed:price:andTax:
			}
				collect:
					[ :anExampleMethod | EParametrizedExample new exampleMethod: anExampleMethod ] ];
		itemText: [ :aRunner | 
			(aRunner exampleMethod pragmaAt: #label:)
				ifNil: [ aRunner exampleMethod gtDisplayString ]
				ifNotNil: [ :pragma | pragma arguments first ] ];
		sendTool: [ :runner | 
			GtPhlowCompositeTool new
				addTool: (GtPhlowTool default object: runner);
				addTool: (GtParametrizedExampleRunnerTool new object: runner) ]
]

{ #category : #accessing }
RMInvoice >> addInvoiceItem: anInvoiceItem [ 
	self invoiceItems add: anInvoiceItem.
	self announcer announce: (RMInvoiceItemAdded new invoiceItem: anInvoiceItem)
]

{ #category : #accessing }
RMInvoice >> announcer [
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #connector }
RMInvoice >> buildBlankContainer: aModelObject [
	| container |
	container := BlElement new.
	container connector 
		model: aModelObject;
		beLayoutSource; 
		beLayoutTarget;
		beVisualTarget.

	container 
		size: 400@200; 
		background: Color white;
		look: BrShadowLook new;
		layout: BlLinearLayout new.
	
	^ container
]

{ #category : #connector }
RMInvoice >> buildBottomResizerFor: blankContainer [
	^  BlElement new
			look: BrGlamorousResizerBottomBarLook new;
			background: BrGlamorousColors editorBorderColor;
			constraintsDo: [ :c | c vertical exact: 5. c grid horizontal span: 2];
			addEventHandler: (BlResizerBottomListener new resizeTarget: blankContainer; minimumExtent: 0@75).

]

{ #category : #connector }
RMInvoice >> buildCloseButton: gtconnector [. 
	^ GtInspectorRoundButtonStencil new asElement
		icon: (GtInspectorPlusIconStencil close asElement);
		constraintsDo: [ :c |
			c ignoreByLayout.
			c margin: (BlInsets top: -10 left: 0 bottom: 0 right: -10).
			c ignored horizontal alignRight.
			c ignored vertical alignTop ];
		action: [ :e | gtconnector removeChild: e parent ].
				
			
]

{ #category : #connector }
RMInvoice >> buildDetailsElementFor: anObject for: gtconnector [
	| viewElement |
	viewElement := anObject gtElementForConnector.
	viewElement when: GtPhlowObjectToSpawn do: [ :spawnEvent | 
		gtconnector addEntity: spawnEvent object.
		spawnEvent consumed: true  ].
				
	^ viewElement
	
					
]

{ #category : #connector }
RMInvoice >> buildInspectButton: vocalEditorContainer [
	| aGoButton |
	aGoButton := GtInspectorRoundButtonStencil new asElement
		icon: (BrGlamorousVectorIcons inspect);
		constraintsDo: [ :c |
			c ignoreByLayout.
			c margin: (BlInsets top: -10 left: 0 bottom: 0 right: 0).
			c ignored horizontal alignCenter.
			c ignored vertical alignTop ].
	^ aGoButton.
]

{ #category : #connector }
RMInvoice >> buildRightResizerFor: blankContainer [
	^  BlElement new
			look: BrGlamorousResizerRightBarLook new;
			background: BrGlamorousColors editorBorderColor;
			constraintsDo: [ :c | c margin: (BlInsets right: 0). c horizontal exact: 5.];
			addEventHandler: (BlResizerRightListener new resizeTarget: blankContainer; minimumExtent: 75@0).

]

{ #category : #connector }
RMInvoice >> buildSourceButton: vocalEditorContainer [
	| aGoButton |
	aGoButton := GtInspectorRoundButtonStencil new asElement
		icon: (BrGlamorousIcons file asElement);
		constraintsDo: [ :c |
			c ignoreByLayout.
			c margin: (BlInsets top: -10 left: 0 bottom: 0 right: 0).
			c ignored horizontal alignCenter.
			c ignored vertical alignTop ].
	^ aGoButton.
]

{ #category : #connector }
RMInvoice >> detailsContainer [
	^ BlElement new
		constraintsDo: [ :c | 
			c vertical matchParent. 
			c horizontal matchParent ];
		layout: BlLinearLayout new
]

{ #category : #connector }
RMInvoice >> gtConnectionsFor: aView [
	<gtView>
	^ aView explicit
		title: 'Connections';
		stencil: [	
			| gtconnector  |
			gtconnector := GtConnector new.
			gtconnector stencil: [ :modelObject |
				| blankContainer detailsContainer detailsElement playButton objectPreview sourceButton aBottomResizer aRightResizer aCloseButton|
				"The blankContainer is there as a placeholder for toggling between the source and the output of the example."
				
				blankContainer := self buildBlankContainer: modelObject.
				blankContainer clipChildren: false.
				aRightResizer := self buildRightResizerFor: blankContainer.
				aBottomResizer := self buildBottomResizerFor: blankContainer.
				
				detailsContainer := self detailsContainer.
				detailsElement := self buildDetailsElementFor: modelObject for: gtconnector.
				detailsContainer addChild: detailsElement.
				
				playButton := self buildInspectButton: detailsContainer.
				sourceButton := self buildSourceButton: detailsContainer.
				aCloseButton := self buildCloseButton: gtconnector. 
				
				blankContainer addChild: detailsContainer.
				blankContainer addChild: aRightResizer.
				blankContainer addChild: aBottomResizer.
				blankContainer addChild: playButton.
				blankContainer addChild: aCloseButton.
				objectPreview := (modelObject gtViewsFor: GtPhlowView empty) asElementDo: [:e | e ].
				
				sourceButton action: [
					blankContainer removeChild: objectPreview.
					blankContainer removeChild: aRightResizer.
					blankContainer removeChild: aBottomResizer.
					blankContainer removeChild: sourceButton.
					blankContainer removeChild: aCloseButton.
					blankContainer addChild: detailsContainer.
					blankContainer addChild: aRightResizer.
					blankContainer addChild: aBottomResizer.
					blankContainer addChild: playButton.
					blankContainer addChild: aCloseButton.].
				
				playButton action: [
					blankContainer removeChild: detailsContainer.
					blankContainer removeChild: aRightResizer.
					blankContainer removeChild: aBottomResizer.
					blankContainer removeChild: playButton.
					blankContainer removeChild: aCloseButton.
					blankContainer addChild: objectPreview.
					blankContainer addChild: aRightResizer.
					blankContainer addChild: aBottomResizer.
					blankContainer addChild: aCloseButton.
					blankContainer addChild: sourceButton.
				].
				blankContainer
			].
			gtconnector addEntity: self.
			gtconnector asPannableElement ]
]

{ #category : #ui }
RMInvoice >> gtDetailsFor: aView [
	<gtView>
	| vatContainer |
	^ aView explicit
		title: 'Details';
		priority: 0;
		stencil: [ | aGrid anItemStencil theHeaders theItems total |
			aGrid := BlElement new.
			aGrid
				layout:
					(BlGridLayout horizontal
						cellSpacing: 1;
						columnCount: 4).
			aGrid padding: (BlInsets all: 20).
			aGrid
				constraintsDo: [ :c | 
					c horizontal exact: 400.
					c vertical fitContent ].
			theHeaders := {'Item' . 'Quantity' . 'Item price' . 'Subtotal'}
				withIndexCollect: [ :eachName :anIndex | 
					BrLabel new
						background: Color white;
						aptitude: (BrGlamorousLabelLook new fontSize: 15);
						padding: (BlInsets all: 10);
						constraintsDo: [ :c | 
							c grid horizontal alignRight.
							c grid vertical alignCenter ];
						text: eachName ].
			anItemStencil := [ :eachInvoiceItem | 
			#(name quantity individualPrice price)
				withIndexCollect: [ :eachProperty :anIndex | 
					BrLabel new
						background: Color white;
						aptitude: (BrGlamorousLabelLook new fontSize: 12);
						padding:
							(BlInsets
								top: 5
								left: 10
								bottom: 5
								right: 10);
						text:
							((eachProperty cull: eachInvoiceItem) isString
								ifTrue: [ eachProperty cull: eachInvoiceItem ]
								ifFalse: [ (eachProperty cull: eachInvoiceItem) gtDisplayString ]);
						when: BlClickEvent
							do: [ :anEvent | 
							anEvent currentTarget
								fireEvent:
									(GtPhlowObjectToSpawn new
										object: eachInvoiceItem;
										sourceElement: anEvent currentTarget) ];
						constraintsDo: [ :c | 
							c grid horizontal alignRight.
							c grid vertical alignCenter ];
						in: [ :e | 
							eachProperty = #price
								ifTrue: [ e connector
										model: eachInvoiceItem;
										beVisualSource ] ];
						yourself ] ].
			theItems := self invoiceItems
				flatCollect: anItemStencil
				as: OrderedCollection.
			total := BrLabel new
				aptitude: (BrGlamorousLabelLook new fontSize: 15);
				text: 'Total: ' , self price gtDisplayString;
				padding:
					(BlInsets
						top: 5
						left: 10
						bottom: 5
						right: 10);
				constraintsDo: [ :c | 
					c grid horizontal span: 4.
					c grid horizontal alignRight.
					c grid vertical alignCenter ].
			vatContainer := BlElement new
				layout: (BlLinearLayout vertical cellSpacing: 5);
				padding:
					(BlInsets
						top: 5
						left: 10
						bottom: 5
						right: 10);
				constraintsDo: [ :c | 
					c vertical fitContent.
					c horizontal fitContent.
					c grid horizontal span: 4.
					c grid horizontal alignRight.
					c grid vertical alignCenter ].
			self splitBySameApplicableTax
				do: [ :aSplit | 
					| vat |
					vat := BrLabel new
						constraintsDo: [ :c | c linear horizontal alignRight ];
						aptitude: (BrGlamorousLabelLook new fontSize: 12);
						text:
							aSplit taxComputation gtDisplayString , ' VAT: '
								, aSplit taxMoney gtDisplayString;
						when: BlClickEvent
							do: [ :anEvent | 
							anEvent currentTarget
								fireEvent:
									(GtPhlowObjectToSpawn new
										object: aSplit;
										sourceElement: anEvent currentTarget) ].
					vatContainer addChild: vat ].
			aGrid addChildren: theHeaders.
			aGrid addChildren: theItems.
			aGrid
				addChild:
					(BlElement new
						constraintsDo: [ :c | 
							c horizontal matchParent.
							c vertical exact: 1.
							c grid horizontal span: 3.
							c grid vertical alignCenter ])
				as: #span.
			aGrid
				addChild:
					(BlElement new
						background: Color gray;
						margin: (BlInsets top: 20 right: 10);
						constraintsDo: [ :c | 
							c horizontal matchParent.
							c vertical exact: 1.
							c grid vertical alignCenter ]).
			aGrid addChild: total.
			aGrid addChild: vatContainer.
			self announcer
				when: RMInvoiceItemAdded
				do: [ :anAnnouncement | 
					| newItems |
					newItems := anItemStencil value: anAnnouncement invoiceItem.
					theItems addAll: newItems.
					total text: 'Total: ' , self price gtDisplayString.
					vatContainer removeChildren.
					self splitBySameApplicableTax
						do: [ :aSplit | 
							| vat |
							vat := BrLabel new
								constraintsDo: [ :c | c linear horizontal alignRight ];
								look: (BrGlamorousLabelLook new fontSize: 12);
								text:
									aSplit taxComputation gtDisplayString , ' VAT: '
										, aSplit taxMoney gtDisplayString;
								when: BlClickEvent
									do: [ :anEvent | 
									anEvent currentTarget
										fireEvent:
											(GtPhlowObjectToSpawn new
												object: aSplit;
												sourceElement: anEvent currentTarget) ].
							vatContainer addChild: vat ].
					newItems
						do: [ :eachItem | 
							aGrid
								addChild: eachItem
								at: (aGrid childIndexOf: (aGrid childNamed: #span)) ] ].
			self announcer when: RMInvoiceItemRemoved do: [  ].
			aGrid asScalableElement ]
]

{ #category : #connector }
RMInvoice >> gtElementForConnector [
	^ (self gtDetailsFor: GtPhlowEmptyView new) 
		asElementDo: [ :e | e ]
]

{ #category : #ui }
RMInvoice >> gtInvoiceItemsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Items';
		items: [ self invoiceItems ];
		column: 'Item' do: [ :aColumn | aColumn item: [:invoiceItem | invoiceItem name] ];
		column: 'Quantity' do: [ :aColumn | aColumn item: [ :invoiceItem | invoiceItem quantity gtDisplayString, 'x' ] ];
		column: 'Item Price' do: [ :aColumn | aColumn item: [ :invoiceItem | invoiceItem orderItem menuItem price gtDisplayString] ];
		column: 'Total Price' do: [ :aColumn | aColumn item: [ :invoiceItem | invoiceItem price gtDisplayString ] ];
		column: 'Tax rate' do: [ :aColumn | aColumn item: [ :invoiceItem | invoiceItem applicableTax gtDisplayString ]]
]

{ #category : #ui }
RMInvoice >> gtPathFor: aView [
	<gtView>
	^ aView mondrian
		title: 'Path';
		painting: [ :mondrian | self paintPathWith: mondrian ]
]

{ #category : #initialization }
RMInvoice >> initialize [
	super initialize.
	invoiceItems := OrderedCollection new.
	price := RMInvoicePrice new reference: self
]

{ #category : #accessing }
RMInvoice >> invoiceItems [
	^ invoiceItems
]

{ #category : #accessing }
RMInvoice >> invoiceItems: anObject [
	invoiceItems := anObject
]

{ #category : #ui }
RMInvoice >> paintPathWith: mondrian [
	| menuItems |
	menuItems := ((self invoiceItems collect: #orderItem) collect: #menuItem) removeDuplicates.
	mondrian nodes 
		stencil: [ :each |
			(each isKindOf: RMInvoice) 
				ifTrue: [
			BlElement new
				background: Color white;
				layout: BlLinearLayout vertical;
				constraintsDo: [ :c | c horizontal fitContent. c vertical fitContent ];
				look: BrShadowLook new;
				addChild: (BrLabel new 
							text: ((Character space join: each class name allButFirst gtPiecesCutWhereCamelCase) asRopedText);
							look: BrGlamorousLabelLook;
							hFitContent;
							
							margin: (BlInsets all: 5 ));
				addChild: (BrLabel new 
							constraintsDo: [ :c | c linear horizontal alignCenter. ];
							text: (each price gtDisplayString asRopedText );
							look: BrGlamorousLabelLook;
							hFitContent;
							margin:(BlInsets top: 5 left: 5 bottom: 0  right: 5))
				
				
				]
				ifFalse: [
			BlElement new
				background: Color white;
				layout: BlLinearLayout vertical;
				constraintsDo: [ :c | c horizontal fitContent. c vertical fitContent ];
				look: BrShadowLook new;
				addChild: (BrLabel new 
							constraintsDo: [ :c | c linear horizontal alignCenter. ];
							text: ((Character space join: each class name allButFirst gtPiecesCutWhereCamelCase) asRopedText foreground: Color gray; fontSize: 8);
							look: BrGlamorousLabelLook;
							hFitContent;
							margin: (BlInsets all: 0 ));
				addChild: (BrLabel new 
							constraintsDo: [ :c | c linear horizontal alignCenter. ];
							text: (each name asRopedText );
							look: BrGlamorousLabelLook;
							hFitContent;
							margin:(BlInsets top: 5 left: 5 bottom: 0  right: 5));
				addChild: (BrLabel new 
							constraintsDo: [ :c | c linear horizontal alignCenter. ];
							text: ((each individualPrice gtDisplayString, ' / ',
							each applicableTax  gtDisplayString, ' tax') asRopedText );
							look: BrGlamorousLabelLook;
							hFitContent;
							margin: ((BlInsets top: 0 left: 5 bottom: 5  right: 5) ))
				 ] ];
		with: 
			{self}, 
		self invoiceItems, 
		(self invoiceItems collect: #orderItem),
		menuItems,
		(menuItems collect: #consumable).
	mondrian edges 
		shape: [ :each |
					BlParabollaArcElement new 
						zIndex: 0;
						curvatureFraction: 0.2;
						border: (BlBorder paint: (Color gray alpha: 0.2) width: 2);
						toHead: (BlArrowheadSimpleArrow new
							border: (BlBorder builder paint: (Color gray alpha: 0.2); width: 2; build))  ];
		fromRightCenter;
		toLeftCenter;
		connect: { self } toAll: #invoiceItems.
	mondrian edges 
		shape: [ :each |
					BlParabollaArcElement new 
						zIndex: 0;
						curvatureFraction: 0.2;
						border: (BlBorder paint: (Color gray alpha: 0.2) width: 2);
						toHead: (BlArrowheadSimpleArrow new
							border: (BlBorder builder paint: (Color gray alpha: 0.2); width: 2; build))  ];
		fromRightCenter;
		toLeftCenter;
		connect: self invoiceItems from: #yourself to: #orderItem.
	mondrian edges 
		shape: [ :each |
					BlParabollaArcElement new 
						zIndex: 0;
						curvatureFraction: 0.2;
						border: (BlBorder paint: (Color gray alpha: 0.2) width: 2);
						toHead: (BlArrowheadSimpleArrow new
							border: (BlBorder builder paint: (Color gray alpha: 0.2); width: 2; build))  ];
		fromRightCenter;
		toLeftCenter;
		connect: (self invoiceItems collect: #orderItem) from: #yourself to: [:orderItem | menuItems detect: [:each | each = orderItem menuItem ] ].  
	
	mondrian edges 
		shape: [ :each |
					BlParabollaArcElement new 
						zIndex: 0;
						curvatureFraction: 0.2;
						border: (BlBorder paint: (Color gray alpha: 0.2) width: 2);
						toHead: (BlArrowheadSimpleArrow new
							border: (BlBorder builder paint: (Color gray alpha: 0.2); width: 2; build))  ];
		fromRightCenter;
		toLeftCenter;
		connect: menuItems from: #yourself to: #consumable.	
	
	mondrian layout custom: (GtGradHorizontalDominanceCenteredTreeLayout new levelDistance: 10; nodeDistance: 35).
]

{ #category : #accessing }
RMInvoice >> price [
	^ price
]

{ #category : #accessing }
RMInvoice >> price: aPrice [
	price := aPrice
]

{ #category : #accessing }
RMInvoice >> printOn: aStream [
	self invoiceItems 
		do: [:anItem | anItem printOn: aStream ]
		separatedBy: [ aStream nextPutAll: ', ' ]
]

{ #category : #accessing }
RMInvoice >> removeInvoiceItem: anInvoiceItem [
	self invoiceItems remove: anInvoiceItem.
	self announcer announce: (RMInvoiceItemRemoved new invoiceItem: anInvoiceItem)
]

{ #category : #accessing }
RMInvoice >> splitBySameApplicableTax [
	^ (self invoiceItems groupedBy: [ :anInvoiceItem | anInvoiceItem applicableTax percentage ])
		values collect: [ :aCollection | RMInvoiceSplitBySameTax new invoiceItems: aCollection ]
]

{ #category : #accessing }
RMInvoice >> taxMoney [
	^ self splitBySameApplicableTax rmSum: [ :each | each taxMoney ]
]

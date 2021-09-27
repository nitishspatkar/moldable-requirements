"
This class represents a parsed ReqIF document.

To create a new ReqIF object, use the ReqIFParser.
"
Class {
	#name : #ReqIF,
	#superclass : #Object,
	#instVars : [
		'lang',
		'coreContent',
		'theHeader',
		'toolExtensions',
		'announcer'
	],
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
ReqIF >> announcer [
	^ announcer
]

{ #category : #accessing }
ReqIF >> announcer: anAnnouncer [
	announcer := anAnnouncer
	
]

{ #category : #accessing }
ReqIF >> coreContent [
	^ coreContent
]

{ #category : #accessing }
ReqIF >> coreContent: anObject [
	coreContent := anObject
]

{ #category : #accessing }
ReqIF >> gtViewDatatypesOn: aView [
	<gtView>
	^ aView columnedList
		title: 'Datatypes';
		priority: 1;
		items: [((self coreContent) datatypes) asArray];
		column: 'Name' text: [:aDatatype | aDatatype longName];
		column: 'Type' text: [:aDatatype | aDatatype type];
		column: 'Last Change' text: [:aDatatype | aDatatype lastChange];
		actionButtonIcon: BrGlamorousIcons open 
			tooltip: 'Open XML' 
			action: [ self openAsXml ];
		actionButtonIcon: BrGlamorousIcons save 
			tooltip: 'Save as .reqif' 
			action: [ self saveAsReqifFile ].
]

{ #category : #accessing }
ReqIF >> gtViewHeaderOn: aView [
	<gtView>
	^ aView columnedList
		title: 'Header';
		priority: 0;
		items: [(self headerItems)];
		column: 'Property' text: [:aSpecType | aSpecType at: 1 ];
		column: 'Value' text: [:aSpecType | aSpecType at: 2 ];
		send: [:aSpecType | theHeader ];
		updateWhen: HeaderChanged in: [ announcer ];
		actionButtonIcon: BrGlamorousIcons open 
			tooltip: 'Open XML' 
			action: [ self openAsXml ];
		actionButtonIcon: BrGlamorousIcons save 
			tooltip: 'Save as .reqif' 
			action: [ self saveAsReqifFile ].
]

{ #category : #accessing }
ReqIF >> gtViewSpecObjectsOn: aView [
	<gtView>
	^ aView columnedList 
		title: 'Spec Objects';
		priority: 3;
		items: [((self coreContent) specObjects) asArray];
		column: 'Type' text: [:aSpecObject | aSpecObject type longName];
		column: 'ID' text: [:aSpecObject | aSpecObject identifier];
		column: 'Long Name' text: [:aSpecObject | aSpecObject longName];
		column: 'Desc' text: [:aSpecObject | aSpecObject desc];
		column: 'Last Change' text: [:aSpecObject | aSpecObject lastChange];
		updateWhen: ReqIFChanged in: [ announcer ];
		actionDropdownButtonIcon: BrGlamorousVectorIcons add
			tooltip: 'Add a spec object'
			content: [ | specObject |
			specObject := SpecObject new.
			specObject coreContent: coreContent.
			specObject asTypeSelector: [ ]. ];
		actionButtonIcon: BrGlamorousIcons open 
			tooltip: 'Open XML' 
			action: [ self openAsXml ];
		actionButtonIcon: BrGlamorousIcons save 
			tooltip: 'Save as .reqif' 
			action: [ self saveAsReqifFile ].
]

{ #category : #accessing }
ReqIF >> gtViewSpecTypesOn: aView [
	<gtView>
	^ aView columnedList
		title: 'Spec Types';
		priority: 2;
		items: [((self coreContent) specTypes) asArray];
		column: 'Name' text: [:aSpecType | aSpecType longName];
		column: 'Type' text: [:aSpecType | aSpecType class];
		column: 'Last Change' text: [:aSpecType | aSpecType lastChange];
		actionButtonIcon: BrGlamorousIcons open 
			tooltip: 'Open XML' 
			action: [ self openAsXml ];
		actionButtonIcon: BrGlamorousIcons save 
			tooltip: 'Save as .reqif' 
			action: [ self saveAsReqifFile ].
]

{ #category : #accessing }
ReqIF >> gtViewSpecificationsOn: aView [
	<gtView>
	^ aView columnedList
		title: 'Specifications';
		priority: 4;
		items: [((self coreContent) specifications) asArray];
		column: 'Name' text: [:aSpecification | aSpecification longName];
		column: 'Last Change' text: [:aSpecification | aSpecification lastChange];
		actionButtonIcon: BrGlamorousIcons open 
			tooltip: 'Open XML' 
			action: [ self openAsXml ];
		actionButtonIcon: BrGlamorousIcons save 
			tooltip: 'Save as .reqif' 
			action: [ self saveAsReqifFile ].
]

{ #category : #accessing }
ReqIF >> headerItems [
	| header identifier title comment creationTime reqIFToolId reqIFVersion sourceToolId headerItemsArray collection |
	
	header := (self theHeader).
	identifier := (header identifier).
	title := (header title).
	comment := (header comment).
	creationTime := (header creationTime).
	reqIFToolId := (header reqIFToolId).
	reqIFVersion := (header reqIFVersion).
	sourceToolId := (header sourceToolId).
	
	collection := OrderedCollection new.
	collection add: (Array with: 'Identifier' with: identifier).
	collection add: (Array with: 'Title' with: title).
	collection add: (Array with: 'Comment' with: comment).
	collection add: (Array with: 'Creation Time' with: creationTime).
	collection add: (Array with: 'ReqIF Tool ID' with: reqIFToolId).
	collection add: (Array with: 'ReqIF Version' with: reqIFVersion).
	collection add: (Array with: 'Source Tool ID' with: sourceToolId).
	
	^ collection
]

{ #category : #accessing }
ReqIF >> initialize [
	super initialize.
	announcer := Announcer new.
]

{ #category : #accessing }
ReqIF >> lang [
	^ lang
]

{ #category : #accessing }
ReqIF >> lang: anObject [
	lang := anObject
]

{ #category : #accessing }
ReqIF >> openAsXml [
| aWriter aStream |
aWriter := XMLWriter new.
aWriter
	enablePrettyPrinting;
	xml.
self writeOn: aWriter.
aStream := aWriter asString.
aStream inspect
]

{ #category : #accessing }
ReqIF >> saveAsReqifFile [
| aWriter currentTime fileName |
	
aWriter := XMLWriter new.
aWriter
	enablePrettyPrinting;
	xml.
self writeOn: aWriter.

currentTime := (DateAndTime now) asFileNameCompatibleString.
fileName := 'dummy_reqif_requirements_out_' , currentTime , '.reqif'.

(fileName asFileReference) writeStreamDo: [ :ws | 
	ws nextPutAll: aWriter write contents 
]

]

{ #category : #accessing }
ReqIF >> theHeader [
	^ theHeader
]

{ #category : #accessing }
ReqIF >> theHeader: anObject [
	theHeader := anObject
]

{ #category : #accessing }
ReqIF >> toolExtensions [
	^ toolExtensions
]

{ #category : #accessing }
ReqIF >> toolExtensions: anObject [
	toolExtensions := anObject
]

{ #category : #accessing }
ReqIF >> writeOn: aWriter [	
	aWriter tag
		name: 'REQ-IF';
		xmlnsAt: '' put: 'http://www.omg.org/spec/ReqIF/20110401/reqif.xsd';
		xmlnsAt: 'configuration' put: 'http://eclipse.org/rmf/pror/toolextensions/1.0';
		with: [
			aWriter tag: 'THE-HEADER' with: [ theHeader writeOn: aWriter ].
			aWriter tag: 'CORE-CONTENT' with: [ coreContent writeOn: aWriter ].
		]
]

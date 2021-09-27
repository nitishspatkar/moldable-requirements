"
A class for parsing files implementing the Requirements Interchange Format (ReqIF). 
Find more informations about the format here: https://www.omg.org/spec/ReqIF


"
Class {
	#name : #ReqIFParser,
	#superclass : #Object,
	#instVars : [
		'doc',
		'reqIF'
	],
	#category : #'MyMoldableRequirements-ReqIF'
}

{ #category : #accessing }
ReqIFParser >> gtParseReqIFAndPersistExample [
	<gtExample>
	| fileReference aReqIF aStream aWriter |
	
	fileReference := GtResourcesUtility uniqueInstance resourceAtPath: 'nitishspatkar/moldable-requirements/dummy_reqif_requirements.reqif'.
	aReqIF := self parse: fileReference.
	aReqIF inspect.
	
	aWriter := XMLWriter new.
	aWriter
		enablePrettyPrinting;
		xml.
		
	aReqIF writeOn: aWriter.
	
	'dummy_reqif_requirements_out.reqif' asFileReference writeStreamDo: [ :ws | 
		ws nextPutAll: aWriter write contents 
	].
]

{ #category : #accessing }
ReqIFParser >> gtParseReqIFExample [
	<gtExample>
	| fileReference aReqIF aStream aWriter |
	
	fileReference := GtResourcesUtility uniqueInstance resourceAtPath: 'nitishspatkar/moldable-requirements/dummy_reqif_requirements.reqif'.
	aReqIF := self parse: fileReference.
	aReqIF inspect.
]

{ #category : #accessing }
ReqIFParser >> parse: aFileReference [
	| contents |
	contents := aFileReference readStreamDo: [:stream | stream contents].
	doc := (XMLDOMParser on: contents)
		documentReadLimit: contents size;
		parseDocument.
	
	reqIF := ReqIF new.
	reqIF theHeader: (self parseHeader: reqIF).
	reqIF coreContent: (self parseContent: reqIF).
	reqIF toolExtensions: (self parseToolExtensions: reqIF).
	
	^ reqIF
]

{ #category : #private }
ReqIFParser >> parseContent: aReqIF [
	| coreContent |
	
	coreContent := ReqIFContent new.
	coreContent datatypes: (self parseDatatypes: coreContent).
	coreContent specTypes: (self parseSpecTypes: coreContent).
	coreContent specObjects: (self parseSpecObjects: coreContent).
	coreContent specifications: (self parseSpecifications: coreContent).
	coreContent documentRoot: aReqIF.
	
	^ coreContent
]

{ #category : #private }
ReqIFParser >> parseDatatypes: aCoreContentObject [
	| datatypePath datatypes |
	datatypePath := XPath for: '//DATATYPES/*'.
	datatypes := Dictionary new.
	
	(datatypePath in: doc) do: [ :datatype | 
		datatypes add: ((datatype attributeAt: 'IDENTIFIER') -> ((Mapper classForTag: (datatype name)) fromRawData: datatype coreContent: aCoreContentObject)) 
	].
	
	^ datatypes
]

{ #category : #private }
ReqIFParser >> parseHeader: aReqIF [
	| reqIFHeader headerPath headerElement |
	reqIFHeader := ReqIFHeader new.
	
	headerPath := XPath for: 'REQ-IF/THE-HEADER/REQ-IF-HEADER'.
	headerElement := (headerPath in: doc) firstElement.
	
	reqIFHeader identifier: (headerElement attributeAt: 'IDENTIFIER').
	reqIFHeader comment: (headerElement contentStringAt: 'COMMENT').
	reqIFHeader creationTime: (headerElement contentStringAt: 'CREATION-TIME').
	reqIFHeader reqIFToolId: (headerElement contentStringAt: 'REQ-IF-TOOL-ID').
	reqIFHeader reqIFVersion: (headerElement contentStringAt: 'REQ-IF-VERSION').
	reqIFHeader sourceToolId: (headerElement contentStringAt: 'SOURCE-TOOL-ID').
	reqIFHeader title: (headerElement contentStringAt: 'TITLE').
	reqIFHeader documentRoot: aReqIF.
	
	^ reqIFHeader
]

{ #category : #private }
ReqIFParser >> parseSpecObjects: aCoreContentObject [
	| specObjectsPath specObjects |
	specObjectsPath := XPath for: '//SPEC-OBJECTS/SPEC-OBJECT'.
	specObjects := Dictionary new.
	
	(specObjectsPath in: doc) do: [ :specObject | 
		specObjects add: ((specObject attributeAt: 'IDENTIFIER') -> (SpecObject fromRawData: specObject coreContent: aCoreContentObject)) 
	].
	
	^ specObjects
]

{ #category : #private }
ReqIFParser >> parseSpecTypes: aCoreContentObject [
	| specTypesPath specTypes |
	specTypesPath := XPath for: '//SPEC-TYPES/*'.
	specTypes := Dictionary new.
	
	(specTypesPath in: doc) do: [ :specType | 
		specTypes add: ((specType attributeAt: 'IDENTIFIER') -> ((Mapper classForTag: (specType name)) fromRawData: specType coreContent: aCoreContentObject)) 
	].
	
	^ specTypes
]

{ #category : #private }
ReqIFParser >> parseSpecifications: aCoreContentObject [
	| specificationsPath specifications |
	specificationsPath := XPath for: '//SPECIFICATIONS/SPECIFICATION'.
	specifications := Dictionary new.
	
	(specificationsPath in: doc) do: [ :specification | 
		specifications add: ((specification attributeAt: 'IDENTIFIER') -> (Specification fromRawData: specification coreContent: aCoreContentObject)) 
	].
	
	^ specifications
]

{ #category : #private }
ReqIFParser >> parseToolExtensions: aReqIF [
	| toolExtensionsCollection toolExtension path collection |
	
	toolExtensionsCollection := OrderedCollection new.
	path := XPath for: 'REQ-IF/TOOL-EXTENSIONS/REQ-IF-TOOL-EXTENSION'.
	(path in: doc) do: [ :element | 
		toolExtension := ReqIFToolExtension new.
		toolExtension documentRoot: aReqIF.
		toolExtension originalXMLContent: element contentString.
		toolExtensionsCollection add: toolExtension ].
	
	^ toolExtensionsCollection
]

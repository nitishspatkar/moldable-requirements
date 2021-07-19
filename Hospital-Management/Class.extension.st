Extension { #name : 'Class' }

{ #category : '*Hospital-Management' }
Class >> computeRelatedPages [
	| targetDatabase relatedPages |
	relatedPages := OrderedCollection new.
	targetDatabase := LeDatabasesRegistry defaultLogicalDatabase databaseNamed: 'Hospital Management System'.
	targetDatabase pagesDo: [ :aPage |
		| hasClassLink |
		hasClassLink := false.
		aPage allChildrenBreadthFirstDo: [ :aSnippet |
			aSnippet isTextSnippet ifTrue: [ 
				((LeParser parseWithErrors: aSnippet text) 
					allNodesOfType: LeDocumenterAnnotationNode do:  [ :aNode |
						(aNode annotation items first value value = self name) ifTrue: [ 
							 hasClassLink := true ] ]) ] ].
		hasClassLink ifTrue: [ 
			 relatedPages add: aPage ] ].
	^ relatedPages
]

{ #category : '*Hospital-Management' }
Class >> gtViewRelatedPagesFor: aView [
	<gtView>
	<gtClassView>
	^ aView list
		title: 'Related pages';
		items: [ self computeRelatedPages ];
		itemText: [ :aPage | aPage title ]
]

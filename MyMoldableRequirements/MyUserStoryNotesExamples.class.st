Class {
	#name : #MyUserStoryNotesExamples,
	#superclass : #Object,
	#category : 'MyMoldableRequirements-Examples'
}

{ #category : #examples }
MyUserStoryNotesExamples >> addingNewNotes [
	| notes |
	
	notes := MyNotes new
		addNote: (MyNote new description: 'Note A');
		addNote: (MyNote new description: 'Note B');
		addNote: (MyNote new description: 'Note C');
		addNote: (MyNote new description: 'Note D').
	
	notes addNote: (MyNote new description: 'Note G').

	^ MyUserStoryNotesElement new
		notes: notes.
]

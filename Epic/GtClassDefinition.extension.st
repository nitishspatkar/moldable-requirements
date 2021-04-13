Extension { #name : #GtClassDefinition }

{ #category : #'*Epic' }
GtClassDefinition >> forNewWithName: aString [
	"Initialize the class addition environment with a pre-defined name"
	| anEnvironment |
	name := aString asSymbol.
	originalName := name.
	
	anEnvironment := RGEnvironment new.
	anEnvironment backend: (RGReadOnlyImageBackend for: anEnvironment).
	
	layout := Object classLayout asRingMinimalDefinitionIn: anEnvironment.
	
	superclass := (GtClassSuperclassDefinition named: Object name) parent: self.
	category := GtCategoryDefinition empty parent: self.
	slots := GtSlotsDefinition empty parent: self.
	classVariables := GtClassVariablesDefinition empty parent: self.
	
	traits := GtTraitsDefinition empty parent: self.
	pools := GtPoolsDefinition empty parent: self
]

{ #category : #'*Epic' }
GtClassDefinition class >> forNewWithName: aString [
	^ self new forNewWithName: aString
]

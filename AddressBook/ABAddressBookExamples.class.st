"
This class contains tests.

example := (ABAddressBookExamples >> #exampleAddContact:toAddressBook:) gtParametrizedExample.

example arguments: {
	ABContact johnDoe. ABAddressBook emptyAddressBook }.
	
result := example run.
result returnValue.
"
Class {
	#name : #ABAddressBookExamples,
	#superclass : #TestCase,
	#category : #'AddressBook-Examples'
}

"
I only return string instances of addresses types.
Available are home, other, work
call me as 'ABAddressType home'
"
Class {
	#name : #ABAddressType,
	#superclass : #Object,
	#instVars : [
		'type'
	],
	#category : #'AddressBook-Model'
}

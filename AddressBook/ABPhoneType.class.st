"
I only return string instances of addresses types.
Available are company, home, mobile, other, pager, work
call me as 'ABAddressType home'

"
Class {
	#name : #ABPhoneType,
	#superclass : #Object,
	#instVars : [
		'type'
	],
	#classInstVars : [
		'knownType'
	],
	#category : #'AddressBook-Model'
}

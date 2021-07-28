Class {
	#name : #RMInvoiceExamples,
	#superclass : #Object,
	#category : #'Restaurant-Management-Examples'
}

{ #category : #examples }
RMInvoiceExamples >> invoiceWithMultipleItems [
	<gtExample>
	| invoice invoiceItem1 order greenSaladMenuItem burgerMenuItem greenSalad burger greenSaladOrderItem burgerOrderItem invoiceItem2 mixedSalad sirloinSteak mixedSaladMenuItem sirloinSteakMenuItem mixedSaladOrderItem sirloinSteakOrderItem invoiceItem3 invoiceItem4 regularTax |
	regularTax := self regularTax.
	greenSalad := RMConsumable new
		name: 'Green salad';
		price: 4 EUR asPrice;
		applicableTax: regularTax.
	mixedSalad := RMConsumable new
		name: 'Mixed salad';
		price: 7 EUR asPrice;
		applicableTax: regularTax.
	burger := RMConsumable new
		name: 'Burger';
		price: 9 EUR asPrice;
		applicableTax: regularTax.
	sirloinSteak := RMConsumable new
		name: 'Sirloin steak';
		price: 20 EUR asPrice;
		applicableTax: regularTax.
	greenSaladMenuItem := RMMenuItem new.
	greenSaladMenuItem consumable: greenSalad.
	mixedSaladMenuItem := RMMenuItem new.
	mixedSaladMenuItem consumable: mixedSalad.
	burgerMenuItem := RMMenuItem new.
	burgerMenuItem consumable: burger.
	sirloinSteakMenuItem := RMMenuItem new.
	sirloinSteakMenuItem consumable: sirloinSteak.
	greenSaladOrderItem := RMOrderItem new.
	greenSaladOrderItem
		menuItem: greenSaladMenuItem;
		timestamp: DateAndTime now - 2 hours.
	mixedSaladOrderItem := RMOrderItem new.
	mixedSaladOrderItem
		menuItem: mixedSaladMenuItem;
		timestamp: DateAndTime now - 2 hours.
	burgerOrderItem := RMOrderItem new.
	burgerOrderItem
		menuItem: burgerMenuItem;
		timestamp: DateAndTime now - 95 minutes.
	sirloinSteakOrderItem := RMOrderItem new.
	sirloinSteakOrderItem
		menuItem: sirloinSteakMenuItem;
		timestamp: DateAndTime now - 93 minutes.
	order := RMOrder new.
	order addOrderItem: greenSaladOrderItem.
	order addOrderItem: mixedSaladOrderItem.
	order addOrderItem: burgerOrderItem.
	order addOrderItem: sirloinSteakOrderItem.
	invoice := RMInvoice new timestamp: DateAndTime now - 10 minutes.
	invoiceItem1 := RMInvoiceItem new.
	invoiceItem2 := RMInvoiceItem new.
	invoiceItem3 := RMInvoiceItem new.
	invoiceItem4 := RMInvoiceItem new.
	invoiceItem1
		orderItem: greenSaladOrderItem;
		timestamp: DateAndTime now - 10 minutes.
	invoiceItem2
		orderItem: mixedSaladOrderItem;
		timestamp: DateAndTime now - 10 minutes.
	invoiceItem3
		orderItem: burgerOrderItem;
		timestamp: DateAndTime now - 10 minutes.
	invoiceItem4
		orderItem: sirloinSteakOrderItem;
		timestamp: DateAndTime now - 10 minutes.
	invoice addInvoiceItem: invoiceItem1.
	invoice addInvoiceItem: invoiceItem2.
	invoice addInvoiceItem: invoiceItem3.
	invoice addInvoiceItem: invoiceItem4.
	self assert: invoice price = 40 EUR asPrice.
	self assert: invoice taxMoney = (76 / 10) EUR.
	self assert: invoice splitBySameApplicableTax size = 1.
	self
		assert: invoice splitBySameApplicableTax first taxMoney = (76 / 10) EUR.
	^ invoice
]

{ #category : #examples }
RMInvoiceExamples >> invoiceWithMultipleItemsWithDifferentTaxComputations [
	<gtExample>
	| invoice invoiceItem1 order greenSaladMenuItem burgerMenuItem greenSalad burger greenSaladOrderItem burgerOrderItem invoiceItem2 mixedSalad sirloinSteak mixedSaladMenuItem sirloinSteakMenuItem mixedSaladOrderItem sirloinSteakOrderItem invoiceItem3 invoiceItem4 regularTax reducedTax |
	
	regularTax := RMPercentualTax new percentage: 19 percent.
	reducedTax := RMPercentualTax new percentage: 7 percent.
	greenSalad := RMConsumable new name: 'Green salad'; price: 4 EUR asPrice;  applicableTax: regularTax.
	mixedSalad := RMConsumable new name: 'Mixed salad'; price: 7 EUR asPrice;  applicableTax: regularTax.
	burger := RMConsumable new name: 'Burger'; price: 9 EUR asPrice;  applicableTax: regularTax.
	sirloinSteak := RMConsumable new name: 'Sirloin steak'; price: 20 EUR asPrice;  applicableTax: regularTax.
	
	greenSaladMenuItem := RMMenuItem new.
	greenSaladMenuItem consumable: greenSalad.
	mixedSaladMenuItem := RMMenuItem new.
	mixedSaladMenuItem consumable: mixedSalad.
	burgerMenuItem := RMMenuItem new.
	burgerMenuItem consumable: burger.
	sirloinSteakMenuItem := RMMenuItem new.
	sirloinSteakMenuItem consumable: sirloinSteak.
	
	greenSaladOrderItem := RMOrderItem new.
	greenSaladOrderItem menuItem: greenSaladMenuItem; timestamp: DateAndTime now - 2 hours.
	mixedSaladOrderItem := RMOrderItem new.
	mixedSaladOrderItem menuItem: mixedSaladMenuItem; timestamp: DateAndTime now - 2 hours.
	burgerOrderItem := RMOrderItem new.
	burgerOrderItem menuItem: burgerMenuItem; timestamp: DateAndTime now - 95 minutes;  applicableTax: reducedTax.
	sirloinSteakOrderItem := RMOrderItem new.
	sirloinSteakOrderItem menuItem: sirloinSteakMenuItem; timestamp: DateAndTime now - 93 minutes.
	
	order := RMOrder new.
	order addOrderItem: greenSaladOrderItem.
	order addOrderItem: mixedSaladOrderItem.
	order addOrderItem: burgerOrderItem.
	order addOrderItem: sirloinSteakOrderItem.
	invoice := RMInvoice new timestamp: DateAndTime now - 10 minutes.
	invoiceItem1 := RMInvoiceItem new.
	invoiceItem2 := RMInvoiceItem new.
	invoiceItem3 := RMInvoiceItem new.
	invoiceItem4 := RMInvoiceItem new.
	invoiceItem1 orderItem: greenSaladOrderItem; timestamp: DateAndTime now - 10 minutes.
	invoiceItem2 orderItem: mixedSaladOrderItem; timestamp: DateAndTime now - 10 minutes.
	invoiceItem3 orderItem: burgerOrderItem; timestamp: DateAndTime now - 10 minutes.
	invoiceItem4 orderItem: sirloinSteakOrderItem; timestamp: DateAndTime now - 10 minutes.
	
	invoice addInvoiceItem: invoiceItem1.
	invoice addInvoiceItem: invoiceItem2.
	invoice addInvoiceItem: invoiceItem3.
	invoice addInvoiceItem: invoiceItem4.
	
	self assert: invoice price = 40 EUR asPrice.
	self assert: invoice taxMoney = (652/100) EUR.
	self assert: invoice splitBySameApplicableTax size = 2.

	^ invoice 
]

{ #category : #examples }
RMInvoiceExamples >> invoiceWithOneItem [
	<gtExample>
	| invoice invoiceItem1 orderItem order menuItem consumable |
	consumable := RMConsumable new name: 'Expensive salad'; price: 10 EUR asPrice; applicableTax: 19 percent asTax.
	menuItem := RMMenuItem new.
	menuItem consumable: consumable.
	orderItem := RMOrderItem new.
	orderItem menuItem: menuItem.
	order := RMOrder new.
	order addOrderItem: orderItem.
	invoice := RMInvoice new.
	invoiceItem1 := RMInvoiceItem new.
	invoiceItem1 orderItem: orderItem.
	invoice addInvoiceItem: invoiceItem1.
	self assert: invoice price money notNil.
	self assert: (invoice price money isKindOf: RMMoney).
	self assert: invoice price = 10 EUR asPrice.
	self assert: invoice taxMoney = (19/10) EUR.
	self assert: invoice splitBySameApplicableTax size = 1.
	self assert: invoice splitBySameApplicableTax first taxMoney = (19/10) EUR.
	^ invoice 
]

{ #category : #examples }
RMInvoiceExamples >> invoiceWithOneItemAndQuantity [
	<gtExample>
	| invoice invoiceItem1 orderItem order menuItem consumable |
	consumable := RMConsumable new name: 'Expensive salad'; price: 10 EUR asPrice; applicableTax: 19 percent asTax.
	menuItem := RMMenuItem new.
	menuItem consumable: consumable.
	orderItem := RMOrderItem new.
	orderItem menuItem: menuItem; quantity: 2.
	self assert: orderItem price = 20 EUR asPrice.
	self assert: orderItem individualPrice = 10 EUR asPrice.
	order := RMOrder new.
	order addOrderItem: orderItem.
	invoice := RMInvoice new.
	invoiceItem1 := RMInvoiceItem new.
	invoiceItem1 orderItem: orderItem.
	invoice addInvoiceItem: invoiceItem1.
	self assert: invoice price = 20 EUR asPrice.
	self assert: invoice taxMoney = (38/10) EUR.
	self assert: invoice splitBySameApplicableTax size = 1.
	self assert: invoice splitBySameApplicableTax first taxMoney = (38/10) EUR.
	^ invoice 
]

{ #category : #accessing }
RMInvoiceExamples >> regularTax [
	<gtExample>
| regularTax |
	regularTax := RMPercentualTax new percentage: 19 percent.
	^ regularTax
]

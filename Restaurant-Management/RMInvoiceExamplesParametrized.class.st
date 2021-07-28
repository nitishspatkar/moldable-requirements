Class {
	#name : #RMInvoiceExamplesParametrized,
	#superclass : #Object,
	#category : #'Restaurant-Management-Examples'
}

{ #category : #examples }
RMInvoiceExamplesParametrized >> burgerOrderItem [
	<gtExample>
	<label: 'Burger'>
	<return: #RMOrderItem>
	| burger burgerMenuItem burgerOrderItem |
	burger := RMConsumable new 
		name: 'Burger'; 
		price: 9 EUR asPrice;  
		applicableTax: self regularTax.
	
	burgerMenuItem := RMMenuItem new.
	burgerMenuItem consumable: burger.
	
	burgerOrderItem := RMOrderItem new.
	burgerOrderItem 
		menuItem: burgerMenuItem;  
		applicableTax: self reducedTax.
	
	^ burgerOrderItem
]

{ #category : #examples }
RMInvoiceExamplesParametrized >> cappuccinoOrderItem [
	<gtExample>
	<label: 'Cappuccino'>
	<return: #RMOrderItem>
	| cappuccinoSalad cappuccinoMenuItem  cappuccinoOrderItem |
	cappuccinoSalad := RMConsumable new 
		name: 'Cappuccino'; 
		price: 3 EUR asPrice;  
		applicableTax: self regularTax.
	
	cappuccinoMenuItem := RMMenuItem new.
	cappuccinoMenuItem consumable: cappuccinoSalad.
	
	cappuccinoOrderItem := RMOrderItem new.
	cappuccinoOrderItem menuItem: cappuccinoMenuItem.
	
	^ cappuccinoOrderItem
	
]

{ #category : #examples }
RMInvoiceExamplesParametrized >> coffeeOrderItem [
	<gtExample>
	<label: 'Coffee'>
	<return: #RMOrderItem>
	| coffee coffeeMenuItem  coffeeOrderItem |
	coffee := RMConsumable new 
		name: 'Coffee'; 
		price: 2 EUR asPrice;  
		applicableTax: self regularTax.
	
	coffeeMenuItem := RMMenuItem new.
	coffeeMenuItem consumable: coffee.
	
	coffeeOrderItem := RMOrderItem new.
	coffeeOrderItem menuItem: coffeeMenuItem.
	
	^ coffeeOrderItem
	
]

{ #category : #examples }
RMInvoiceExamplesParametrized >> greenSaladOrderItem [
	<gtExample>
	<label: 'Green Salad'>
	<return: #RMOrderItem>
	| greenSalad greenSaladMenuItem  greenSaladOrderItem |
	greenSalad := RMConsumable new 
		name: 'Green Salad'; 
		price: 2 EUR asPrice;  
		applicableTax: self regularTax.
	
	greenSaladMenuItem := RMMenuItem new.
	greenSaladMenuItem consumable: greenSalad.
	
	greenSaladOrderItem := RMOrderItem new.
	greenSaladOrderItem menuItem: greenSaladMenuItem.
	
	^ greenSaladOrderItem
	
]

{ #category : #examples }
RMInvoiceExamplesParametrized >> invoiceForOrderItems: orderItems atTimestamp: aDateAndTimeString [
	<gtParametrizedExample>
	<gtExample>
	<label: 'Create an invoice with order items with default tax rate'>
	<given: #'Order items' ofType: #RMOrderItem in: #self elementType: #multipleSearch>
	<given: #'Date and time' ofType: #String in:#'' elementType:#input>
	<return: #RMInvoice>
	| order  invoice |
	
	order := RMOrder new.
	orderItems do: [ :anOrderItem |
		anOrderItem timestamp: DateAndTime now - 2 hours.
		order addOrderItem: anOrderItem ].
		
	invoice := RMInvoice new timestamp: DateAndTime now - 10 minutes.
	order orderItems do: [ :anOrderItem |
		| invoiceItem |
		
		invoiceItem := RMInvoiceItem new.
		invoiceItem 
			quantity: anOrderItem quantity;
			orderItem: anOrderItem; 
			timestamp: DateAndTime now - 10 minutes.
		invoice addInvoiceItem: invoiceItem. ].

	^ invoice 
]

{ #category : #examples }
RMInvoiceExamplesParametrized >> invoiceForOrderItemsReducedTax: orderItemsWithReducedTax regularTax: orderItemsWithRegularTax atTimestamp: aDateAndTimeString [
	<gtParametrizedExample>
	<gtExample>
	<label: 'Create an invoice with order items with regular or reduced tax rates'>
	<given: #'Order items (reduced tax)' ofType: #RMOrderItem in: #self elementType: #multipleSearch>
	<given: #'Order items (regular tax)' ofType: #RMOrderItem in: #self elementType: #multipleSearch>
	<given: #'Date and time' ofType: #String in:#'' elementType: #input>
	<return: #RMInvoice>
	| orderItems order invoice |
	
	orderItemsWithReducedTax do: [ :anOrderItem | 
		anOrderItem applicableTax: self reducedTax ].
	orderItemsWithRegularTax do: [ :anOrderItem | 
		anOrderItem applicableTax: self regularTax ].
	
	orderItems := orderItemsWithReducedTax, orderItemsWithRegularTax.
	
	order := RMOrder new.
	orderItems do: [ :anOrderItem |
		anOrderItem timestamp: DateAndTime now - 2 hours.
		order addOrderItem: anOrderItem ].
		
	invoice := RMInvoice new timestamp: DateAndTime now - 10 minutes.
	order orderItems do: [ :anOrderItem |
		| invoiceItem |
		
		invoiceItem := RMInvoiceItem new.
		invoiceItem 
			quantity: anOrderItem quantity;
			orderItem: anOrderItem; 
			timestamp: DateAndTime now - 10 minutes.
		invoice addInvoiceItem: invoiceItem. ].

	^ invoice 
]

{ #category : #examples }
RMInvoiceExamplesParametrized >> mixedSaladOrderItem [
	<gtExample>
	<label: 'Mixed salad'>
	<return: #RMOrderItem>
	| mixedSalad mixedSaladMenuItem mixedSaladOrderItem |
	mixedSalad := RMConsumable new 
		name: 'Mixed salad'; 
		price: 7 EUR asPrice;  
		applicableTax: self regularTax.

	mixedSaladMenuItem := RMMenuItem new.
	mixedSaladMenuItem consumable: mixedSalad.
	
	mixedSaladOrderItem := RMOrderItem new.
	mixedSaladOrderItem menuItem: mixedSaladMenuItem.
	
	^ mixedSaladOrderItem
	
]

{ #category : #examples }
RMInvoiceExamplesParametrized >> orderWithItemNamed: anItemName price: aPrice andTax: aTax [
	<gtParametrizedExample>
	<gtExample>
	<label: 'Order item with price and tax'>
	<given: #'Product name' ofType: #String in:#'' elementType:#input>
	<given: #'Price' ofType: #String in:#'' elementType:#input>
	<given: #'Tax rate' ofType: #RMPercentualTax in: #self elementType: #list>
	<return: #RMOrderItem>
	| orderItem |
	
	orderItem := RMOrderItem new.
	orderItem price: aPrice EUR.
	orderItem applicableTax: aTax.
	
	^ orderItem 
]

{ #category : #examples }
RMInvoiceExamplesParametrized >> reducedTax [
	<gtExample>
	<label: 'Reduced Tax'>
	<return: #RMPercentualTax>
	
	^ RMPercentualTax new percentage: 7 percent
]

{ #category : #examples }
RMInvoiceExamplesParametrized >> regularTax [
	<gtExample>
	<label: 'Regular Tax'>
	<return: #RMPercentualTax>
	^ RMPercentualTax new percentage: 19 percent
]

{ #category : #examples }
RMInvoiceExamplesParametrized >> sirloinSteakOrderItem [
	<gtExample>
	<label: 'Sirloin steak'>
	<return: #RMOrderItem>
	| sirloinSteak sirloinSteakMenuItem sirloinSteakOrderItem |
	sirloinSteak := RMConsumable new 
		name: 'Sirloin steak'; 
		price: 20 EUR asPrice;  
		applicableTax: self regularTax.

	sirloinSteakMenuItem := RMMenuItem new.
	sirloinSteakMenuItem consumable: sirloinSteak.
	
	sirloinSteakOrderItem := RMOrderItem new.
	sirloinSteakOrderItem menuItem: sirloinSteakMenuItem.
	
	^ sirloinSteakOrderItem
	
]

{ #category : #examples }
RMInvoiceExamplesParametrized >> tboneSteakOrderItem [
	<gtExample>
	<label: 'T-Bone steak (x2)'>
	<return: #RMOrderItem>
	| tboneSteak tboneSteakMenuItem tboneSteakOrderItem |
	tboneSteak := RMConsumable new 
		name: 'T-bone steak';
		price: 39 EUR asPrice;
		applicableTax: self regularTax.

	tboneSteakMenuItem := RMMenuItem new.
	tboneSteakMenuItem consumable: tboneSteak.
	
	tboneSteakOrderItem := RMOrderItem new.
	tboneSteakOrderItem 
		quantity: 2;
		menuItem: tboneSteakMenuItem.
	
	^ tboneSteakOrderItem
	
]

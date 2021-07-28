Class {
	#name : #RMMoney,
	#superclass : #RMObject,
	#category : #'Restaurant-Management-Model'
}

{ #category : #operations }
RMMoney >> * aNumber [
	^ self multiplyBy: aNumber
]

{ #category : #operations }
RMMoney >> + aMoney [
	^ self add: aMoney
]

{ #category : #operations }
RMMoney >> - aMoney [
	^ self decreaseBy: aMoney
]

{ #category : #operations }
RMMoney >> / aDivisor [
	^ aDivisor dividingMoney: self
]

{ #category : #testing }
RMMoney >> = aMoney [
	self subclassResponsibility
]

{ #category : #operations }
RMMoney >> add: aMoney [
	^ self subclassResponsibility
]

{ #category : #operations }
RMMoney >> addCurrencyMoney: aCurrencyMoney [
	^ self subclassResponsibility
]

{ #category : #operations }
RMMoney >> addMoneyBag: aMoneyBag [
	^ self subclassResponsibility
]

{ #category : #converting }
RMMoney >> asPrice [
	^ RMConcretePrice new money: self
]

{ #category : #operations }
RMMoney >> decreaseBy: aMoney [
	^ self add: aMoney negative
]

{ #category : #operations }
RMMoney >> discountFrom: aPrice [
	^ RMPriceDiscountedByMoney new price: aPrice; discountMoney: self
]

{ #category : #operations }
RMMoney >> divideBy: aNumber [
	^ self subclassResponsibility
]

{ #category : #operations }
RMMoney >> dividingMoney: aMoney [
	<return: #Number>
	"this means that we divide aMoney by self"
	self subclassResponsibility
]

{ #category : #ui }
RMMoney >> gtDetailsFor: aView [
	<gtView>
	^ aView explicit
		title: 'Details';
		stencil: [ 
			BrLabel new
				look: BrGlamorousLabelLook new;
				text: self gtDisplayString asRopedText;
				padding: (BlInsets all: 10);
				asScalableElement  ]
]

{ #category : #testing }
RMMoney >> isZero [
	self subclassResponsibility
]

{ #category : #operations }
RMMoney >> multiplyBy: aNumber [
	^ self subclassResponsibility
]

{ #category : #operations }
RMMoney >> negative [
	^ self subclassResponsibility
]

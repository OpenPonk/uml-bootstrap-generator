retrieving
typeOf: anElement
	anElement isObjectElement
		ifTrue: [ anElement xmiType = 'uml:PrimitiveType'
				ifTrue: [ ^ ((anElement elementNamed: 'href') value splitOn: '#') last ] ].
	anElement isReferenceItem
		ifTrue: [ ^ anElement referencedElement nameValue ].
	self error: 'Unexpected Type'
generating
generateAllEnums
	self sourceModel packagedElement
		do: [ :pkg | 
			pkg packagedElement
				select: [ :each | each isKindOf: BootUMLEnumeration  ]
				thenDo: [ :each | self createEnumFrom: each in: pkg name ] ]
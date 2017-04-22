generating
generateAllClasses
	self sourceModel packagedElement
		do: [ :pkg | 
			pkg packagedElement
				select: [ :each | each isKindOf: BootUMLClass ]
				thenDo: [ :each | self createClassFrom: each in: pkg name ] ]
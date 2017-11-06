generating
generateAllClasses
	self sourceModel packagedElements
		select: [ :each | each oclIsKindOf: #Stereotype ]
		thenDo:
			[ :each | self createClassFrom: each in: self sourceModel implementationPackage ]
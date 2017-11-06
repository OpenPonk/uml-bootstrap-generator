implementation
nestedPackage
	^ (self packagedElements
		select: [ :each | each oclIsKindOf: #Package ]
		thenCollect: [ :each | each oclAsType: #Package ]) asSet
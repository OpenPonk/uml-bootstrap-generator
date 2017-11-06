implementation
ownedType
	^ (self packagedElements
		select: [ :each | each oclIsKindOf: #Type ]
		thenCollect: [ :each | each oclAsType: #Type ]) asSet
implementation
ownedStereotype
	^ (self packagedElements
		select: [ :each | each oclIsKindOf: #Stereotype ]
		thenCollect: [ :each | each oclAsType: #Stereotype ]) asSet
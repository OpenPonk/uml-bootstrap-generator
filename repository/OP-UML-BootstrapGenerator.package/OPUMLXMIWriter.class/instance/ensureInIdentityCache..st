writing
ensureInIdentityCache: anElement
	identityCache
		at: anElement uuid
		ifAbsentPut: [ OPXMIObjectElement new
				containedItems: OrderedCollection new;
				yourself ]
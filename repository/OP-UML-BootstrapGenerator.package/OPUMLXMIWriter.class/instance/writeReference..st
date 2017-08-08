writing
writeReference: anElement
	self ensureInIdentityCache: anElement.
	^ OPXMIReferenceAttribute new referencedElements: {identityCache at: anElement uuid}
accessing
instanceFor: anObjectElement
	^ instanceCache
		at: (self uniqueIdOf: anObjectElement)
		ifAbsentPut: [ self createNewInstanceFor: anObjectElement xmiType ]
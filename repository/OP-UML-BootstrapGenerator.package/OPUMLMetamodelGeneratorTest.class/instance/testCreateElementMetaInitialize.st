tests - meta
testCreateElementMetaInitialize
	| cls |
	cls := generator createElementMeta.
	self
		assertMethod: (cls methodNamed: #initialize) source
		equals:
			'initialize
	super initialize.
	sharedGeneralizations := Dictionary new.
	self initializeSharedGeneralizations.
	self initializeDirectGeneralizations'
tests - meta
testCreateElementMetaInitialize
	| cls |
	cls := generator createElementMeta.
	self
		assertMethod: (cls methodNamed: #initialize) source
		equals:
			'initialize
	super initialize.
	sharedGeneralizations := OrderedDictionary new.
	tags := OrderedDictionary new.
	self initializeSharedGeneralizations.
	self initializeDirectGeneralizations'
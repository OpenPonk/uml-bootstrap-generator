tests - meta
testCreateElementMetaInitialize
	| cls |
	cls := generator createElementMeta.
	generator createClassFrom: (self findClass: 'Element') in: 'CommonStructure'.
	self
		assertMethod: (cls methodNamed: #initialize) source
		equals:
			'initialize
	super initialize.
	sharedGeneralizations := Dictionary new.
	self initializeSharedGeneralizations.
	self initializeDirectGeneralizations'
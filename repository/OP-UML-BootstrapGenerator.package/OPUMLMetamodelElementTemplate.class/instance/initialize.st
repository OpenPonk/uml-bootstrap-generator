initialization
initialize
	super initialize.
	sharedGeneralizations := OrderedDictionary new.
	self initializeSharedGeneralizations.
	self initializeDirectGeneralizations
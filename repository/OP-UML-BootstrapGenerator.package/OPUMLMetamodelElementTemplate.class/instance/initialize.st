initialization
initialize
	super initialize.
	sharedGeneralizations := Dictionary new.
	self initializeSharedGeneralizations.
	self initializeDirectGeneralizations
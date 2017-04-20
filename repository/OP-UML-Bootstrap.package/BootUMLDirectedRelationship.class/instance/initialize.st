initialization
initialize
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Relationship put: (BootUMLRelationship newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

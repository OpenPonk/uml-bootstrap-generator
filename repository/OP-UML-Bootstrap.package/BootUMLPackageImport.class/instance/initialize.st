initialization
initialize
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Relationship put: (BootUMLRelationship newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #DirectedRelationship put: (BootUMLDirectedRelationship newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

initialization
initialize
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NamedElement put: (BootUMLNamedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #RedefinableElement put: (BootUMLRedefinableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #TypedElement put: (BootUMLTypedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #ParameterableElement put: (BootUMLParameterableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #MultiplicityElement put: (BootUMLMultiplicityElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Feature put: (BootUMLFeature newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #ConnectableElement put: (BootUMLConnectableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #DeploymentTarget put: (BootUMLDeploymentTarget newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #StructuralFeature put: (BootUMLStructuralFeature newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

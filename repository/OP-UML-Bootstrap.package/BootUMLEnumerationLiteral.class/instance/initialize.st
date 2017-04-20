initialization
initialize
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NamedElement put: (BootUMLNamedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #ParameterableElement put: (BootUMLParameterableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #DeploymentTarget put: (BootUMLDeploymentTarget newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #PackageableElement put: (BootUMLPackageableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #DeployedArtifact put: (BootUMLDeployedArtifact newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #InstanceSpecification put: (BootUMLInstanceSpecification newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

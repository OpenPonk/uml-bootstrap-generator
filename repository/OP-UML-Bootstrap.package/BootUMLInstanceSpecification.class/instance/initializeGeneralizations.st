initialization
initializeGeneralizations
	generalizations := {
		sharedGeneralizations at: #DeploymentTarget.
		sharedGeneralizations at: #PackageableElement.
		sharedGeneralizations at: #DeployedArtifact.
	}

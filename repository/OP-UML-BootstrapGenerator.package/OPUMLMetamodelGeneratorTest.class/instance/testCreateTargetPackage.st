tests - generating - packages
testCreateTargetPackage
	generator packageName: 'TestGenerated123'.
	generator createTargetPackage.
	self assert: (RPackage organizer includesPackageNamed: 'TestGenerated123').
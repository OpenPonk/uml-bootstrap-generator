generating
createTargetPackage
	(RPackage organizer includesPackageNamed: self packageName)
		ifFalse: [ RPackage organizer createPackageNamed: self packageName ]
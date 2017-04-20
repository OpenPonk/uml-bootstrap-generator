generating
generateAll
	classes := Dictionary new.
	self createTargetPackage.
	self generatedPackages do: [ :each | self generateClassesInPackage: each ].
	self generatedPackages do: [ :each | self generateAssociationsInPackage: each ].
	self
		generateGeneralizations: (self collectGeneralizationsInPackages: self generatedPackages).
	^ self changes
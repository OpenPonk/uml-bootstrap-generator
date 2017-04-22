generating
generateAll
	classes := Dictionary new.
	self createTargetPackage.
	self generateAllClasses.
	self generateAllDelegationMethods.
	^ self changes
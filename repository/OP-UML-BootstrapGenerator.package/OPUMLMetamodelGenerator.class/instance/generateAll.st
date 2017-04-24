generating
generateAll
	classes := Dictionary new.
	self createTargetPackage.
	self createElementMeta.
	self generateAllClasses.
	self generateAllDelegationMethods.
	^ self changes
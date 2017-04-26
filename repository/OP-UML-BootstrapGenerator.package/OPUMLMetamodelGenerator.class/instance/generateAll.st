generating
generateAll
	classes := Dictionary new.
	self createTargetPackage.
	self createElementMeta.
	self generateAllEnums.
	self generateAllClasses.
	self generateAllDelegationMethods.
	^ self changes
generating
generateAll
	classes := Dictionary new.
"	self loadTemplateMethods."
	self createTargetPackage.
"	self createElementMeta."
"	self generateAllEnums."
	self generateAllClasses.
	self generateAllDelegationMethods.
	^ self changes
accessing - stereotypes
applyStereotype: aStereotype
	self appliedStereotypes addIfNotPresent: aStereotype.
	aStereotype appliedTo: self as: self umlClassName
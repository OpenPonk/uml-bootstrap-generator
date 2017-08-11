accessing - stereotypes
unapplyStereotype: aStereotype
	self appliedStereotypes remove: aStereotype ifAbsent: [  ].
	aStereotype unappliedFrom: self as: self umlClassName
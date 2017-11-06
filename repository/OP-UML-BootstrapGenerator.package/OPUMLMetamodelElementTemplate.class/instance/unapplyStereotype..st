accessing - stereotypes
unapplyStereotype: aStereotype
	self appliedStereotypes remove: aStereotype ifAbsent: [  ].
	self perform: ('extension_' , aStereotype umlClassName , ':') asSymbol with: nil
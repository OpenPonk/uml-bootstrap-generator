accessing - stereotypes
applyStereotype: aStereotype
	self appliedStereotypes addIfNotPresent: aStereotype.
	self perform: ('extension_' , aStereotype umlClassName , ':') asSymbol with: aStereotype
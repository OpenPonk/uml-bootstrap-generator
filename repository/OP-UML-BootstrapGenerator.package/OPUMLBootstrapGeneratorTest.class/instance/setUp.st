running
setUp
	super setUp.
	generator := OPUMLBootstrapGenerator new.
	generator sourceXmi: self class umlSpecs.
	generator classPrefix: 'BUT'.
	generator packageName: 'Generated-UMLBootstrapTest'
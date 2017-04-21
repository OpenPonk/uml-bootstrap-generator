accessing
umlBootstrapModel
	^ umlBootstrapModel
		ifNil: [ | xmi reader |
			xmi := OPUMLBootstrapGeneratorTest umlSpecs.
			reader := OPUMLXMIReader new.
			reader classPrefix: 'BootUML'.
			umlBootstrapModel := reader readXmi: xmi ]
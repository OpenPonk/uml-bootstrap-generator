utility
generateBootstrap
	| xmi generator |
	xmi := OPUMLBootstrapGeneratorTest umlSpecs.
	generator := OPUMLBootstrapGenerator new.
	generator sourceXmi: xmi.
	generator classPrefix: 'BootUML'.
	generator packageName: 'OP-UML-Bootstrap'.
	(CBChangesBrowser changes: generator generateAll) open
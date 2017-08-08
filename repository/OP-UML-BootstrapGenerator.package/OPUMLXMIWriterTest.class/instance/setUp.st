running
setUp
	super setUp.
	writer := OPUMLXMIWriter new.
	writer classPrefix: 'OPUML'
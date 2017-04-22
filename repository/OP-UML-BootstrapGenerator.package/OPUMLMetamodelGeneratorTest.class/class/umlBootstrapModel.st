accessing
umlBootstrapModel
	"
	umlBootstrapModel := nil
	"

	<script: 'self umlBootstrapModel inspect'>
	^ umlBootstrapModel
		ifNil: [ | xmi reader |
			xmi := OPUMLBootstrapGeneratorTest umlSpecs.
			reader := OPUMLXMIReader new.
			reader classPrefix: 'BootUML'.
			umlBootstrapModel := reader readXmi: xmi ]
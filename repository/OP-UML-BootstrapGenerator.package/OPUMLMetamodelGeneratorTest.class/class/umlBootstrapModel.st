accessing
umlBootstrapModel
	"
	umlBootstrapModel := nil
	"

	<script: 'self umlBootstrapModel inspect'>
	^ umlBootstrapModel
		ifNil: [ | xmi reader |
			xmi := OPUMLBootstrapGeneratorTest umlSpecs.
			reader := OPUMLXMIBootstrapReader new.
			reader classPrefix: 'BootUML'.
			umlBootstrapModel := (reader readXmi: xmi) first ]
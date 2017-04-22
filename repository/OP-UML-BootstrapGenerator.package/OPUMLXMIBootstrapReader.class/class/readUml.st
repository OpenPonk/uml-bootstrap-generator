as yet unclassified
readUml
	<script>
	| xmi reader model |
	xmi := OPUMLBootstrapGeneratorTest umlSpecs.
	reader := OPUMLXMIBootstrapReader new.
	reader classPrefix: 'BootUML'.
	model := reader readXmi: xmi.
	model inspect
"
Baseline for https://github.com/OpenPonk/uml-bootstrap-generator
"
Class {
	#name : 'BaselineOfOpenPonkUMLBootstrapGenerator',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfOpenPonkUMLBootstrapGenerator',
	#package : 'BaselineOfOpenPonkUMLBootstrapGenerator'
}

{ #category : 'baselines' }
BaselineOfOpenPonkUMLBootstrapGenerator >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'OpenPonkXMI'
				with: [ spec repository: 'github://openponk/xmi:v4.1.x' ].
			spec
				baseline: 'ChangesBuilder'
				with: [ spec repository: 'github://JanBliznicenko/pharo-changes-builder:v4.0.x' ].
			spec package: 'OpenPonk-UML-Bootstrap'.
			spec
				package: 'OpenPonk-UML-BootstrapGenerator'
				with: [ spec requires: #('OpenPonkXMI' 'ChangesBuilder' 'OpenPonk-UML-Bootstrap') ].
			spec group: 'default' with: #('OpenPonk-UML-BootstrapGenerator') ]
]

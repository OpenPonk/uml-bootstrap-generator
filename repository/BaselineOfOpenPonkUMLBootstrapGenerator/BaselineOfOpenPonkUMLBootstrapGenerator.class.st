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
	spec for: #common do: [
			spec baseline: 'OpenPonkXMI' with: [ spec repository: 'github://OpenPonk/xmi' ].
			spec baseline: 'OpenPonkUMLXMI' with: [ spec repository: 'github://OpenPonk/uml-xmi' ].
			spec baseline: 'ChangesBuilder' with: [ spec repository: 'github://OpenPonk/pharo-changes-builder' ].
			spec package: 'OpenPonk-UML-ProfileGenerator' with: [ spec requires: #( 'ChangesBuilder' 'OpenPonkUMLXMI' ) ].
			spec package: 'OpenPonk-UML-ProfileGenerator-Tests' with: [ spec requires: #( 'OpenPonk-UML-ProfileGenerator' ) ].
			spec package: 'OpenPonk-UML-Bootstrap'.
			spec
				package: 'OpenPonk-UML-BootstrapGenerator'
				with: [ spec requires: #( 'OpenPonkXMI' 'ChangesBuilder' 'OpenPonk-UML-Bootstrap' 'OpenPonk-UML-ProfileGenerator' ) ].
			spec
				package: 'OpenPonk-UML-BootstrapGenerator-Tests'
				with: [ spec requires: #( 'OpenPonk-UML-BootstrapGenerator' 'OpenPonk-UML-ProfileGenerator-Tests' ) ].
			spec
				group: 'default' with: #( 'OpenPonk-UML-ProfileGenerator' 'OpenPonk-UML-ProfileGenerator-Tests' );
				group: 'dev-plugin'
				with: #( 'OpenPonk-UML-Bootstrap' 'OpenPonk-UML-BootstrapGenerator' 'OpenPonk-UML-BootstrapGenerator-Tests' );
				group: 'dev' with: #( 'default' 'dev-plugin' ) ]
]

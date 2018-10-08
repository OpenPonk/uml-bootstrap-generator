"
Baseline for https://github.com/OpenPonk/uml-bootstrap-generator
"
Class {
	#name : #BaselineOfUMLBootstrapGenerator,
	#superclass : #BaselineOf,
	#category : 'BaselineOfUMLBootstrapGenerator'
}

{ #category : #baselines }
BaselineOfUMLBootstrapGenerator >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec baseline: 'OPXMI' with: [ spec repository: 'github://openponk/xmi/repository' ].
			spec
				baseline: 'ChangesBuilder'
				with: [ spec repository: 'github://peteruhnak/pharo-changes-builder/repository' ].
			spec package: 'OP-UML-Bootstrap'.
			spec
				package: 'OP-UML-BootstrapGenerator'
				with: [ spec requires: #('OPXMI' 'ChangesBuilder' 'OP-UML-Bootstrap') ].
			spec group: 'default' with: #('OP-UML-BootstrapGenerator') ]
]

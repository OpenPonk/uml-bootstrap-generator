"
I provide custom Pharo template methods (specifically regarding multiplicity bounds) that are injected into generated UML ExtensionEnd instances used within UML Profiles.
"
Class {
	#name : 'OPUMLMetaGenExtensionEndTemplate',
	#superclass : 'OPUMLMetaGenTemplate',
	#category : 'OpenPonk-UML-BootstrapGenerator-Templates',
	#package : 'OpenPonk-UML-BootstrapGenerator',
	#tag : 'Templates'
}

{ #category : 'implementation' }
OPUMLMetaGenExtensionEndTemplate >> lowerBound [
	^ self lowerValue ifNil: [ 0 ] ifNotNil: [ self lowerValue integerValue ]
]

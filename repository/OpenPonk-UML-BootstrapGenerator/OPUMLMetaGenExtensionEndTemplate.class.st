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

Class {
	#name : #OPUMLMetaGenExtensionEndTemplate,
	#superclass : #OPUMLMetaGenTemplate,
	#category : 'OP-UML-BootstrapGenerator-Templates'
}

{ #category : #implementation }
OPUMLMetaGenExtensionEndTemplate >> lowerBound [
	^ self lowerValue ifNil: [ 0 ] ifNotNil: [ self lowerValue integerValue ]
]

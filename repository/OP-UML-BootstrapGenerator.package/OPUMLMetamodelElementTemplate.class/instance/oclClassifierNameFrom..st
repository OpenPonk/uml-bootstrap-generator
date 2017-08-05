ocl-experimental
oclClassifierNameFrom: anObject
	(anObject isKindOf: OPUMLMetaElement class)
		ifTrue: [ ^ anObject name withoutPrefix: 'OPUML' ].
	(anObject isKindOf: OPUMLMetaElement)
		ifTrue: [ ^ anObject name ].
	anObject isString
		ifTrue: [ ^ anObject ].
	self error: 'Unknown classifier ' , anObject asString
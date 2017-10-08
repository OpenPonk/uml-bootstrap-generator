ocl-experimental
oclIsTypeOf: aClassifier
	"Element is not part of the shared generalization, so extra check is needed."
	aClassifier = #Element
		ifTrue: [ ^ true ].
	^ sharedGeneralizations keys last = (self oclClassifierNameFrom: aClassifier)
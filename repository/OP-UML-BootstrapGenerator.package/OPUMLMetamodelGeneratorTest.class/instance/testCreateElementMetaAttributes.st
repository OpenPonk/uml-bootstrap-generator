tests - meta
testCreateElementMetaAttributes
	| cls |
	cls := generator createElementMeta.
	self
		assert: cls instanceVariables sorted
		equals: #(directGeneralizations sharedGeneralizations)
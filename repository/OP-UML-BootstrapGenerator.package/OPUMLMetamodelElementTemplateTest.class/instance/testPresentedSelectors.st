tests
testPresentedSelectors
	self
		assert: OPUMLMetamodelTestChildElement new inspectorPropertiesSelectors sorted
		equals: #(fromParent emptyValue nilValue operation) sorted
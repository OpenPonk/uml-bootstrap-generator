tests
testNonEmptyInspectorProperties
	self
		assert: OPUMLMetamodelTestChildElement new nonEmptyinspectorProperties
		equals:
			{#fromParent -> 12.
			#operation -> #operation}
tests
testInspectorProperties
	self
		assert: OPUMLMetamodelTestChildElement new inspectorProperties
		equals:
			{#emptyValue -> #().
			#fromParent -> 12.
			#nilValue -> nil.
			#operation -> #operation}
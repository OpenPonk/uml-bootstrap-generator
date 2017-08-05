tests  - ocl-experimental
testOclAsType
	| el |
	el := OPUMLMetamodelTestChildElement new.
	self
		assert: (el oclAsType: 'MetamodelTestParentElement') class
		equals: OPUMLMetamodelTestParentElement
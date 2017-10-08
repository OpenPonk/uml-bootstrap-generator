tests  - ocl-experimental
testOclIsKindOfMeta
	| el |
	el := OPUMLMetamodelTestChildElement new.
	self assert: (el oclIsKindOf: 'MetamodelElementTemplate')
tests  - ocl-experimental
testOclIsKindOf
	| el |
	el := OPUMLMetamodelTestChildElement new.
	self assert: (el oclIsKindOf: 'MetamodelTestChildElement')
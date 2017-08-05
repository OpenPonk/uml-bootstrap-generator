tests  - ocl-experimental
testOclIsTypeOf
	| el |
	el := OPUMLMetamodelTestChildElement new.
	self assert: (el oclIsTypeOf: 'MetamodelTestChildElement')
tests  - ocl-experimental
testOclIsKindOfParent
	| el |
	el := OPUMLMetamodelTestChildElement new.
	self assert: (el oclIsKindOf: 'MetamodelTestParentElement')
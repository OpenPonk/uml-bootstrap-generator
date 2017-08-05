tests
testRetrieveTag
	| el |
	el := OPUMLMetamodelTestChildElement new.
	el tagAt: 'key' put: 12.
	self assert: (el tagAt: 'key') equals: 12
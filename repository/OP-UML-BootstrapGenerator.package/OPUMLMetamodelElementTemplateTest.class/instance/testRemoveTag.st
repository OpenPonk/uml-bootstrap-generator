tests
testRemoveTag
	| el |
	el := OPUMLMetamodelTestChildElement new.
	el tagAt: 'key' put: 12.
	el removeTagAt: 'key'.
	self deny: (el hasTagAt: 'key')
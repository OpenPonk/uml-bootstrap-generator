tests
testAddTag
	| el |
	el := OPUMLMetamodelTestChildElement new.
	self deny: (el hasTagAt: 'key').
	el tagAt: 'key' put: 12.
	self assert: (el hasTagAt: 'key')
tests
testInstance
	| element result1 result2 |
	element := OPXMIObjectElement new
		containedItems:
			{OPXMIValueElement xmiName: 'xmi:id' value: 'CLS'.
			OPXMIValueElement xmiName: 'xmi:type' value: 'uml:Package'}.
	result1 := reader instanceFor: element.
	self assert: result1 className equals: #BootUMLPackage.
	result2 := reader instanceFor: element.
	self assert: result1 == result2 description: 'We expect the same object.'
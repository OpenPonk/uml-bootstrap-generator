tests
testInstanceWithDefaultValue
	| element result |
	self skip: 'Default values are not bootstraped yet'.
	element := OPXMIObjectElement new
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:LiteralInteger'.
			OPXMIValueAttribute xmiName: 'xmi:id' value: 'lowerValue'}.
	result := reader readItem: element.
	self assert: result value equals: 0
instance creation
defaultValueElement
	^ OPXMIObjectElement new
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:LiteralInteger'.
			OPXMIValueAttribute xmiName: 'xmi:id' value: 'lowerValue'}
tests - retrieving
testTypeOfPrimitive
	self
		assert:
			(generator
				typeOf:
					(OPXMIObjectElement new
						containedItems:
							{OPXMIValueElement xmiName: 'xmi:type' value: 'uml:PrimitiveType'.
							OPXMIValueElement xmiName: 'href' value: 'uri#String'}))
		equals: 'String'
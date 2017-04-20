instance creation
xmiClassAttribute
	^ OPXMIObjectElement new
		xmiName: 'ownedAttribute';
		containedItems:
			{OPXMIValueElement xmiName: 'name' value: 'body'.
			OPXMIObjectElement new
				xmiName: 'ownedComment';
				containedItems: {OPXMIValueElement xmiName: 'body' value: 'Comment of a Comment body.'}.
			OPXMIObjectElement new
				xmiName: 'type';
				containedItems:
					{OPXMIValueElement xmiName: 'xmi:type' value: 'uml:PrimitiveType'.
					OPXMIValueElement
						xmiName: 'href'
						value: 'http://www.omg.org/spec/UML/20131001/PrimitiveTypes.xmi#String'}}
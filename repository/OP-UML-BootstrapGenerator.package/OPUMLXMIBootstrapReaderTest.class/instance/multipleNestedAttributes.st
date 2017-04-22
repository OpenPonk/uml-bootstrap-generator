instance creation
multipleNestedAttributes
	^ OPXMIObjectElement new
		xmiName: 'packagedElement';
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Class'.
			OPXMIValueAttribute xmiName: 'xmi:id' value: 'Comment'.
			OPXMIValueAttribute xmiName: 'name' value: 'Comment'.
			OPXMIObjectElement new
				xmiName: 'ownedAttribute';
				containedItems:
					{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Property'.
					OPXMIValueAttribute xmiName: 'xmi:id' value: 'Comment-annotatedElement'.
					OPXMIValueElement xmiName: 'name' value: 'annotatedElement'}.
			OPXMIObjectElement new
				xmiName: 'ownedAttribute';
				containedItems:
					{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Property'.
					OPXMIValueAttribute xmiName: 'xmi:id' value: 'Comment-body'.
					OPXMIValueElement xmiName: 'name' value: 'body'}}
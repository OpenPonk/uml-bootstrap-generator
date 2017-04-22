instance creation
nestedComplexElement
	^ OPXMIObjectElement new
		xmiName: 'Attribute';
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Property'.
			OPXMIValueAttribute xmiName: 'xmi:id' value: 'PROPID'.
			OPXMIObjectElement new
				xmiName: 'upperValue';
				containedItems:
					{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:LiteralUnlimitedNatural'.
					OPXMIValueAttribute xmiName: 'xmi:id' value: 'PROPID_upperValue'.
					OPXMIValueElement xmiName: 'value' value: '*'}}
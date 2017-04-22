instance creation
trivialishXmi
	^ OPXMIObjectElement new
		xmiName: 'XMI';
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmlns:xmi' value: 'http://www.omg.org/spec/XMI/20131001'.
			OPXMIValueAttribute xmiName: 'xmlns:uml' value: 'http://www.omg.org/spec/UML/20131001'.
			OPXMIValueAttribute
				xmiName: 'xmlns:moftext'
				value: 'http://www.omg.org/spec/MOF/20131001'.
			OPXMIObjectElement new
				xmiName: 'Package';
				containedItems:
					{OPXMIValueAttribute xmiName: 'xmi:id' value: '_0'.
					OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Package'.
					OPXMIObjectElement new
						xmiName: 'packagedElement';
						containedItems:
							{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Package'.
							OPXMIValueAttribute xmiName: 'xmi:id' value: 'Activities'.
							OPXMIValueAttribute xmiName: 'name' value: 'Activities'}}.
			OPXMIObjectElement new
				xmiName: 'Tag';
				containedItems:
					{OPXMIValueAttribute xmiName: 'xmi:id' value: '_1'.
					OPXMIValueAttribute xmiName: 'xmi:type' value: 'mofext:Tag'}}
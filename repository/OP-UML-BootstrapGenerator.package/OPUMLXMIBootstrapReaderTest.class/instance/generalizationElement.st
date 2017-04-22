instance creation
generalizationElement
	"-> Element"

	^ OPXMIObjectElement new
		xmiName: 'generalization';
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Generalization'.
			OPXMIValueAttribute xmiName: 'xmi:id' value: 'Comment-_generalization.0'.
			OPXMIReferenceAttribute new
				xmiName: 'general';
				referencedElements:
					{OPXMIObjectElement new
						xmiName: 'packagedElement';
						containedItems:
							{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Class'.
							OPXMIValueAttribute xmiName: 'xmi:id' value: 'Element'.
							OPXMIValueAttribute xmiName: 'name' value: 'Element'}}}
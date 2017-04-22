instance creation
packageImportPackage
	| activities classification |
	classification := OPXMIObjectElement new
		xmiName: 'packagedElement';
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Package'.
			OPXMIValueAttribute xmiName: 'xmi:id' value: 'Classification'.
			OPXMIValueAttribute xmiName: 'name' value: 'Classification'}.
	activities := OPXMIObjectElement new
		xmiName: 'packagedElement';
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Package'.
			OPXMIValueAttribute xmiName: 'xmi:id' value: 'Activities'.
			OPXMIValueAttribute xmiName: 'name' value: 'Activities'.
			OPXMIObjectElement new
				xmiName: 'packageImport';
				containedItems:
					{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:PackageImport'.
					OPXMIValueAttribute xmiName: 'xmi:id' value: '_packageImport.1'.
					OPXMIReferenceAttribute xmiName: 'importedPackage' referencedElements: {classification}}}.
	^ OPXMIObjectElement new
		xmiName: 'uml:Package';
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Package'.
			OPXMIValueAttribute xmiName: 'xmi:id' value: '_0'.
			OPXMIValueAttribute xmiName: 'name' value: 'UML'.
			OPXMIObjectElement new
				xmiName: 'packageImport';
				containedItems:
					{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:PackageImport'.
					OPXMIValueAttribute xmiName: 'xmi:id' value: '_packageImport.1'.
					OPXMIReferenceAttribute xmiName: 'importedPackage' referencedElements: {activities}}.
			OPXMIObjectElement new
				xmiName: 'packageImport';
				containedItems:
					{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:PackageImport'.
					OPXMIValueAttribute xmiName: 'xmi:id' value: '_packageImport.2'.
					OPXMIReferenceAttribute xmiName: 'importedPackage' referencedElements: {classification}}}
tests
testUniqueId
	| regular packageImport |
	regular := OPXMIObjectElement new
		containedItems: {OPXMIValueAttribute xmiName: 'xmi:id' value: 'AAA'}.
	packageImport := OPXMIObjectElement new
		xmiName: 'packageImport';
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:PackageImport'.
			OPXMIValueAttribute xmiName: 'xmi:id' value: '_packageImport.1'.
			OPXMIReferenceAttribute xmiName: 'importedPackage' referencedElements: {regular}}.
	self assert: (reader uniqueIdOf: regular) equals: 'AAA'.
	self assert: (reader uniqueIdOf: packageImport) equals: '_packageImport.1-AAA'
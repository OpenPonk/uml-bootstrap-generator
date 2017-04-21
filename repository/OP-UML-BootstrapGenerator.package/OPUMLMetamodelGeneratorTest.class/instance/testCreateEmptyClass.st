tests
testCreateEmptyClass
	| result |
	result := generator
		createClassFrom: (BootUMLClass new name: 'Something')
		in: 'CommonStructure'.
	self assert: result name equals: 'MBUTSomething'.
	self assert: result package equals: 'Generated-UMLMetamodelTest-CommonStructure'
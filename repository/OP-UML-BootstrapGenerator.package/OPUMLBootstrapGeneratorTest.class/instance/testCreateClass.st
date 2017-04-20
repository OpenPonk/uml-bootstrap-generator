tests - generating
testCreateClass
	| result |
	result := generator createClassFrom: self xmiComplexElement in: 'CommonStructure'.
	self assert: result name equals: 'BUTComment'.
	self assert: result package equals: 'Generated-UMLBootstrapTest-CommonStructure'
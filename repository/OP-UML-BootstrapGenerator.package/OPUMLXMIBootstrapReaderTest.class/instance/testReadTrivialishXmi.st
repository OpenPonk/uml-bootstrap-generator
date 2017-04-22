tests
testReadTrivialishXmi
	| result |
	result := reader readXmi: self trivialishXmi.
	self assert: result size equals: 1.
	self assert: result first className equals: #BootUMLPackage.
	self assert: result first packagedElement size equals: 1.
	self assert: result first packagedElement first name equals: 'Activities'
tests
testReadTrivialXmi
	| result |
	result := reader readXmi: self trivialXmi.
	self assert: result size equals: 1.
	self assert: result first className equals: #BootUMLPackage
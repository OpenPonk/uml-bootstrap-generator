tests
testNestedComplexElement
	| result |
	result := reader readItem: self nestedComplexElement.
	self assert: result className equals: #BootUMLProperty.
	self assert: result upperValue value equals: '*'.
	"	self assert: result lowerValue value equals: 0."
	self assert: result lowerValue value equals: nil
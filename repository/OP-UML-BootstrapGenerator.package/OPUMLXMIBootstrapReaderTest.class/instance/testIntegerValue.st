tests
testIntegerValue
	| result |
	result := reader valueFor: '123'.
	self assert: result equals: 123
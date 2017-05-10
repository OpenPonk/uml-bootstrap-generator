tests
testFloatValue
	| result |
	result := reader valueFor: '12.5'.
	self assert: result equals: 12.5
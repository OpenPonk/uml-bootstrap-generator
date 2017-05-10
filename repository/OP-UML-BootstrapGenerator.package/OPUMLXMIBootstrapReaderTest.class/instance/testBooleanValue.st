tests
testBooleanValue
	| result |
	result := reader valueFor: 'true'.
	self assert: result equals: true
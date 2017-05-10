tests
testReadBoolean
	| result |
	result := reader readItem: (OPXMIValueAttribute xmiName: 'isDerived' value: 'true').
	self assert: result equals: true
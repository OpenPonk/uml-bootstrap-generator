tests - retrieving
testDefaultValues
	| result |
	result := generator defaultValues.
	self assert: (result includes: 'LiteralBoolean' -> 'false').
	self assert: (result includes: 'LiteralNull' -> nil)
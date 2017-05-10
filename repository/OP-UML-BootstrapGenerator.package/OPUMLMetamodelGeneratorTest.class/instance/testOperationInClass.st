testing - test meta
testOperationInClass
	| operation |
	operation := self operation: 'lowerBound' inClass: 'MultiplicityElement'.
	self assert: operation isNotNil.
	self assert: operation name equals: 'lowerBound'
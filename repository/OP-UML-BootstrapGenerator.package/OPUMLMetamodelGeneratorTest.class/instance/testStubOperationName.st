tests - retrieving
testStubOperationName
	self
		assert: (generator stubOperationNameFor: (self operation: 'lower' inClass: 'MultiplicityElement'))
		equals: 'lowerStub'.
	self
		assert: (generator stubOperationNameFor: (self operation: 'context' inClass: 'Behavior'))
		equals: 'contextStub'
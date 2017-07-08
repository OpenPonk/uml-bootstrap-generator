tests - generating - operations
testOperationName
	self
		assert: (generator operationNameFor: (self operation: 'lower' inClass: 'MultiplicityElement'))
		equals: 'lower'.
	self
		assert: (generator operationNameFor: (self operation: 'context' inClass: 'Behavior'))
		equals: 'context'
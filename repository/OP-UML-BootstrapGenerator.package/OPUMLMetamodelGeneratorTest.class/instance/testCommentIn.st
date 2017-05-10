tests - retrieving
testCommentIn
	self
		assert: (generator commentIn: (self operation: 'lowerBound' inClass: 'MultiplicityElement'))
		equals:
			'The query lowerBound() returns the lower bound of the multiplicity as an integer, which is the integerValue of lowerValue, if this is given, and 1 otherwise.'
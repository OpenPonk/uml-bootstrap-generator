tests - testing
testLiteralSpecification
	self
		assert:
			(generator
				isLiteralSpecification: (self attribute: 'value' inClass: 'LiteralInteger') defaultValue).
	self
		deny:
			(generator
				isLiteralSpecification: (self attribute: 'direction' inClass: 'Parameter') defaultValue)
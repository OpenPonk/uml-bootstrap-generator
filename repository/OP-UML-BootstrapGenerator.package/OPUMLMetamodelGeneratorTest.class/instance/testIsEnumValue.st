tests - testing
testIsEnumValue
	self
		assert:
			(generator isEnumValue: (self attribute: 'direction' inClass: 'Parameter') defaultValue)
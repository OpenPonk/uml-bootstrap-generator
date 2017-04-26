tests - retrieving
testEnumDefaultValue
	| attribute |
	attribute := self attribute: 'direction' inClass: 'Parameter'.
	self
		assert: (generator defaultValueFrom: attribute defaultValue)
		equals: (generator classNameFor: 'ParameterDirectionKind') , ' new in'
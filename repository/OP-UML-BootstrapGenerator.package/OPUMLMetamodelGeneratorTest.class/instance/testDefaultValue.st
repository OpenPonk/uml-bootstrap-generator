tests - retrieving
testDefaultValue
	| attribute |
	attribute := self attribute: 'value' inClass: 'LiteralInteger'.
	self assert: (generator defaultValueFrom: attribute defaultValue) equals: 0
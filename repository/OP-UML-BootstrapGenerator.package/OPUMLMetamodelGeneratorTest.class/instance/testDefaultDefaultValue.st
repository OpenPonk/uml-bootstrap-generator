tests - generating - attributes
testDefaultDefaultValue
	| attribute |
	attribute := self attribute: 'isReadOnly' inClass: 'Activity'.
	self assert: (generator defaultValueFrom: attribute defaultValue) equals: 'false'
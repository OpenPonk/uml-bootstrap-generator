tests - generating - operations
testLoadTemplateMethodsVarious
	generator loadTemplateMethods.
	self assert: (self operation: 'isNull' inClass: 'ValueSpecification') method isNotNil.
	self assert: (self operation: 'lower' inClass: 'MultiplicityElement') method isNotNil.
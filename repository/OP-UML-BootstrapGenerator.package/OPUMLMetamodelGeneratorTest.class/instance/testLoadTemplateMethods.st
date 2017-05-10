tests - generating - operations
testLoadTemplateMethods
	| operation |
	operation := self operation: 'isNull' inClass: 'ValueSpecification'.
	operation method: nil.
	generator loadTemplateMethods.
	self assert: operation method isNotNil.
	self assert: operation method isNotEmpty.
	self assert: operation method first body first isNotEmpty.
	self assert: operation method first language first equals: 'Pharo'
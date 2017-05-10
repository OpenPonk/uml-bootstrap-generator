tests - generating - operations
testAddOperationWithoutMethod
	| class operation |
	class := CBClass new.
	operation := self operation: 'isNull' inClass: 'ValueSpecification'.
	generator addOperation: operation to: class.
	self assert: (class methodNamed: 'isNullStub') protocol equals: 'operations - stubs'.
	self assertMethod: (class methodNamed: 'isNullStub') source equals: 'isNullStub
	"The query isNull() returns true when it can be computed that the value is null."
	
	"{OCL} result = (false)"

	self notYetImplemented'
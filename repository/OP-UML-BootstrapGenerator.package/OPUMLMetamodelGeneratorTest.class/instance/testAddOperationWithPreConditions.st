tests - generating - operations
testAddOperationWithPreConditions
	| class operation |
	class := CBClass new.
	operation := self operation: 'isMultivalued' inClass: 'MultiplicityElement'.
	generator addOperation: operation to: class.
	self assertMethod: (class methodNamed: 'isMultivaluedStub') source equals: 'isMultivaluedStub
	"The query isMultivalued() checks whether this multiplicity has an upper bound greater than one."
	
	"pre: {OCL} upperBound()->notEmpty()"
	
	"{OCL} result = (upperBound() > 1)"
	
	self notYetImplemented'
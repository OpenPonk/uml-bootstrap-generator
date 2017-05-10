tests - generating - operations
testAddOperationWithoutBody
	| class operation |
	class := CBClass new.
	operation := self operation: 'behavioredClassifier' inClass: 'Behavior'.
	generator addOperation: operation to: class.
	self
		assertMethod: (class methodNamed: 'behavioredClassifierStub') source
		equals:
			'behavioredClassifierStub
	"The first BehavioredClassifier reached by following the chain of owner relationships from the Behavior, if any."
	
	"spec: {OCL} if from.oclIsKindOf(BehavioredClassifier) then
    from.oclAsType(BehavioredClassifier)
else if from.owner = null then
    null
else
    self.behavioredClassifier(from.owner)
endif
endif
    "
	
	self notYetImplemented'
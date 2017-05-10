tests - generating - operations
testAddOperationWithMethod
	| class operation realMethod stubMethod |
	class := CBClass new.
	operation := self operation: 'isNull' inClass: 'ValueSpecification'.
	operation
		method:
			(OPUMLMetamodelGeneratorValuesTemplates new
				methodsFor: operation
				inClassNamed: 'ValueSpecification').
	generator addOperation: operation to: class.
	realMethod := class methodNamed: 'isNull'.
	stubMethod := class methodNamed: 'isNullStub'.
	self assert: realMethod protocol equals: 'operations'.
	self
		assertMethod: realMethod source
		equals:
			'isNull
	"The query isNull() returns true when it can be computed that the value is null."
	
	"{OCL} result = (false)"
	
	^ false'.
	self assert: stubMethod protocol equals: 'operations - stubs'.
	self
		assertMethod: stubMethod source
		equals:
			'isNullStub
	"The query isNull() returns true when it can be computed that the value is null."
	
	"{OCL} result = (false)"
	
	self notYetImplemented
'
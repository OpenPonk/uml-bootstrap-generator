generating - operations
addOperation: anOperationModel to: aClass
	self addStubOperation: anOperationModel to: aClass.
	(anOperationModel method isNotNil and: [ anOperationModel method isNotEmpty ])
		ifTrue: [ self addRealOperation: anOperationModel to: aClass ]
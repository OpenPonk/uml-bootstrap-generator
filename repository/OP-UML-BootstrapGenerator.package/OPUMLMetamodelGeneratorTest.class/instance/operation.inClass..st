accessing
operation: anOperationName inClass: aClassName
	^ (self findClass: aClassName) ownedOperation
		detect: [ :each | each name = anOperationName ]
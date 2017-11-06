generating - methods
addDelegationMethodsFrom: aClassModel to: aClass
	self addAccessingDelegationMethodsFrom: aClassModel to: aClass.
	self addOperationsDelegationMethodsFrom: aClassModel to: aClass
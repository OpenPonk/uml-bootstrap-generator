generating
generateAllDelegationMethods
	self allClassesInModel
		do: [ :each | self addDelegationMethodsFrom: each to: (classes at: each name) ]
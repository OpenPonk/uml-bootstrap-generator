tests - generating
testeCreateDelegationMethods
	| parent child |
	parent := generator ensureCreateClass: 'GeneratedParentClass' in: 'Package'.
	child := generator ensureCreateClass: 'GeneratedChildClass' in: 'Package'.
	parent addMethod: (CBMethod new getter: 'property').
	parent addMethod: (CBMethod new setter: 'property' argument: 'Property').
	generator createDelegationMethods: #(#(GeneratedParentClass)) for: #GeneratedChildClass.
	self assert: child methods size equals: 2.
	self assert: child methods first protocol equals: 'accessing - GeneratedParentClass'.
	self assert: child methods second protocol equals: 'accessing - GeneratedParentClass'
tests - generating
testeCreateDelegationMethods
	| parent child |
	parent := generator ensureCreateClass: 'BUTGeneratedParentClass' in: 'Generated-Package'.
	child := generator ensureCreateClass: 'BUTGeneratedChildClass' in: 'Generated-Package'.
	parent addMethod: (CBMethod new getter: 'property').
	parent addMethod: (CBMethod new setter: 'property' argument: 'Property').
	generator createDelegationMethods: #(#(GeneratedParentClass)) for: #GeneratedChildClass.
	self assert: child methods size equals: 2.
	self assert: child methods first protocol equals: 'accessing - GeneratedParentClass'.
	self assert: child methods second protocol equals: 'accessing - GeneratedParentClass'
tests
testAssociation
	| result |
	result := reader readItem: self association.
	self assert: result className equals: #BootUMLAssociation.
	self assert: result memberEnd size equals: 2.
	self assert: result memberEnd second equals: result ownedEnd first
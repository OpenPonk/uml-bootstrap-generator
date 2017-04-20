tests - selecting
testGeneralizationsInClass
	| parent child |
	parent := OPXMIObjectElement new
		containedItems: {OPXMIValueElement xmiName: 'name' value: 'Parent'}.
	child := OPXMIObjectElement new
		containedItems:
			{OPXMIValueElement xmiName: 'name' value: 'Child'.
			OPXMIObjectElement new
				xmiName: 'generalization';
				containedItems:
					{OPXMIReferenceAttribute new
						xmiName: 'general';
						referencedElements: {parent}}}.
	self assert: (generator collectGeneralizationsInClass: parent) equals: #().
	self
		assert: (generator collectGeneralizationsInClass: child)
		equals: {'Child' -> 'Parent'}
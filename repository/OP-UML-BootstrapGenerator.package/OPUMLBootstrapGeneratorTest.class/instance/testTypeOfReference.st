tests - retrieving
testTypeOfReference
	self
		assert:
			(generator
				typeOf:
					(OPXMIReferenceAttribute new
						referencedElements:
							{OPXMIObjectElement new
								containedItems: {OPXMIValueElement xmiName: 'name' value: 'Element'}}))
		equals: 'Element'
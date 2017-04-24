asserting
assertMethod: actualCode equals: expectedCode
	self
		assert: (RBParser parseMethod: actualCode) formattedCode
		equals: (RBParser parseMethod: expectedCode) formattedCode
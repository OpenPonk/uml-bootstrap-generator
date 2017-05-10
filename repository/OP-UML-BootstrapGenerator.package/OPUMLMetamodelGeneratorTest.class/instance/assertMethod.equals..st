asserting
assertMethod: actualCode equals: expectedCode
	self
		assert: (RBParser parseMethod: actualCode) formattedCode withUnixLineEndings
		equals: (RBParser parseMethod: expectedCode) formattedCode withUnixLineEndings
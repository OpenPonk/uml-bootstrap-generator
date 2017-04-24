tests - retrieving
testParent
	self assert: (generator parentFor: 'Element') equals: 'Object'.
	self assert: (generator parentFor: 'Port') equals: 'MBUTElement'
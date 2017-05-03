tests - retrieving
testParent
	self assert: (generator parentFor: 'MetaElement') equals: 'Object'.
	self assert: (generator parentFor: 'Element') equals: 'MBUTMetaElement'.
	self assert: (generator parentFor: 'Port') equals: 'MBUTElement'
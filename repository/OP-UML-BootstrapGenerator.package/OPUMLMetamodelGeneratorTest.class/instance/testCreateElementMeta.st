tests - meta
testCreateElementMeta
	| cls |
	cls := generator createElementMeta.
	generator createClassFrom: (self findClass: 'Element') in: 'CommonStructure'.
	self assert: cls name equals: 'MBUTElement'.
	self assert: cls parent equals: 'Object'
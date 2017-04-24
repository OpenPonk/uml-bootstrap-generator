tests - meta
testCreateElementMeta
	| cls |
	cls := generator createElementMeta.
	self assert: cls name equals: 'MBUTElement'.
	self assert: cls parent equals: 'Object'
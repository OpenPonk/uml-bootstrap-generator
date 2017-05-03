tests
testCreateElementMeta
	| cls elCls |
	cls := generator createElementMeta.
	elCls := generator createClassFrom: (self findClass: 'Element') in: 'CommonStructure'.
	self assert: cls name equals: 'MBUTMetaElement'.
	self assert: cls parent equals: 'Object'.
	self assert: elCls name equals: 'MBUTElement'.
	self assert: elCls parent equals: 'MBUTMetaElement'
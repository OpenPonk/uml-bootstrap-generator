tests - generating - enums
testCreateEnum
	| enumModel class |
	enumModel := BootUMLEnumeration new name: 'SimpleEnum'.
	class := generator createEnumFrom: enumModel in: 'Tag'.
	self assert: class name equals: 'MBUTSimpleEnum'.
	self assert: class parent equals: 'MBUTEnumeration'
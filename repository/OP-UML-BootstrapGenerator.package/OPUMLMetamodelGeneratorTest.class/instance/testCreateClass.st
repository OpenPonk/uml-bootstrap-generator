tests - generating - classes
testCreateClass
	| classModel class |
	classModel := BootUMLClass new name: 'Simple'.
	class := generator createClassFrom: classModel in: 'Tag'.
	self assert: class name equals: 'MBUTSimple'
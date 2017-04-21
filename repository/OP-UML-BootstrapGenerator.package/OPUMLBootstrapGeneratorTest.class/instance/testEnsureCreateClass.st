tests - generating
testEnsureCreateClass
	| result1 result2 |
	result1 := generator ensureCreateClass: 'GeneratedClassXXX' in: 'Package'.
	self assert: result1 name equals: 'BUTGeneratedClassXXX'.
	self assert: result1 package equals: 'Generated-UMLBootstrapTest-Package'.
	self assert: result1 parent equals: generator rootClassName.
	result2 := generator ensureCreateClass: 'GeneratedClassXXX' in: 'Package'.
	self assert: result1 == result2 description: 'should be the same identity'
tests - generating
testEnsureCreateClass
	| result1 result2 |
	result1 := generator ensureCreateClass: 'GeneratedClassXXX' in: 'Generated-Package'.
	self assert: result1 name equals: 'GeneratedClassXXX'.
	self assert: result1 package equals: 'Generated-Package'.
	self assert: result1 parent equals: generator rootClassName.
	result2 := generator ensureCreateClass: 'GeneratedClassXXX' in: 'Generated-Package'.
	self assert: result1 == result2 description: 'should be the same identity'
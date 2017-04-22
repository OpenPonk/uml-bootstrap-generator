tests
testMultipleNestedAttributes
	| result |
	result := reader readItem: self multipleNestedAttributes.
	self assert: result className equals: #BootUMLClass.
	self assert: result ownedAttribute size equals: 2.
	self assert: result ownedAttribute first name equals: 'annotatedElement'.
	self assert: result ownedAttribute second name equals: 'body'
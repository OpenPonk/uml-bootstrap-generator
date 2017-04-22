testing - test meta
testAttributeInClass
	| attribute |
	attribute := self attribute: 'ownedComment' inClass: 'Element'.
	self assert: attribute isNotNil.
	self assert: attribute name equals: 'ownedComment'
testing - test meta
testFindClass
	| aClass |
	aClass := self findClass: 'Comment'.
	self assert: aClass isNotNil.
	self assert: aClass name equals: 'Comment'
tests - generating - literals
testAddEnumLiteralNotPackage
	| class enumModel literal |
	class := CBClass new.
	class name: 'VisibilityKind'.
	enumModel := self findElement: 'VisibilityKind'.
	literal := enumModel ownedLiteral detect: [ :each | each name = 'package' ].
	generator addEnumLiteral: literal to: class.
	self assert: class selectors equals: #(package).
	self assert: class metaMethods isEmpty
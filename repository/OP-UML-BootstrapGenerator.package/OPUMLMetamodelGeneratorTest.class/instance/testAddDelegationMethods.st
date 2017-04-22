tests - generating - methods
testAddDelegationMethods
	| class classModel methods |
	class := CBClass new.
	classModel := self findClass: 'RedefinableElement'.
	generator createClassFrom: (self findClass: 'Element') in: 'CommonStructure'.
	generator createClassFrom: (self findClass: 'NamedElement') in: 'CommonStructure'.
	generator addDelegationMethodsFrom: classModel to: class.
	methods := class methods collect: [ :each | each selector -> each protocol ].
	self assert: (methods includes: 'nameExpression' -> 'accessing - NamedElement').
	self assert: (methods includes: 'ownedComment:' -> 'accessing - Element').
	self
		assertMethod: (class methods detect: [ :each | each selector = 'nameExpression' ]) source
		equals:
			'nameExpression
	^ (sharedGeneralizations at: #NamedElement) nameExpression'.
	self
		assertMethod: (class methods detect: [ :each | each selector = 'ownedComment:' ]) source
		equals:
			'ownedComment: aComment
	(sharedGeneralizations at: #Element) ownedComment: aComment'
tests - generating - generalizations
testAddAccessingDelegationMethods
	| class classModel methods |
	class := CBClass new.
	classModel := self findClass: 'RedefinableElement'.
	generator createClassFrom: (self findClass: 'Element') in: 'CommonStructure'.
	generator createClassFrom: (self findClass: 'NamedElement') in: 'CommonStructure'.
	generator addDelegationMethodsFrom: classModel to: class.
	methods := class methods collect: [ :each | each selector -> each protocol ].
	self assert: (methods includes: 'nameExpression' -> 'accessing - NamedElement').
	self
		assertMethod: (class methods detect: [ :each | each selector = 'nameExpression' ]) source
		equals:
			'nameExpression
	^ (sharedGeneralizations at: #NamedElement) nameExpression'.
	self assert: (methods includes: 'nameExpression:' -> 'accessing - NamedElement').
	self
		assertMethod: (class methods detect: [ :each | each selector = 'nameExpression:' ]) source
		equals:
			'nameExpression: aStringExpression
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression'.
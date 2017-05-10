tests - generating - generalizations
testAddOperationsDelegationMethods
	| class classModel methods |
	class := CBClass new.
	classModel := self findClass: 'LiteralSpecification'.
	generator createClassFrom: (self findClass: 'NamedElement') in: 'Anywhere'.
	generator createClassFrom: (self findClass: 'ParameterableElement') in: 'Anywhere'.
	generator createClassFrom: (self findClass: 'TypedElement') in: 'Anywhere'.
	generator createClassFrom: (self findClass: 'PackageableElement') in: 'Anywhere'.
	generator createClassFrom: (self findClass: 'ValueSpecification') in: 'Anywhere'.
	generator addDelegationMethodsFrom: classModel to: class.
	methods := class methods collect: [ :each | each selector -> each protocol ].
	self assert: (methods includes: 'stringValue' -> 'operations - ValueSpecification').
	self
		assertMethod: (class methodNamed: #stringValue) source
		equals:
			'stringValue
	^ (sharedGeneralizations at: #ValueSpecification) stringValue'
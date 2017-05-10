tests - generating - generalizations
testDontAddOperationsDelegationMethods
	| class classModel methods |
	class := CBClass new.
	classModel := self findClass: 'LiteralString'.
	generator createClassFrom: (self findClass: 'NamedElement') in: 'Anywhere'.
	generator createClassFrom: (self findClass: 'ParameterableElement') in: 'Anywhere'.
	generator createClassFrom: (self findClass: 'TypedElement') in: 'Anywhere'.
	generator createClassFrom: (self findClass: 'PackageableElement') in: 'Anywhere'.
	generator createClassFrom: (self findClass: 'ValueSpecification') in: 'Anywhere'.
	generator createClassFrom: (self findClass: 'LiteralSpecification') in: 'Anywhere'.
	generator addDelegationMethodsFrom: classModel to: class.
	methods := class methods collect: [ :each | each selector -> each protocol ].
	methods := class methods collect: [ :each | each selector -> each protocol ].
	self deny: (methods includes: 'stringValue' -> 'operations - ValueSpecification')
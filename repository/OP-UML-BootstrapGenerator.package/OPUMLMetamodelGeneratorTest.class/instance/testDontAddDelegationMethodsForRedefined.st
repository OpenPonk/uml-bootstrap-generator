tests - generating - generalizations
testDontAddDelegationMethodsForRedefined
	| class classModel methods |
	class := CBClass new.
	classModel := self findClass: 'IntervalConstraint'.
	generator createClassFrom: (self findClass: 'Constraint') in: 'Somewhere'.
	generator createClassFrom: (self findClass: 'NamedElement') in: 'Somewhere'.
	generator createClassFrom: (self findClass: 'ParameterableElement') in: 'Somewhere'.
	generator createClassFrom: (self findClass: 'PackageableElement') in: 'Somewhere'.
	generator addDelegationMethodsFrom: classModel to: class.
	methods := class methods collect: [ :each | each selector -> each protocol ].
	self deny: (methods includes: 'specification' -> 'accessing - Constraint').
	self deny: (methods includes: 'specification:' -> 'accessing - Constraint').
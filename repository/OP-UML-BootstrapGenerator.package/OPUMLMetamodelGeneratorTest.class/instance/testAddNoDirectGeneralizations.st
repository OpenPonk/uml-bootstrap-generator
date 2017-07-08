tests - generating - generalizations
testAddNoDirectGeneralizations
	| class classModel |
	class := CBClass new.
	classModel := self findClass: 'NamedElement'.
	generator addGeneralizationsFrom: classModel to: class.
	self
		assert: class selectors
		equals: #(initializeSharedGeneralizations initializeDirectGeneralizations).
	self
		assertMethod: (class methodNamed: #initializeSharedGeneralizations) source
		equals:
			'initializeSharedGeneralizations
	sharedGeneralizations at: #NamedElement put: self
'.
	self
		assertMethod: (class methodNamed: #initializeDirectGeneralizations) source
		equals:
			'initializeDirectGeneralizations
	directGeneralizations := {
	}'
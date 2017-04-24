tests - generating - generalizations
testAddNoDirectGeneralizations
	| class classModel |
	class := CBClass new.
	classModel := self findClass: 'NamedElement'.
	generator addGeneralizationsFrom: classModel to: class.
	self
		assert: class selectors
		equals: #(initialize initializeSharedGeneralizations initializeDirectGeneralizations).
	self
		assertMethod: class methods first source
		equals:
			'initialize
	super initialize.
	self initializeSharedGeneralizations.
	self initializeDirectGeneralizations'.
	self
		assertMethod: class methods second source
		equals:
			'initializeSharedGeneralizations
'.
	self
		assertMethod: class methods third source
		equals:
			'initializeDirectGeneralizations
	directGeneralizations := {
	}'
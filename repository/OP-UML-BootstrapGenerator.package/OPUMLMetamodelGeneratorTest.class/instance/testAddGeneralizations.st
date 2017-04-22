tests - generating - methods
testAddGeneralizations
	| class classModel |
	class := CBClass new.
	classModel := self findClass: 'RedefinableElement'.
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
	sharedGeneralizations at: #Element put: (MBUTElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NamedElement put: (MBUTNamedElement newOnShared: sharedGeneralizations)'.
	self
		assertMethod: class methods third source
		equals:
			'initializeDirectGeneralizations
	generalizations := {
		sharedGeneralizations at: #NamedElement.
	}'
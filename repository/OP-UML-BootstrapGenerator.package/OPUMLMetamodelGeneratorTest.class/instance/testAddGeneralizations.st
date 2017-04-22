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
		assert: class methods first source
		equals:
			'initialize
	super initialize.
	self initializeSharedGeneralizations.
	self initializeDirectGeneralizations'.
	self
		assert: class methods second source
		equals:
			'initializeSharedGeneralizations
	sharedGeneralizations at: #Element put: (MBUTElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NamedElement put: (MBUTNamedElement newOnShared: sharedGeneralizations)'.
	self
		assert: class methods third source
		equals:
			'initializeDirectGeneralizations
	generalizations := {
		sharedGeneralizations at: #NamedElement.
	}'
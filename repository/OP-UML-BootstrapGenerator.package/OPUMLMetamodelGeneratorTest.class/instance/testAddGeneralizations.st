tests
testAddGeneralizations
	| class classModel |
	class := CBClass new.
	classModel := self findClass: 'RedefinableElement'.
	generator addGeneralizationsFrom: classModel to: class.
	self
		assert: class selectors
		equals: #(initializeSharedGeneralizations initializeDirectGeneralizations).
	self
		assertMethod: (class methodNamed: #initializeSharedGeneralizations) source
		equals:
			'initializeSharedGeneralizations
	sharedGeneralizations at: #NamedElement put: (MBUTNamedElement newOnShared: sharedGeneralizations)'.
	self
		assertMethod: (class methodNamed: #initializeDirectGeneralizations) source
		equals:
			'initializeDirectGeneralizations
	directGeneralizations := {
		sharedGeneralizations at: #NamedElement.
	}'
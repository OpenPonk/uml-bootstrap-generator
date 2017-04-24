tests - meta
testCreateElementMetaInstanceMethods
	| cls |
	cls := generator createElementMeta.
	self
		assert: (cls methods collect: #selector) sorted
		equals:
			#(initialize initializeWithShared: initializeGeneralizations gtInspectorAllPropertiesIn: gtInspectorPropertiesIn: printOn:)
				sorted.
	self
		assert: (cls methodNamed: #initializeGeneralizations) protocol
		equals: 'initialization'.
	self
		assertMethod: (cls methodNamed: #initializeWithShared:) source
		equals:
			'initializeWithShared: aDictionary
	super initialize.
	sharedGeneralizations := aDictionary.
	self initializeGeneralizations'
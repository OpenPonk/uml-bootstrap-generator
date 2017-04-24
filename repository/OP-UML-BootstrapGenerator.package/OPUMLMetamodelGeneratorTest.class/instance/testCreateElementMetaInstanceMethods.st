tests - meta
testCreateElementMetaInstanceMethods
	| cls |
	cls := generator createElementMeta.
	self
		assert: (cls methods collect: #selector) sorted
		equals:
			#(initialize initializeWithShared: gtInspectorAllPropertiesIn: gtInspectorPropertiesIn: printOn:)
				sorted.
	self
		assert: (cls methodNamed: #initialize) protocol
		equals: 'initialization'.
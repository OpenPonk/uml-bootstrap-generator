tests - meta
testCreateElementMetaInstanceMethods
	| cls |
	cls := generator createElementMeta.
	self
		assert: (cls methods collect: #selector) sorted
		equals:
			#(announcer announcer: initialize initializeWithShared: initializeDirectGeneralizations initializeSharedGeneralizations gtInspectorAllPropertiesIn: gtInspectorPropertiesIn: printOn: inspectorProperties inspectorPropertiesSelectors nonEmptyinspectorProperties uuid uuid: identity)
				sorted.
	self assert: (cls methodNamed: #initialize) protocol equals: 'initialization'
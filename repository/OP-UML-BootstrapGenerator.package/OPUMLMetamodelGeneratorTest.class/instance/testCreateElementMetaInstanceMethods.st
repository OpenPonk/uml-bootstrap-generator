tests
testCreateElementMetaInstanceMethods
	| cls |
	cls := generator createElementMeta.
	self
		assert: (cls methods collect: #selector) sorted
		equals:
			#(announcer announcer: initialize initializeWithShared: initializeDirectGeneralizations initializeSharedGeneralizations gtInspectorAllPropertiesIn: gtInspectorPropertiesIn: printOn: inspectorProperties inspectorPropertiesSelectors nonEmptyinspectorProperties uuid uuid: identity applyStereotype: appliedStereotypes gtInspectorStereotypePropertiesIn: gtInspectorStereotypesIn: gtInspectorTagsIn: hasTagAt: removeTagAt: tags tagAt: tagAt:put: oclAsType: oclClassifierNameFrom: oclIsKindOf: oclIsTypeOf: umlClassName umlMetaClass unapplyStereotype:)
				sorted.
	self assert: (cls methodNamed: #initialize) protocol equals: 'initialization'
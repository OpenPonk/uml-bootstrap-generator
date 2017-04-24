tests - retrieving
testAllSuperclasses
	| class |
	class := self findClass: 'StructuralFeature'.
	self
		assert: ((generator allSuperclassesOf: class) collect: #name)
		equals: #(NamedElement RedefinableElement MultiplicityElement TypedElement Feature)
tests - retrieving
testAllSuperclasses
	| class |
	class := self findClass: 'StructuralFeature'.
	self
		assert: ((generator allSuperclassesOf: class) collect: #name)
		equals: #(Element NamedElement RedefinableElement MultiplicityElement TypedElement Feature)
tests - retrieving
testSuperclassLayers
	| class |
	class := self findClass: 'StructuralFeature'.
	self
		assert: ((generator superclassLayersOf: class) collect: [ :each | each collect: #name ])
		equals:
			#(#() #(Element) #(Element NamedElement) #(Element NamedElement RedefinableElement) #(MultiplicityElement TypedElement Feature))
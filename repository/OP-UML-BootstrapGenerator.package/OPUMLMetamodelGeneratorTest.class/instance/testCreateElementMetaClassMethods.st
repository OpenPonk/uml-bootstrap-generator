tests - meta
testCreateElementMetaClassMethods
	| cls method |
	cls := generator createElementMeta.
	generator createClassFrom: (self findClass: 'Element') in: 'CommonStructure'.
	self assert: (cls metaMethods collect: #selector) sorted equals: #(newOnShared:) sorted.
	method := cls metaMethods first.
	self assert: method protocol equals: 'instance creation'.
	self
		assertMethod: method source
		equals:
			'newOnShared: aDictionary
	^ self basicNew
		initializeWithShared: aDictionary;
		yourself'
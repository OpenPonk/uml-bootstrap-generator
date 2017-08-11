tests - meta
testCreateElementMetaClassMethods
	| cls method |
	cls := generator createElementMeta.
	self
		assert: (cls metaMethods collect: #selector) sorted
		equals: #(newOnShared:) sorted.
	method := cls metaMethods detect: [ :each | each selector = #newOnShared: ].
	self assert: method protocol equals: 'instance creation'.
	self
		assertMethod: method source
		equals:
			'newOnShared: aDictionary
	^ self basicNew
		initializeWithShared: aDictionary;
		yourself'
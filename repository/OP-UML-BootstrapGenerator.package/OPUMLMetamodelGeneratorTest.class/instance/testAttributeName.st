tests - testing
testAttributeName
	self
		assert: (generator attributeNameFor: (self attribute: 'owner' inClass: 'Element'))
		equals: 'owner'.
	self
		assert: (generator attributeNameFor: (self attribute: 'class' inClass: 'Property'))
		equals: 'owningClass'.
	self
		assert: (generator attributeNameFor: (self attribute: 'ownedComment' inClass: 'Element'))
		equals: 'ownedComments'
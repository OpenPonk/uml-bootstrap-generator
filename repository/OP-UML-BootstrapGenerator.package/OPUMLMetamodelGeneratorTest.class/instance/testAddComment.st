tests - generating - classes
testAddComment
	| class |
	class := CBClass new.
	self assert: class comment equals: nil.
	generator addCommentFrom: (self findClass: 'Element') to: class.
	self
		assert: class comment
		equals:
			'An Element is a constituent of a model. As such, it has the capability of owning other Elements.'
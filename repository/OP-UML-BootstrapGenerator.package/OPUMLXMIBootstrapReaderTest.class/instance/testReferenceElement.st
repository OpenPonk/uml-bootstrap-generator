tests
testReferenceElement
	| result gen |
	result := reader readItem: self elementWithGeneralization.
	self assert: result name equals: 'Comment'.
	gen := result generalization first.
	self assert: gen className equals: 'BootUMLGeneralization'.
	self assert: gen general name equals: 'Element'
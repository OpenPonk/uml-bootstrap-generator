tests
testGeneralizationElement
	| result |
	result := reader readItem: self generalizationElement.
	self assert: result className equals: 'BootUMLGeneralization'.
	self assert: result general name equals: 'Element'
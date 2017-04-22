tests
testGroupedChildren
	| result |
	result := reader groupedChildrenIn: self multipleNestedAttributes.
	self assert: result keys sorted equals: #(name ownedAttribute).
	self assert: (result at: #name) size equals: 1.
	self assert: (result at: #ownedAttribute) size equals: 2
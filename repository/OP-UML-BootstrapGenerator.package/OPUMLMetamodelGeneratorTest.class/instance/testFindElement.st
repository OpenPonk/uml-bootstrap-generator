testing - test meta
testFindElement
	| anElement |
	anElement := self findElement: 'AggregationKind'.
	self assert: anElement isNotNil.
	self assert: anElement name equals: 'AggregationKind'
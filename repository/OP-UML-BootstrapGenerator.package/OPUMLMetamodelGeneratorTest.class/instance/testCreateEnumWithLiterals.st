tests - generating - enums
testCreateEnumWithLiterals
	| enumModel class |
	enumModel := self findElement: 'AggregationKind'.
	class := generator createEnumFrom: enumModel in: 'Tag'.
	self assert: class selectors sorted equals: #(composite none shared)
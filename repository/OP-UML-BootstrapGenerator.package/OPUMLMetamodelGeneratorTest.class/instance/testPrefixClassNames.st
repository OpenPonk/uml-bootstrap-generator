tests - generating - operations
testPrefixClassNames
	self
		assert: (generator prefixClassNamesInText: '^ self aggregation = ''%AggregationKind%'' composite')
		equals: '^ self aggregation = MBUTAggregationKind composite'
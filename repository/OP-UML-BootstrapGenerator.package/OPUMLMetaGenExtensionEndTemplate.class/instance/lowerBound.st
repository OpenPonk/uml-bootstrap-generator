implementation
lowerBound
	^ self lowerValue ifNil: [ 0 ] ifNotNil: [ self lowerValue integerValue ]
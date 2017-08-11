implementation
lowerBound
	^ (lowerValue isNil or: [ lowerValue integerValue isNil ])
		ifTrue: [ 1 ]
		ifFalse: [ lowerValue integerValue ]
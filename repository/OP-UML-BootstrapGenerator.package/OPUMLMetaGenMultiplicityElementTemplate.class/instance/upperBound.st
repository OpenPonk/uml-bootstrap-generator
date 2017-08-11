implementation
upperBound
	^ (upperValue isNil or: [ upperValue unlimitedValue isNil ])
		ifTrue: [ 1 ]
		ifFalse: [ upperValue unlimitedValue ]
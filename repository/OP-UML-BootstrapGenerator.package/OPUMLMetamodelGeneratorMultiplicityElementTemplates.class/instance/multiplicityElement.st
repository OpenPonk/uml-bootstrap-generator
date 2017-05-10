templates
multiplicityElement
	^ {#lower -> '^ self lowerBound'.
	#upper -> '^ self upperBound'.
	#lowerBound
		->
			'^ (lowerValue isNil or: [ lowerValue integerValue isNil ]) ifTrue: [ 1 ] ifFalse: [ lowerValue integerValue ]'.
	#upperBound
		->
			'^ (upperValue isNil or: [ upperValue unlimitedValue isNil ]) ifTrue: [ 1 ] ifFalse: [ upperValue unlimitedValue ]'.
	#isMultivalued
		->
			'^ self upperBound = ''*'' or: [ self upperBound > 1 ]'}
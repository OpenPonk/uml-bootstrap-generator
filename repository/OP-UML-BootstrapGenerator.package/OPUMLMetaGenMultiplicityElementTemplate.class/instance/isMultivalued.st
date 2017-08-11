implementation
isMultivalued
	^ self upperBound = '*' or: [ self upperBound > 1 ]
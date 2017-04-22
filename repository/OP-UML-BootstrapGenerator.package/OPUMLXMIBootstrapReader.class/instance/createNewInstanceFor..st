instance creation
createNewInstanceFor: aClassName
	^ (self classPrefix , (aClassName splitOn: ':') last) asSymbol asClass new
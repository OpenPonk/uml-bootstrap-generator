accessing
requiredClasses
	"all required classes and all their combined superclasses"

	| generalizations |
	^ cachedRequiredClasses
		ifNil: [ generalizations := self collectGeneralizationsInPackages: self generatedPackages.
			cachedRequiredClasses := (self requiredRealClasses
				flatCollect: [ :each | self allTransitiveSuperclassesOf: each in: generalizations ])
				asSet sorted ]
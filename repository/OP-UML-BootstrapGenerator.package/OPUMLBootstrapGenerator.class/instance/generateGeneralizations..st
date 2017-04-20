generating
generateGeneralizations: aCollectionOfPairs
	| keys |
	keys := self withoutDuplicates: ((aCollectionOfPairs collect: #key) , (aCollectionOfPairs collect: #value)).
	keys
		do: [ :each | 
			self
				createSuperclasses: (self layeredSuperclassesFor: each in: aCollectionOfPairs)
				for: each.
			self
				createDelegationMethods: (self layeredSuperclassesFor: each in: aCollectionOfPairs)
				for: each ]
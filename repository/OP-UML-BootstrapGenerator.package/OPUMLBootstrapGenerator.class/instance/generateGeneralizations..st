generating
generateGeneralizations: aCollectionOfPairs
	| keys |
	keys := ((aCollectionOfPairs collect: #key) , (aCollectionOfPairs collect: #value))
		removeDuplicates.
	keys
		do: [ :each | 
			self
				createSuperclasses: (self layeredSuperclassesFor: each in: aCollectionOfPairs)
				for: each.
			self
				createDelegationMethods: (self layeredSuperclassesFor: each in: aCollectionOfPairs)
				for: each ]
implementation
allAttributes
	| allAttributes |
	allAttributes := OrderedCollection new.
	allAttributes addAll: self attributes.
	sharedGeneralizations
		at: #Class
		ifPresent: [ :cls | allAttributes addAll: cls ownedAttributes ].
	self parents do: [ :each | allAttributes addAll: each allAttributes ].
	^ (allAttributes collect: [ :each | each -> 1 ]) asOrderedDictionary keys
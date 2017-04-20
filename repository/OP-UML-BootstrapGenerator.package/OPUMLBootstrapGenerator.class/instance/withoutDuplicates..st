utility
withoutDuplicates: aCollection
	| dict |
	dict := OrderedDictionary new.
	aCollection do: [ :each | dict at: each put: true ].
	^ dict keys
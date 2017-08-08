writing
writeValueElement: aValue
	(aValue isString and: [ aValue includesSubstring: '::' ])
		ifTrue: [ | split |
			split := aValue splitOn: '::'.
			Smalltalk hasClassNamed: (classPrefix , split first) asSymbol.
			^ OPXMIValueElement new value: split second ].
	^ OPXMIValueElement new value: aValue asString
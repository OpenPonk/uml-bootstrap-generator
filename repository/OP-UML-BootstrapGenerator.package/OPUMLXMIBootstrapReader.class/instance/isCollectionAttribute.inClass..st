testing
isCollectionAttribute: aSymbol inClass: aClass
	"hacks for now, look at multiplicity later on"

	| className |
	className := aClass name withoutPrefix: self classPrefix.
	(#(name lowerValue upperValue) includes: aSymbol)
		ifTrue: [ ^ false ].
	(aSymbol = #value
		and:
			[ #(LiteralString LiteralInteger LiteralBoolean LiteralUnlimitedNatural LiteralReal) includes: className ])
		ifTrue: [ ^ false ].
	(aSymbol = #body and: [ className = #Comment ])
		ifTrue: [ ^ false ].
	(aSymbol = #importedPackage and: [ className = #PackageImport ])
		ifTrue: [ ^ false ].
	aSymbol = #type
		ifTrue: [ ^ false ].
	((#(general specific) includes: aSymbol) and: [ className = #Generalization ])
		ifTrue: [ ^ false ].
	^ true
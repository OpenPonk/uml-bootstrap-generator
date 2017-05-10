testing
isCollectionAttribute: aSymbol inClass: aClass
	"hacks for now, look at multiplicity later on"

	| className pairs selectors |
	className := aClass name withoutPrefix: self classPrefix.
	pairs := {#Comment -> #body.
	#Constraint -> #specification.
	#Operation -> #bodyCondition.
	#InstanceValue -> #instance.
	#PackageImport -> #importedPackage.
	#Generalization -> #general.
	#Generalization -> #specific}.
	selectors := #(name lowerValue upperValue type defaultValue).
	(pairs includes: className -> aSymbol)
		ifTrue: [ ^ false ].
	(selectors includes: aSymbol)
		ifTrue: [ ^ false ].
	(aSymbol = #value and: [ #(LiteralString LiteralInteger LiteralBoolean LiteralUnlimitedNatural LiteralReal) includes: className ])
		ifTrue: [ ^ false ].
	^ true
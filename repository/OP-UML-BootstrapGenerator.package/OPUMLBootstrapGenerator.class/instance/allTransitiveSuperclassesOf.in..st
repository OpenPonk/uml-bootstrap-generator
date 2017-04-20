retrieving
allTransitiveSuperclassesOf: aName in: aCollectionOfPairs
	| pairs keys layer |
	pairs := OrderedCollection new.
	keys := OrderedCollection with: aName.
	[ keys isNotEmpty ]
		whileTrue: [ layer := keys
				flatCollect: [ :each | aCollectionOfPairs select: [ :pair | pair key = each ] ].
			pairs := pairs , layer.
			keys := layer collect: #value ].
	pairs := pairs collect: [ :pair | pair value -> pair key ].
	^ ((pairs collect: #key) , (pairs collect: #value)) asSet sorted
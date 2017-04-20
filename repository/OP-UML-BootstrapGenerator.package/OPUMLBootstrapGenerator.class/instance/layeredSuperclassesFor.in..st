selecting
layeredSuperclassesFor: aKey in: aCollection
	| pairs keys layer |
	pairs := OrderedCollection new.
	keys := OrderedCollection with: aKey.
	[ keys isNotEmpty ]
		whileTrue: [ layer := keys flatCollect: [ :each | aCollection select: [ :pair | pair key = each ] ].
			keys := layer collect: #value.
			pairs add: keys removeDuplicates ].
	^ (pairs reject: #isEmpty) reverse
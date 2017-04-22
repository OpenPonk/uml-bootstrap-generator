retrieving
allSuperclassesOf: aClassModel
	| generalizations |
	generalizations := OrderedCollection new.
	(self superclassLayersOf: aClassModel)
		do: [ :layer | layer do: [ :each | generalizations addIfNotPresent: each ] ].
	^ generalizations asArray
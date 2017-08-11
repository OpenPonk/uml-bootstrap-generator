implementation
unappliedFrom: anElement as: aName
	(self tags at: #base ifAbsentPut: [ OrderedDictionary new ])
		removeKey: aName
		ifAbsent: [  ]
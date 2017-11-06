retrieving
superclassLayersOf: aClassModel
	| subclasses layers layer parents |
	layers := OrderedCollection new.
	subclasses := OrderedCollection with: aClassModel.
	[ subclasses isNotEmpty ]
		whileTrue: [ 
			layer := (subclasses select: [ :each | each generalizations isNotNil ])
				flatCollect: [ :each | each generalizations collect: #general ].
			layers add: layer asArray.
			subclasses := layer ].
	^ layers reversed asArray
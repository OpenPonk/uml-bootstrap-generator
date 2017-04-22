retrieving
superclassLayersOf: aClassModel
	| subclasses layers layer parents |
	layers := OrderedCollection new.
	subclasses := OrderedCollection with: aClassModel.
	[ subclasses isNotEmpty ]
		whileTrue: [ 
			layer := (subclasses select: [ :each | each generalization isNotNil ])
				flatCollect: [ :each | each generalization collect: #general ].
			layers add: layer asArray.
			subclasses := layer ].
	^ layers reversed asArray
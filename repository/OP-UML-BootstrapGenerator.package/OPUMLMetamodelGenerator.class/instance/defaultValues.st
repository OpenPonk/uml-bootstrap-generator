retrieving
defaultValues
	| literals |
	"	defaultValues ifNotNil: [ ^ defaultValues ]."
	literals := (sourceModel packagedElement detect: [ :each | each name = 'Values' ])
		packagedElement select: [ :each | each name beginsWith: 'Literal' ].
	defaultValues := literals
		collect: [ :each | 
			| key value |
			key := each name.
			value := each ownedAttribute
				ifNil: [ nil ]
				ifNotNil: [ (each ownedAttribute detect: [ :attr | attr name = 'value' ]) defaultValue value ].
			key -> value ].
	^ defaultValues
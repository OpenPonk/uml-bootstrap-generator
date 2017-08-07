implementation
"protocol: reflective operations"
doesNotUnderstand: aMessage
	(aMessage selector beginsWith: 'base_')
		ifTrue: [ | sel |
			sel := (aMessage selector withoutSuffix: ':') splitOn: '_'.
			^ aMessage hasArguments
				ifTrue: [ self applyTo: aMessage argument as: sel second ]
				ifFalse: [ self appliedToAs: sel second ] ].
	^ super doesNotUnderstand: aMessage
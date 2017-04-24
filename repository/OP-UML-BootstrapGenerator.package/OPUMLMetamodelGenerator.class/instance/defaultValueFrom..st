retrieving
defaultValueFrom: aDefaultValue
	aDefaultValue value ifNotNil: [ ^ aDefaultValue value ].
	^ self defaultValues
		detect: [ :pair | aDefaultValue className endsWith: pair key ]
		ifFound: [ :pair | pair value ]
		ifNone: [ nil ]
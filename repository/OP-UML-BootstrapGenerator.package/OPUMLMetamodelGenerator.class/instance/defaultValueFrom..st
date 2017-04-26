retrieving
defaultValueFrom: aDefaultValue
	(self isEnumValue: aDefaultValue)
		ifTrue: [ ^ (self classNameFor: aDefaultValue type name) , ' new ' , aDefaultValue instance name ].
	aDefaultValue value ifNotNil: [ ^ aDefaultValue value ].
	^ self defaultValues
		detect: [ :pair | aDefaultValue className endsWith: pair key ]
		ifFound: [ :pair | pair value ]
		ifNone: [ nil ]
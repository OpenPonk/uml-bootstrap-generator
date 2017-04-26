utility
asPlural: aString
	(aString endsWith: 's')
		ifTrue: [ ^ aString , 'es' ].
	(aString endsWith: 'y')
		ifTrue: [ ^ (aString withoutSuffix: 'y') , 'ies' ].
	^ aString , 's'
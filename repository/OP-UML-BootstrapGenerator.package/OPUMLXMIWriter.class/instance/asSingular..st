utility
asSingular: aString
	(aString endsWith: 'ses')
		ifTrue: [ ^ aString withoutSuffix: 'es' ].
	(aString endsWith: 'ies')
		ifTrue: [ ^ (aString withoutSuffix: 'ies') , 'y' ].
	^ aString withoutSuffix: 's'
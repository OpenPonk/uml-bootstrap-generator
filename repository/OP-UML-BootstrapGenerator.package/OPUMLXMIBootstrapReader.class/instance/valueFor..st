reading
valueFor: anObject
	anObject = 'true'
		ifTrue: [ ^ true ].
	anObject = 'false'
		ifTrue: [ ^ false ].
	(NumberParser isNumber: anObject)
		ifTrue: [ ^ Number readFromString: anObject ].
	^ anObject
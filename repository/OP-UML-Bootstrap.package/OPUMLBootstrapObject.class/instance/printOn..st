printing
printOn: aStream
	super printOn: aStream.
	(sharedGeneralizations includesKey: 'LiteralSpecification')
		ifTrue: [ aStream
				<< '(';
				<< self value printString;
				<< ')'.
			^ self ].
	(self class selectors includes: #name)
		ifTrue: [ aStream
				<< '(';
				<< self name printString;
				<< ')' ]
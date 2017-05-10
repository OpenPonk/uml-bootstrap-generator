structure accessing
methodsFor: anOperation inClassNamed: aClassName
	| methodBehavior |
	(self supportsClass: aClassName)
		ifFalse: [ ^ #() ].
	methodBehavior := self
		methodBehaviorFor: anOperation
		from: (self perform: aClassName uncapitalized asSymbol) asDictionary.
	^ methodBehavior ifNil: [ #() ] ifNotNil: [ {methodBehavior} ]
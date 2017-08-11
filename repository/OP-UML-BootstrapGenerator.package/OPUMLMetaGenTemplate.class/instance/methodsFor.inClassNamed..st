accessing
methodsFor: anOperation inClassNamed: aClassName
	| methodBehavior |
	(self supportsClass: aClassName)
		ifFalse: [ ^ #() ].
	methodBehavior := self
		methodBehaviorFor: anOperation
		from: self implementedMethods asDictionary.
	^ methodBehavior ifNil: [ #() ] ifNotNil: [ {methodBehavior} ]
structure accessing
methodBehaviorFor: anOperation from: aDictionaryOfSources
	(aDictionaryOfSources includesKey: anOperation name)
		ifFalse: [ ^ nil ].
	"this should actually be BootUMLOpaqueBehavior, but I didn't bootstrap that class; in either case their protocol is the same"
	^ BootUMLOpaqueExpression new
		body: {aDictionaryOfSources at: anOperation name};
		language: #(Pharo)
Class {
	#name : 'OPUMLMetamodelGeneratorTemplates',
	#superclass : 'Object',
	#category : 'OpenPonk-UML-BootstrapGenerator-Templates',
	#package : 'OpenPonk-UML-BootstrapGenerator',
	#tag : 'Templates'
}

{ #category : 'structure accessing' }
OPUMLMetamodelGeneratorTemplates >> methodBehaviorFor: anOperation from: aDictionaryOfSources [
	(aDictionaryOfSources includesKey: anOperation name)
		ifFalse: [ ^ nil ].
	"this should actually be BootUMLOpaqueBehavior, but I didn't bootstrap that class; in either case their protocol is the same"
	^ BootUMLOpaqueExpression new
		body: {aDictionaryOfSources at: anOperation name};
		language: #(Pharo)
]

{ #category : 'structure accessing' }
OPUMLMetamodelGeneratorTemplates >> methodsFor: anOperation inClassNamed: aClassName [
	| methodBehavior |
	(self supportsClass: aClassName)
		ifFalse: [ ^ #() ].
	methodBehavior := self
		methodBehaviorFor: anOperation
		from: (self perform: aClassName uncapitalized asSymbol) asDictionary.
	^ methodBehavior ifNil: [ #() ] ifNotNil: [ {methodBehavior} ]
]

{ #category : 'accessing' }
OPUMLMetamodelGeneratorTemplates >> supportedClasses [
	^ (self class selectorsInProtocol: 'templates') collect: #capitalized
]

{ #category : 'testing' }
OPUMLMetamodelGeneratorTemplates >> supportsClass: aClassName [
	^ (self class selectorsInProtocol: 'templates') includes: aClassName uncapitalized
]

{ #category : 'templates' }
OPUMLMetamodelGeneratorTemplates >> useMethodPerAccessor [
	^ (self class methodsInProtocol: #implementation)
		collect: [ :method | 
			| body |
			body := method ast body.
			method selector -> (body source copyFrom: body start to: body stop) ]
]

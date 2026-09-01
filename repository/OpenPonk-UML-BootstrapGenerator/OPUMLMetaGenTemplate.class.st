"
I am the abstract base class for specific UML element templates. I declare which metamodel classes I support and provide custom Pharo methods that will be injected into those classes during generation.
"
Class {
	#name : 'OPUMLMetaGenTemplate',
	#superclass : 'OPUMLMetamodelGeneratorTemplates',
	#category : 'OpenPonk-UML-BootstrapGenerator-Templates',
	#package : 'OpenPonk-UML-BootstrapGenerator',
	#tag : 'Templates'
}

{ #category : 'accessing' }
OPUMLMetaGenTemplate >> implementedMethods [
	^ (self class methodsInProtocol: #implementation)
		collect: [ :method | 
			| body |
			body := method ast body.
			method selector -> (body source copyFrom: body start to: body stop) ]
]

{ #category : 'structure accessing' }
OPUMLMetaGenTemplate >> methodsFor: anOperation inClassNamed: aClassName [
	| methodBehavior |
	(self supportsClass: aClassName)
		ifFalse: [ ^ #() ].
	methodBehavior := self
		methodBehaviorFor: anOperation
		from: self implementedMethods asDictionary.
	^ methodBehavior ifNil: [ #() ] ifNotNil: [ {methodBehavior} ]
]

{ #category : 'accessing' }
OPUMLMetaGenTemplate >> supportedClasses [
	^ {(self className withoutPrefix: 'OPUMLMetaGen') withoutSuffix: 'Template'}
]

{ #category : 'testing' }
OPUMLMetaGenTemplate >> supportsClass: aClassName [
	^ self className = (#OPUMLMetaGen , aClassName , #Template)
]

"
I am a base class for classes providing Pharo implemention for some UML metamodel elements.
"
Class {
	#name : 'OPUMLMetaGenTemplate',
	#superclass : 'OPUMLMetamodelGeneratorTemplates',
	#category : 'OP-UML-BootstrapGenerator-Templates',
	#package : 'OP-UML-BootstrapGenerator',
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

{ #category : 'accessing' }
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

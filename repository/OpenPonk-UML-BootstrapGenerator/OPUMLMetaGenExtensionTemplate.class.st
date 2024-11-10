Class {
	#name : 'OPUMLMetaGenExtensionTemplate',
	#superclass : 'OPUMLMetaGenTemplate',
	#category : 'OpenPonk-UML-BootstrapGenerator-Templates',
	#package : 'OpenPonk-UML-BootstrapGenerator',
	#tag : 'Templates'
}

{ #category : 'implementation' }
OPUMLMetaGenExtensionTemplate >> isRequired [
	^ self ownedEnd lowerBound = 1
]

{ #category : 'implementation' }
OPUMLMetaGenExtensionTemplate >> metaclass [
	^ self metaclassEnd type
]

{ #category : 'implementation' }
OPUMLMetaGenExtensionTemplate >> metaclassEnd [
	^ (self memberEnds reject: [ :each | self ownedEnds includes: each ]) anyOne
]

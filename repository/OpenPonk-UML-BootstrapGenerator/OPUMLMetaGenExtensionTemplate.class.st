"
I provide custom Pharo template methods (such as navigating to metaclasses and checking requirement constraints) that are injected into generated UML Extension instances used within UML Profiles.
"
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

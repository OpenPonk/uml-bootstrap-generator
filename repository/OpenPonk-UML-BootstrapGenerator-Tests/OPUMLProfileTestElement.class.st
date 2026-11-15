"
Lightweight test double simulating profile, extension, property, and classifier elements during profile extension-method generation tests without requiring the full UML metamodel.
"
Class {
	#name : 'OPUMLProfileTestElement',
	#superclass : 'Object',
	#instVars : [
		'name',
		'kind',
		'packagedElements',
		'implementationPackage',
		'ownedEnd',
		'type',
		'opposite'
	],
	#category : 'OpenPonk-UML-BootstrapGenerator-Tests-Profile-Generator',
	#package : 'OpenPonk-UML-BootstrapGenerator-Tests',
	#tag : 'Profile-Generator'
}

{ #category : 'accessing' }
OPUMLProfileTestElement >> implementationPackage [

	^ implementationPackage
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> implementationPackage: aPackageName [

	implementationPackage := aPackageName
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> kind [

	^ kind
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> kind: aClassifierSymbol [

	kind := aClassifierSymbol
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> name [

	^ name
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> name: aString [

	name := aString
]

{ #category : 'testing' }
OPUMLProfileTestElement >> oclIsKindOf: aClassifierSymbol [

	^ kind = aClassifierSymbol
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> opposite [

	^ opposite
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> opposite: anElement [

	opposite := anElement
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> ownedEnd [

	^ ownedEnd
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> ownedEnd: anElement [

	ownedEnd := anElement
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> packagedElements [

	^ packagedElements
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> packagedElements: aCollection [

	packagedElements := aCollection
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> type [

	^ type
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> type: anElement [

	type := anElement
]

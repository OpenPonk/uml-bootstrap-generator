"
Test double representing UML metamodel objects and associations for executing template implementation methods in unit tests.
"
Class {
	#name : 'OPUMLMetaGenTestDouble',
	#superclass : 'Object',
	#instVars : [
		'attributes',
		'castTarget',
		'general',
		'generalizations',
		'integerValue',
		'kinds',
		'lowerValue',
		'memberEnds',
		'navigableOwnedEnds',
		'ownedAttributes',
		'ownedEnd',
		'ownedEnds',
		'packagedElements',
		'type',
		'unlimitedValue'
	],
	#category : 'OpenPonk-UML-BootstrapGenerator-Tests-Templates',
	#package : 'OpenPonk-UML-BootstrapGenerator-Tests',
	#tag : 'Templates'
}

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> attributes [

	^ attributes
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> attributes: aCollection [

	attributes := aCollection
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> castTarget [

	^ castTarget
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> castTarget: anObject [

	castTarget := anObject
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> general [

	^ general
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> general: aClassifier [

	general := aClassifier
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> generalizations [

	^ generalizations
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> generalizations: aCollection [

	generalizations := aCollection
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> integerValue [

	^ integerValue
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> integerValue: anInteger [

	integerValue := anInteger
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> kinds [

	^ kinds ifNil: [ #(  ) ]
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> kinds: aCollection [

	kinds := aCollection
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> lowerValue [

	^ lowerValue
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> lowerValue: aValue [

	lowerValue := aValue
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> memberEnds [

	^ memberEnds
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> memberEnds: aCollection [

	memberEnds := aCollection
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> navigableOwnedEnds [

	^ navigableOwnedEnds
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> navigableOwnedEnds: aCollection [

	navigableOwnedEnds := aCollection
]

{ #category : 'testing' }
OPUMLMetaGenTestDouble >> oclAsType: aClassifierSymbol [

	^ castTarget ifNil: [ self ]
]

{ #category : 'testing' }
OPUMLMetaGenTestDouble >> oclIsKindOf: aClassifierSymbol [

	^ self kinds includes: aClassifierSymbol
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> ownedAttributes [

	^ ownedAttributes
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> ownedAttributes: aCollection [

	ownedAttributes := aCollection
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> ownedEnd [

	^ ownedEnd
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> ownedEnd: aProperty [

	ownedEnd := aProperty
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> ownedEnds [

	^ ownedEnds
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> ownedEnds: aCollection [

	ownedEnds := aCollection
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> packagedElements [

	^ packagedElements
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> packagedElements: aCollection [

	packagedElements := aCollection
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> type [

	^ type
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> type: aType [

	type := aType
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> unlimitedValue [

	^ unlimitedValue
]

{ #category : 'accessing' }
OPUMLMetaGenTestDouble >> unlimitedValue: aValue [

	unlimitedValue := aValue
]

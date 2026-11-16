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
		'opposite',
		'kinds',
		'ownedAttributes',
		'ownedOperations',
		'ownedComments',
		'generalizations',
		'ownedLiterals',
		'redefinedProperties',
		'methods',
		'preconditions',
		'bodyCondition',
		'specification',
		'languages',
		'bodies',
		'body',
		'general',
		'defaultValue',
		'value',
		'instance',
		'isMultivalued',
		'allAttributes'
	],
	#category : 'OpenPonk-UML-BootstrapGenerator-Tests-Profile-Generator',
	#package : 'OpenPonk-UML-BootstrapGenerator-Tests',
	#tag : 'Profile-Generator'
}

{ #category : 'accessing' }
OPUMLProfileTestElement >> allAttributes [

	^ allAttributes
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> allAttributes: aCollection [

	allAttributes := aCollection
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> bodies [

	^ bodies ifNil: [ bodies := OrderedCollection new ]
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> bodies: aCollection [

	bodies := aCollection
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> body [

	^ body
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> body: aString [

	body := aString
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> bodyCondition [

	^ bodyCondition
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> bodyCondition: anElement [

	bodyCondition := anElement
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> defaultValue [

	^ defaultValue
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> defaultValue: anElement [

	defaultValue := anElement
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> general [

	^ general
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> general: anElement [

	general := anElement
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> generalizations [

	^ generalizations ifNil: [ generalizations := OrderedCollection new ]
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> generalizations: aCollection [

	generalizations := aCollection
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> implementationPackage [

	^ implementationPackage ifNil: [ 'Unclassified' ]
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> implementationPackage: aPackageName [

	implementationPackage := aPackageName
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> instance [

	^ instance
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> instance: anElement [

	instance := anElement
]

{ #category : 'testing' }
OPUMLProfileTestElement >> isMultivalued [

	^ isMultivalued ifNil: [ false ]
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> isMultivalued: aBoolean [

	isMultivalued := aBoolean
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
OPUMLProfileTestElement >> kinds [

	^ kinds ifNil: [ #(  ) ]
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> kinds: aCollection [

	kinds := aCollection
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> languages [

	^ languages ifNil: [ languages := OrderedCollection new ]
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> languages: aCollection [

	languages := aCollection
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> methods [

	^ methods ifNil: [ methods := OrderedCollection new ]
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> methods: aCollection [

	methods := aCollection
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

	^ kind = aClassifierSymbol or: [ self kinds includes: aClassifierSymbol ]
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
OPUMLProfileTestElement >> ownedAttributes [

	^ ownedAttributes ifNil: [ ownedAttributes := OrderedCollection new ]
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> ownedAttributes: aCollection [

	ownedAttributes := aCollection
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> ownedComments [

	^ ownedComments ifNil: [ ownedComments := OrderedCollection new ]
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> ownedComments: aCollection [

	ownedComments := aCollection
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
OPUMLProfileTestElement >> ownedLiterals [

	^ ownedLiterals ifNil: [ ownedLiterals := OrderedCollection new ]
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> ownedLiterals: aCollection [

	ownedLiterals := aCollection
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> ownedOperations [

	^ ownedOperations ifNil: [ ownedOperations := OrderedCollection new ]
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> ownedOperations: aCollection [

	ownedOperations := aCollection
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> packagedElements [

	^ packagedElements ifNil: [ packagedElements := OrderedCollection new ]
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> packagedElements: aCollection [

	packagedElements := aCollection
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> preconditions [

	^ preconditions ifNil: [ preconditions := OrderedCollection new ]
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> preconditions: aCollection [

	preconditions := aCollection
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> redefinedProperties [

	^ redefinedProperties ifNil: [ redefinedProperties := OrderedCollection new ]
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> redefinedProperties: aCollection [

	redefinedProperties := aCollection
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> specification [

	^ specification
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> specification: anElement [

	specification := anElement
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> type [

	^ type
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> type: anElement [

	type := anElement
]

{ #category : 'evaluating' }
OPUMLProfileTestElement >> value [

	^ value
]

{ #category : 'accessing' }
OPUMLProfileTestElement >> value: anObject [

	value := anObject
]

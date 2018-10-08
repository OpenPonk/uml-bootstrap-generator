"
I read XMI 2.x and create UML model representation from it.

Note that namespaces are not properly realized yet, so there may be some assumptions. (e.g. that org.omg.xmi.nsPrefix is always uml)
"
Class {
	#name : #OPUMLXMIBootstrapReader,
	#superclass : #Object,
	#instVars : [
		'classPrefix',
		'instanceCache'
	],
	#category : 'OP-UML-BootstrapGenerator-Reader'
}

{ #category : #'as yet unclassified' }
OPUMLXMIBootstrapReader class >> readUml [
	<script>
	| xmi reader model |
	xmi := OPUMLBootstrapGeneratorTest umlSpecs.
	reader := OPUMLXMIBootstrapReader new.
	reader classPrefix: 'BootUML'.
	model := reader readXmi: xmi.
	model inspect
]

{ #category : #accessing }
OPUMLXMIBootstrapReader >> classPrefix [
	^ classPrefix
]

{ #category : #accessing }
OPUMLXMIBootstrapReader >> classPrefix: anObject [
	classPrefix := anObject
]

{ #category : #'instance creation' }
OPUMLXMIBootstrapReader >> createNewInstanceFor: aClassName [
	^ (self classPrefix , (aClassName splitOn: ':') last) asSymbol asClass new
]

{ #category : #accessing }
OPUMLXMIBootstrapReader >> defaultClassPrefix [
	^ 'BootUML'
]

{ #category : #reading }
OPUMLXMIBootstrapReader >> groupedChildrenIn: anObjectElement [
	^ (anObjectElement containedItems reject: [ :each | each xmiName beginsWith: 'xmi:' ])
		groupedBy: #xmiName
]

{ #category : #initialization }
OPUMLXMIBootstrapReader >> initialize [
	super initialize.
	instanceCache := Dictionary new.
	classPrefix := self defaultClassPrefix
]

{ #category : #accessing }
OPUMLXMIBootstrapReader >> instanceFor: anObjectElement [
	^ instanceCache
		at: (self uniqueIdOf: anObjectElement)
		ifAbsentPut: [ self createNewInstanceFor: anObjectElement xmiType ]
]

{ #category : #testing }
OPUMLXMIBootstrapReader >> isCollectionAttribute: aSymbol inClass: aClass [
	"hacks for now, look at multiplicity later on"

	| className pairs selectors |
	className := aClass name withoutPrefix: self classPrefix.
	pairs := {#Comment -> #body.
	#Constraint -> #specification.
	#Operation -> #bodyCondition.
	#InstanceValue -> #instance.
	#PackageImport -> #importedPackage.
	#Generalization -> #general.
	#Generalization -> #specific}.
	selectors := #(name lowerValue upperValue type defaultValue).
	(pairs includes: className -> aSymbol)
		ifTrue: [ ^ false ].
	(selectors includes: aSymbol)
		ifTrue: [ ^ false ].
	(aSymbol = #value and: [ #(LiteralString LiteralInteger LiteralBoolean LiteralUnlimitedNatural LiteralReal) includes: className ])
		ifTrue: [ ^ false ].
	^ true
]

{ #category : #reading }
OPUMLXMIBootstrapReader >> readItem: anItem [
	| instance groups |
	anItem isValueItem
		ifTrue: [ ^ self valueFor: anItem value ].
	anItem isReferenceItem
		ifTrue: [ ^ anItem referencedElements collect: [ :each | self readItem: each ] ].
	instanceCache at: (self uniqueIdOf: anItem) ifPresent: [ :match | ^ match ].
	instance := self instanceFor: anItem.
	groups := self groupedChildrenIn: anItem.
	groups
		keysAndValuesDo: [ :key :values | 
			| selector arguments sg |
			selector := (key , ':') asSymbol.
			sg := (instance class selectors includes: selector)
				or: [ instance class superclass name = (self classPrefix , 'Element')
						and: [ instance class superclass selectors includes: selector ] ].
			self assert: [ sg ].
			arguments := values collect: [ :each | self readItem: each ].
			(arguments anyOne isArray or: [ arguments anyOne isKindOf: OrderedCollection ])
				ifTrue: [ arguments := arguments gather: #yourself ].
			(self isCollectionAttribute: key inClass: instance class)
				ifTrue: [ instance perform: selector with: arguments ]
				ifFalse: [ self assert: [ values size = 1 ].
					instance perform: selector with: arguments first ] ].
	^ instance
]

{ #category : #reading }
OPUMLXMIBootstrapReader >> readXmi: anXmi [
	^ anXmi containedItems
		select: [ :each | each isObjectElement and: [ each xmiType beginsWith: 'uml:' ] ]
		thenCollect: [ :each | self readItem: each ]
]

{ #category : #reading }
OPUMLXMIBootstrapReader >> uniqueIdOf: anObject [
	anObject xmiName = 'packageImport'
		ifTrue: [ ^ anObject xmiId , '-'
				, (anObject containedItems detect: [ :each | each xmiName = #importedPackage ]) referencedElement xmiId ].
	^ anObject xmiId
]

{ #category : #reading }
OPUMLXMIBootstrapReader >> valueFor: anObject [
	anObject = 'true'
		ifTrue: [ ^ true ].
	anObject = 'false'
		ifTrue: [ ^ false ].
	(NumberParser isNumber: anObject)
		ifTrue: [ ^ Number readFromString: anObject ].
	^ anObject
]

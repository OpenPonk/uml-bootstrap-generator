"
I generate the core necessary UML infrastructure to be able to properly represent XMI inside of the UML model.

So roughly it should be equivalent to to UML portions used in MOF.
"
Class {
	#name : #OPUMLBootstrapGenerator,
	#superclass : #Object,
	#instVars : [
		'classPrefix',
		'packageName',
		'rootClassName',
		'sourceXmi',
		'classes',
		'cachedRequiredClasses'
	],
	#classInstVars : [
		'umlSpecs'
	],
	#category : #'OP-UML-BootstrapGenerator-Bootstrap-Generator'
}

{ #category : #utility }
OPUMLBootstrapGenerator class >> umlSpecs [

	^ OPUMLBootstrapSpecs umlSpecs
]

{ #category : #retrieving }
OPUMLBootstrapGenerator >> allTransitiveSuperclassesOf: aName in: aCollectionOfPairs [
	| pairs keys layer |
	pairs := OrderedCollection new.
	keys := OrderedCollection with: aName.
	[ keys isNotEmpty ]
		whileTrue: [ layer := keys
				flatCollect: [ :each | aCollectionOfPairs select: [ :pair | pair key = each ] ].
			pairs := pairs , layer.
			keys := layer collect: #value ].
	pairs := pairs collect: [ :pair | pair value -> pair key ].
	^ ((pairs collect: #key) , (pairs collect: #value)) asSet sorted
]

{ #category : #selecting }
OPUMLBootstrapGenerator >> associationsIn: aPackageElement [
	^ aPackageElement containedItems
		select: [ :each | each xmiName = 'packagedElement' and: [ each xmiType = 'uml:Association' ] ]
]

{ #category : #selecting }
OPUMLBootstrapGenerator >> attributesIn: aClassElement [
	^ aClassElement containedItems select: [ :each | each xmiName = 'ownedAttribute' ]
]

{ #category : #changes }
OPUMLBootstrapGenerator >> changes [
	| changeSet |
	changeSet := CBChangeSet new.
	classes do: [ :each | changeSet addClass: each ].
	^ changeSet refactoringChanges
]

{ #category : #retrieving }
OPUMLBootstrapGenerator >> classNameFor: aString [
	^ (self classPrefix , aString) asSymbol
]

{ #category : #accessing }
OPUMLBootstrapGenerator >> classPrefix [
	^ classPrefix
]

{ #category : #accessing }
OPUMLBootstrapGenerator >> classPrefix: aString [
	classPrefix := aString
]

{ #category : #selecting }
OPUMLBootstrapGenerator >> classesIn: aPackageElement [
	^ aPackageElement containedItems
		select: [ :each | each xmiName = 'packagedElement' and: [ each xmiType = 'uml:Class' ] ]
]

{ #category : #selecting }
OPUMLBootstrapGenerator >> collectGeneralizationsInClass: aClassElement [
	^ (self generalizationsIn: aClassElement)
		collect:
			[ :each | aClassElement nameValue -> (each elementNamed: 'general') referencedElement nameValue ]
]

{ #category : #selecting }
OPUMLBootstrapGenerator >> collectGeneralizationsInPackage: aPackage [
	^ (self classesIn: aPackage)
		flatCollect: [ :each | self collectGeneralizationsInClass: each ]
]

{ #category : #selecting }
OPUMLBootstrapGenerator >> collectGeneralizationsInPackages: aCollectionOfPackages [
	^ aCollectionOfPackages
		flatCollect: [ :each | self collectGeneralizationsInPackage: each ]
]

{ #category : #generating }
OPUMLBootstrapGenerator >> createAccessorsFrom: anAttributeElement in: aClass [
	| name comment typeName |
	name := (anAttributeElement elementNamed: 'name') value.
	"class is a prohibited method name (it accesses the class-side)"
	name = 'class'
		ifTrue: [ name := 'owningClass' ].
	typeName := self typeOf: (anAttributeElement elementNamed: 'type').
	aClass addInstVarNamed: name.
	aClass addMethod: (CBMethod new getter: name).
	aClass addMethod: (CBMethod new setter: name argument: typeName)
]

{ #category : #generating }
OPUMLBootstrapGenerator >> createAssociationFrom: anAssociationElement [
	| oneEnd otherEnd oneClass otherClass oneClassName otherClassName |
	oneEnd := (anAssociationElement elementNamed: 'memberEnd') referencedElements first.
	otherEnd := (anAssociationElement elementNamed: 'memberEnd') referencedElements second.
	oneClassName := (otherEnd elementNamed: 'type') referencedElement nameValue.
	otherClassName := (oneEnd elementNamed: 'type') referencedElement nameValue.
	oneClass := classes at: oneClassName ifAbsent: [ ^ self ].
	otherClass := classes at: otherClassName ifAbsent: [ ^ self ].
	self createAccessorsFrom: oneEnd in: oneClass.
	self createAccessorsFrom: otherEnd in: otherClass
]

{ #category : #generating }
OPUMLBootstrapGenerator >> createClassFrom: anElement in: aTagName [
	| className cls |
	className := (anElement elementNamed: 'name') value.
	cls := self
		ensureCreateClass: className
		in: aTagName.
	^ cls
]

{ #category : #generating }
OPUMLBootstrapGenerator >> createDelegationMethods: aCollectionOfLayers for: aClassName [
	| cls supers |
	cls := classes at: aClassName ifAbsent: [ ^ self ].
	supers := (self withoutDuplicates: (aCollectionOfLayers gather: #yourself))
		collect: [ :each | classes at: each ifAbsent: [ nil ] ]
		thenReject: #isNil.
	supers
		do: [ :superClass | 
			superClass methods
				select: [ :method | method protocol = 'accessing' ]
				thenDo: [ :method | 
					| delegateMethod node |
					node := RBParser parseMethod: method source lines first.
					delegateMethod := node numArgs = 0
						ifTrue: [ CBMethod new
								getter: node selector
									delegateFrom: '(sharedGeneralizations at: #' , (superClass name withoutPrefix: self classPrefix) , ')';
								protocol: 'accessing - ' , (superClass name withoutPrefix: self classPrefix) ]
						ifFalse: [ CBMethod new
								setter: (node selector withoutSuffix: ':')
									argument: ((node argumentNames first withoutPrefix: 'a') withoutPrefix: 'n')
									delegateTo: '(sharedGeneralizations at: #' , (superClass name withoutPrefix: self classPrefix) , ')';
								protocol: 'accessing - ' , (superClass name withoutPrefix: self classPrefix) ].
					cls addMethod: delegateMethod ] ]
]

{ #category : #generating }
OPUMLBootstrapGenerator >> createSuperclasses: aCollectionOfLayers for: aClassName [
	| cls added sharedMethod directMethod |
	cls := classes at: aClassName ifAbsent: [ ^ self ].
	sharedMethod := CBMethodBuilder new.
	sharedMethod selector: 'initialize'.
	sharedMethod addLine: 'super initialize.'.
	added := Set new.
	aCollectionOfLayers
		do: [ :layer | 
			layer
				reject: [ :each | added includes: each ]
				thenDo: [ :each | 
					added add: each.
					sharedMethod
						addLine:
							('sharedGeneralizations at: #<1s> put: (<2s> newOnShared: sharedGeneralizations).'
								expandMacrosWith: each
								with: (self classNameFor: each)) ] ].
	sharedMethod addLine: 'self initializeGeneralizations.'.
	directMethod := CBMethodBuilder new.
	directMethod selector: 'initializeGeneralizations'.
	directMethod addLine: 'generalizations := {'.
	directMethod addIndent.
	aCollectionOfLayers
		ifNotEmpty: [ aCollectionOfLayers last
				do: [ :each | directMethod addLine: 'sharedGeneralizations at: #' , each , '.' ] ].
	directMethod removeIndent.
	directMethod addLine: '}'.
	cls compile: sharedMethod source classified: 'initialization'.
	cls compile: directMethod source classified: 'initialization'
]

{ #category : #generating }
OPUMLBootstrapGenerator >> createTargetPackage [
	(RPackage organizer includesPackageNamed: self packageName)
		ifFalse: [ RPackage organizer createPackageNamed: self packageName ]
]

{ #category : #generating }
OPUMLBootstrapGenerator >> ensureCreateClass: aName in: aTagName [
	^ classes
		at: aName
		ifAbsentPut: [ CBClass
				name: (self classNameFor: aName)
				parent: self rootClassName
				package: self packageName , '-' , aTagName ]
]

{ #category : #selecting }
OPUMLBootstrapGenerator >> generalizationsIn: aClassElement [
	^ aClassElement containedItems select: [ :each | each xmiName = 'generalization' ]
]

{ #category : #generating }
OPUMLBootstrapGenerator >> generateAll [
	classes := Dictionary new.
	self createTargetPackage.
	self generatedPackages do: [ :each | self generateClassesInPackage: each ].
	self generatedPackages do: [ :each | self generateAssociationsInPackage: each ].
	self
		generateGeneralizations: (self collectGeneralizationsInPackages: self generatedPackages).
	^ self changes
]

{ #category : #generating }
OPUMLBootstrapGenerator >> generateAssociationsInPackage: aPackageElement [
	(self associationsIn: aPackageElement) do: [ :each | self createAssociationFrom: each ]
]

{ #category : #generating }
OPUMLBootstrapGenerator >> generateClassesInPackage: aPackageElement [
	self packageName asPackage addClassTag: aPackageElement nameValue.
	(self classesIn: aPackageElement)
		select: [ :clsElement | self requiredClasses includes: clsElement nameValue ]
		thenDo: [ :clsElement | 
			| cls |
			cls := self createClassFrom: clsElement in: aPackageElement nameValue.
			(self attributesIn: clsElement)
				do: [ :attribElement | self createAccessorsFrom: attribElement in: cls ] ]
]

{ #category : #generating }
OPUMLBootstrapGenerator >> generateGeneralizations: aCollectionOfPairs [
	| keys |
	keys := self withoutDuplicates: ((aCollectionOfPairs collect: #key) , (aCollectionOfPairs collect: #value)).
	keys
		do: [ :each | 
			self
				createSuperclasses: (self layeredSuperclassesFor: each in: aCollectionOfPairs)
				for: each.
			self
				createDelegationMethods: (self layeredSuperclassesFor: each in: aCollectionOfPairs)
				for: each ]
]

{ #category : #selecting }
OPUMLBootstrapGenerator >> generatedPackages [
	^ self packagesIn: sourceXmi
]

{ #category : #initialization }
OPUMLBootstrapGenerator >> initialize [
	super initialize.
	classPrefix := 'OPUML'.
	packageName := 'OP-UML'.
	rootClassName := 'OPUMLBootstrapObject'.
	classes := Dictionary new
]

{ #category : #selecting }
OPUMLBootstrapGenerator >> layeredSuperclassesFor: aKey in: aCollection [
	| pairs keys layer |
	pairs := OrderedCollection new.
	keys := OrderedCollection with: aKey.
	[ keys isNotEmpty ]
		whileTrue: [ layer := keys flatCollect: [ :each | aCollection select: [ :pair | pair key = each ] ].
			keys := layer collect: #value.
			pairs add: (self withoutDuplicates: keys) ].
	^ (pairs reject: #isEmpty) reverse
]

{ #category : #accessing }
OPUMLBootstrapGenerator >> packageName [
	^ packageName
]

{ #category : #accessing }
OPUMLBootstrapGenerator >> packageName: aString [
	packageName := aString
]

{ #category : #selecting }
OPUMLBootstrapGenerator >> packagesIn: anXmi [
	^ (anXmi elementNamed: 'Package') containedItems
		select: [ :each | each xmiName = 'packagedElement' and: [ each xmiType = 'uml:Package' ] ]
]

{ #category : #accessing }
OPUMLBootstrapGenerator >> requiredClasses [
	"all required classes and all their combined superclasses"

	| generalizations |
	^ cachedRequiredClasses
		ifNil: [ generalizations := self collectGeneralizationsInPackages: self generatedPackages.
			cachedRequiredClasses := (self requiredRealClasses
				flatCollect: [ :each | self allTransitiveSuperclassesOf: each in: generalizations ])
				asSet sorted ]
]

{ #category : #accessing }
OPUMLBootstrapGenerator >> requiredRealClasses [
	"An EMOF metamodel is restricted to use the following concrete metaclasses from UML’s Kernel
	(see MOF2.5. specs)
	
	Also see class-side
	"

	^ #(Association Class Comment Constraint Enumeration EnumerationLiteral Generalization InstanceValue LiteralBoolean LiteralInteger LiteralUnlimitedNatural OpaqueExpression Operation Package PackageImport Parameter PrimitiveType Property)
	"	^ #(Association Class Comment DataType Enumeration EnumerationLiteral Generalization InstanceSpecification InstanceValue LiteralBoolean LiteralInteger LiteralNull LiteralReal LiteralString LiteralUnlimitedNatural Operation Package Parameter PrimitiveType Property Slot)"
]

{ #category : #accessing }
OPUMLBootstrapGenerator >> rootClassName [
	^ rootClassName
]

{ #category : #accessing }
OPUMLBootstrapGenerator >> rootClassName: aString [
	rootClassName := aString
]

{ #category : #accessing }
OPUMLBootstrapGenerator >> sourceXmi [
	^ sourceXmi
]

{ #category : #accessing }
OPUMLBootstrapGenerator >> sourceXmi: anXmi [
	sourceXmi := anXmi
]

{ #category : #retrieving }
OPUMLBootstrapGenerator >> typeOf: anElement [
	anElement isObjectElement
		ifTrue: [ anElement xmiType = 'uml:PrimitiveType'
				ifTrue: [ ^ ((anElement elementNamed: 'href') value splitOn: '#') last ] ].
	anElement isReferenceItem
		ifTrue: [ ^ anElement referencedElement nameValue ].
	self error: 'Unexpected Type'
]

{ #category : #utility }
OPUMLBootstrapGenerator >> withoutDuplicates: aCollection [
	| dict |
	dict := OrderedDictionary new.
	aCollection do: [ :each | dict at: each put: true ].
	^ dict keys
]

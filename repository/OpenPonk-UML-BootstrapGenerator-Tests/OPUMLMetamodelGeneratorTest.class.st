"
I am a unit test class verifying the complete generation pipeline of OPUMLMetamodelGenerator, including the accurate construction of operations, handling of multiplicities, application of default values, and generation of multiple-inheritance delegation methods.
"
Class {
	#name : 'OPUMLMetamodelGeneratorTest',
	#superclass : 'TestCase',
	#instVars : [
		'generator',
		'preexistingPackages'
	],
	#category : 'OpenPonk-UML-BootstrapGenerator-Tests-Metamodel-Generator',
	#package : 'OpenPonk-UML-BootstrapGenerator-Tests',
	#tag : 'Metamodel-Generator'
}

{ #category : 'accessing' }
OPUMLMetamodelGeneratorTest class >> umlBootstrapModel [

	<script: 'self umlBootstrapModel inspect'>
	^ OPUMLMetamodelGenerator umlBootstrapModel
]

{ #category : 'asserting' }
OPUMLMetamodelGeneratorTest >> assertMethod: actualCode equals: expectedCode [
	self
		assert: (OCParser parseMethod: actualCode) formattedCode withUnixLineEndings
		equals: (OCParser parseMethod: expectedCode) formattedCode withUnixLineEndings
]

{ #category : 'accessing' }
OPUMLMetamodelGeneratorTest >> attribute: anAttributeName inClass: aClassName [
	^ (self findClass: aClassName) ownedAttribute
		detect: [ :each | each name = anAttributeName ]
]

{ #category : 'accessing' }
OPUMLMetamodelGeneratorTest >> findClass: aName [
	^ (self model packagedElement flatCollect: #packagedElement)
		detect: [ :each | each name = aName ]
]

{ #category : 'accessing' }
OPUMLMetamodelGeneratorTest >> findElement: aName [
	^ (self model packagedElement flatCollect: #packagedElement)
		detect: [ :each | each name = aName ]
]

{ #category : 'accessing' }
OPUMLMetamodelGeneratorTest >> model [
	^ self class umlBootstrapModel
]

{ #category : 'accessing' }
OPUMLMetamodelGeneratorTest >> operation: anOperationName inClass: aClassName [
	^ (self findClass: aClassName) ownedOperation
		detect: [ :each | each name = anOperationName ]
]

{ #category : 'running' }
OPUMLMetamodelGeneratorTest >> setUp [

	super setUp.
	preexistingPackages := #( 'Generated-UMLMetamodelTest' 'TestGenerated123' ) select: [ :each |
		                       self packageOrganizer hasPackage: each ].
	generator := OPUMLMetamodelGenerator new.
	generator sourceModel: self model.
	generator classPrefix: 'MBUT'.
	generator packageName: 'Generated-UMLMetamodelTest'
]

{ #category : 'running' }
OPUMLMetamodelGeneratorTest >> tearDown [

	| existing |
	existing := preexistingPackages ifNil: [ #(  ) ].
	#( 'Generated-UMLMetamodelTest' 'TestGenerated123' ) do: [ :each |
			(existing includes: each) ifFalse: [
					self packageOrganizer
						packageNamed: each
						ifPresent: [ :package | package isEmpty ifTrue: [ self packageOrganizer removePackage: package ] ] ] ].
	super tearDown
]

{ #category : 'tests - generating - generalizations' }
OPUMLMetamodelGeneratorTest >> testAddAccessingDelegationMethods [

	| class classModel methods |
	class := CBClass new.
	classModel := self findClass: 'RedefinableElement'.
	generator createClassFrom: (self findClass: 'Element') in: 'CommonStructure'.
	generator createClassFrom: (self findClass: 'NamedElement') in: 'CommonStructure'.
	generator addDelegationMethodsFrom: classModel to: class.
	methods := class methods collect: [ :each | each selector -> each protocolName ].
	self assertCollection: methods includesAll: { ('nameExpression' -> 'accessing - NamedElement') }.
	self assertMethod: (class methods detect: [ :each | each selector = 'nameExpression' ]) source equals: 'nameExpression
	^ (sharedGeneralizations at: #NamedElement) nameExpression'.
	self assertCollection: methods includesAll: { ('nameExpression:' -> 'accessing - NamedElement') }.
	self
		assertMethod: (class methods detect: [ :each | each selector = 'nameExpression:' ]) source
		equals: 'nameExpression: aStringExpression
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression'
]

{ #category : 'tests - generating - attributes' }
OPUMLMetamodelGeneratorTest >> testAddAttributeManyToMany [
	| class attribute |
	class := CBClass new.
	attribute := self attribute: 'generalization' inClass: 'GeneralizationSet'.
	generator addAttribute: attribute to: class.
	self assert: class instanceVariables equals: #(generalizations).
	self assert: class selectors equals: #(generalizations generalizations:).
	self
		assertMethod: class methods first source
		equals:
			'generalizations
	"Designates the instances of Generalization that are members of this GeneralizationSet."
	^ generalizations ifNil: [ generalizations := OPUMLManyToManyLinks on: self identity opposite: #generalizationSets ]'.
	self
		assertMethod: class methods second source
		equals:
			'generalizations: aGeneralization
	"Designates the instances of Generalization that are members of this GeneralizationSet."
	self generalizations removeAll; addAll: aGeneralization'
]

{ #category : 'tests - generating - attributes' }
OPUMLMetamodelGeneratorTest >> testAddAttributeManyToNone [
	| class attribute |
	class := CBClass new.
	attribute := self attribute: 'ownedComment' inClass: 'Element'.
	generator addAttribute: attribute to: class.
	self assert: class instanceVariables equals: #(ownedComments).
	self assert: class selectors equals: #(ownedComments ownedComments:).
	self assertMethod: class methods first source equals: 'ownedComments
	"The Comments owned by this Element."
	^ ownedComments ifNil: [ ownedComments := OrderedCollection new ]'.
self assertMethod: class methods second source equals: 'ownedComments: aComment
	"The Comments owned by this Element."
	ownedComments := aComment'
]

{ #category : 'tests - generating - attributes' }
OPUMLMetamodelGeneratorTest >> testAddAttributeManyToOne [
	| class attribute |
	class := CBClass new.
	attribute := self attribute: 'datatype' inClass: 'Property'.
	generator addAttribute: attribute to: class.
	self assert: class instanceVariables equals: #(datatype).
	self assert: class selectors equals: #(datatype datatype:).
	self
		assertMethod: class methods first source
		equals:
			'datatype
	"The DataType that owns this Property, if any."
	^ datatype'.
	self
		assertMethod: class methods second source
		equals:
			'datatype: aDataType
	"The DataType that owns this Property, if any."
	datatype := OPUMLToOneLink on: self identity update: #ownedAttributes from: datatype to: aDataType'
]

{ #category : 'tests - generating - attributes' }
OPUMLMetamodelGeneratorTest >> testAddAttributeNamedClass [
	| class attribute |
	class := CBClass new.
	attribute := self attribute: 'class' inClass: 'Property'.
	self assert: attribute name equals: 'class'.
	generator addAttribute: attribute to: class.
	self assert: class instanceVariables equals: #(owningClass).
	self assert: class selectors equals: #(owningClass owningClass:)
]

{ #category : 'tests - generating - attributes' }
OPUMLMetamodelGeneratorTest >> testAddAttributeOneToMany [
	| class attribute |
	class := CBClass new.
	attribute := self attribute: 'ownedAttribute' inClass: 'DataType'.
	generator addAttribute: attribute to: class.
	self assert: class instanceVariables equals: #(ownedAttributes).
	self assert: class selectors equals: #(ownedAttributes ownedAttributes:).
	self
		assertMethod: class methods first source
		equals:
			'ownedAttributes
	"The attributes owned by the DataType."
	^ ownedAttributes ifNil: [ ownedAttributes := OPUMLToManyLinks on: self identity opposite: #datatype: ]'.
	self
		assertMethod: class methods second source
		equals:
			'ownedAttributes: aProperty
	"The attributes owned by the DataType."
	self ownedAttributes removeAll; addAll: aProperty'
]

{ #category : 'tests - generating - attributes' }
OPUMLMetamodelGeneratorTest >> testAddAttributeOneToNone [
	| class attribute |
	class := CBClass new.
	attribute := self attribute: 'instance' inClass: 'InstanceValue'.
	generator addAttribute: attribute to: class.
	self assert: class instanceVariables equals: #(instance).
	self assert: class selectors equals: #(instance instance:).
	self assertMethod: class methods first source equals: 'instance
	"The InstanceSpecification that represents the specified value."
	^ instance'.
self assertMethod: class methods second source equals: 'instance: anInstanceSpecification
	"The InstanceSpecification that represents the specified value."
	instance := anInstanceSpecification'
]

{ #category : 'tests - generating - attributes' }
OPUMLMetamodelGeneratorTest >> testAddAttributeOneToOne [
	| class attribute |
	class := CBClass new.
	attribute := self attribute: 'parameteredElement' inClass: 'TemplateParameter'.
	generator addAttribute: attribute to: class.
	self assert: class instanceVariables equals: #(parameteredElement).
	self assert: class selectors equals: #(parameteredElement parameteredElement:).
	self
		assertMethod: class methods first source
		equals:
			'parameteredElement
	"The ParameterableElement exposed by this TemplateParameter."
	^ parameteredElement'.
	self
		assertMethod: class methods second source
		equals:
			'parameteredElement: aParameterableElement
	"The ParameterableElement exposed by this TemplateParameter."
	|anOldParameteredElement|
	anOldParameteredElement := parameteredElement.
	parameteredElement := aParameterableElement.
	OPUMLToOneLink on: self identity thisSelector: #parameteredElement otherSelector: #templateParameter updateFrom: anOldParameteredElement to: parameteredElement'
]

{ #category : 'tests - generating - attributes' }
OPUMLMetamodelGeneratorTest >> testAddAttributeWithDefaultDefaultValue [
	| class attribute |
	class := CBClass new.
	attribute := self attribute: 'isReadOnly' inClass: 'Activity'.
	generator addAttribute: attribute to: class.
	self assertMethod: (class methodNamed: #isReadOnly) source equals: 'isReadOnly
"If true, this Activity must not make any changes to objects. The default is false (an Activity may make nonlocal changes). (This is an assertion, not an executable property. It may be used by an execution engine to optimize model execution. If the assertion is violated by the Activity, then the model is ill-formed.) "

	^ isReadOnly ifNil: [ isReadOnly := false ]'
]

{ #category : 'tests - generating - attributes' }
OPUMLMetamodelGeneratorTest >> testAddAttributeWithDefaultValue [
	| class attribute |
	class := CBClass new.
	attribute := self attribute: 'value' inClass: 'LiteralInteger'.
	generator addAttribute: attribute to: class.
	self assertMethod: (class methodNamed: #value) source equals: 'value
	"The specified Integer value."
	^ value ifNil: [ value := 0 ]'
]

{ #category : 'tests - generating - attributes' }
OPUMLMetamodelGeneratorTest >> testAddAttributeWithEnumDefaultValue [
	| class attribute |
	class := CBClass new.
	attribute := self attribute: 'direction' inClass: 'Parameter'.
	generator addAttribute: attribute to: class.
	self assertMethod: (class methodNamed: #direction) source equals: 'direction
	"Indicates whether a parameter is being sent into or out of a behavioral element."

	^ direction ifNil: [ direction := MBUTParameterDirectionKind new in ]'
]

{ #category : 'tests - generating - classes' }
OPUMLMetamodelGeneratorTest >> testAddComment [

	| class |
	class := CBClass new.
	self assert: class comment identicalTo: nil.
	generator addCommentFrom: (self findClass: 'Element') to: class.
	self
		assert: class comment
		equals: 'An Element is a constituent of a model. As such, it has the capability of owning other Elements.'
]

{ #category : 'tests' }
OPUMLMetamodelGeneratorTest >> testAddEnumLiteral [

	| class enumModel literal |
	class := CBClass new.
	class name: 'AggregationKind'.
	enumModel := self findElement: 'AggregationKind'.
	literal := enumModel ownedLiteral detect: [ :each | each name = 'composite' ].
	generator addEnumLiteral: literal to: class.
	self assert: class selectors equals: #( composite ).
	self assert: class methods first protocolName equals: 'accessing'.
	self assertMethod: class methods first source equals: 'composite
		"Indicates that the Property is aggregated compositely, i.e., the composite object has responsibility for the existence and storage of the composed objects (parts)."
		^ #composite'.
	self denyEmpty: class metaMethods.
	self assert: class metaMethods first protocolName equals: 'accessing - enum'.
	self assertMethod: class metaMethods first source equals: 'composite
		"Indicates that the Property is aggregated compositely, i.e., the composite object has responsibility for the existence and storage of the composed objects (parts)."
		^ #composite'
]

{ #category : 'tests - generating - literals' }
OPUMLMetamodelGeneratorTest >> testAddEnumLiteralNotPackage [

	| class enumModel literal |
	class := CBClass new.
	class name: 'VisibilityKind'.
	enumModel := self findElement: 'VisibilityKind'.
	literal := enumModel ownedLiteral detect: [ :each | each name = 'package' ].
	generator addEnumLiteral: literal to: class.
	self assert: class selectors equals: #( package ).
	self assertEmpty: class metaMethods
]

{ #category : 'tests - generating - generalizations' }
OPUMLMetamodelGeneratorTest >> testAddGeneralizations [
	| class classModel |
	class := CBClass new.
	classModel := self findClass: 'RedefinableElement'.
	generator addGeneralizationsFrom: classModel to: class.
	self
		assert: class selectors
		equals: #(initializeSharedGeneralizations initializeDirectGeneralizations).
	self
		assertMethod: (class methodNamed: #initializeSharedGeneralizations) source
		equals:
			'initializeSharedGeneralizations
	sharedGeneralizations at: #NamedElement put: (MBUTNamedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #RedefinableElement put: self'.
	self
		assertMethod: (class methodNamed: #initializeDirectGeneralizations) source
		equals:
			'initializeDirectGeneralizations
	directGeneralizations := {
		sharedGeneralizations at: #NamedElement.
	}'
]

{ #category : 'tests - generating - generalizations' }
OPUMLMetamodelGeneratorTest >> testAddNoDirectGeneralizations [
	| class classModel |
	class := CBClass new.
	classModel := self findClass: 'NamedElement'.
	generator addGeneralizationsFrom: classModel to: class.
	self
		assert: class selectors
		equals: #(initializeSharedGeneralizations initializeDirectGeneralizations).
	self
		assertMethod: (class methodNamed: #initializeSharedGeneralizations) source
		equals:
			'initializeSharedGeneralizations
	sharedGeneralizations at: #NamedElement put: self
'.
	self
		assertMethod: (class methodNamed: #initializeDirectGeneralizations) source
		equals:
			'initializeDirectGeneralizations
	directGeneralizations := {
	}'
]

{ #category : 'tests - generating - operations' }
OPUMLMetamodelGeneratorTest >> testAddOperationWithMethod [

	| class operation realMethod stubMethod |
	class := CBClass new.
	operation := self operation: 'isNull' inClass: 'ValueSpecification'.
	operation method: (OPUMLMetamodelGeneratorValuesTemplates new
			 methodsFor: operation
			 inClassNamed: 'ValueSpecification').
	generator addOperation: operation to: class.
	realMethod := class methodNamed: 'isNull'.
	stubMethod := class methodNamed: 'isNullStub'.
	self assert: realMethod protocolName equals: 'operations'.
	self assertMethod: realMethod source equals: 'isNull
	"The query isNull() returns true when it can be computed that the value is null."
	
	"{OCL} result = (false)"
	
	^ false'.
	self assert: stubMethod protocolName equals: 'operations - stubs'.
	self assertMethod: stubMethod source equals: 'isNullStub
	"The query isNull() returns true when it can be computed that the value is null."
	
	"{OCL} result = (false)"
	
	self notYetImplemented
'
]

{ #category : 'tests - generating - operations' }
OPUMLMetamodelGeneratorTest >> testAddOperationWithOCL [

	| class operation |
	class := CBClass new.
	operation := self
		             operation: 'lowerBound'
		             inClass: 'MultiplicityElement'.
	generator addOperation: operation to: class.
	self
		assert: (class methodNamed: 'lowerBoundStub') protocolName
		equals: 'operations - stubs'.
	self
		assertMethod: (class methodNamed: 'lowerBoundStub') source
		equals: 'lowerBoundStub
	"The query lowerBound() returns the lower bound of the multiplicity as an integer, which is the integerValue of lowerValue, if this is given, and 1 otherwise."
	
	"{OCL} result = (if (lowerValue=null or lowerValue.integerValue()=null) then 1 else lowerValue.integerValue() endif)"
	
	self notYetImplemented'
]

{ #category : 'tests - generating - operations' }
OPUMLMetamodelGeneratorTest >> testAddOperationWithPreConditions [
	| class operation |
	class := CBClass new.
	operation := self operation: 'isMultivalued' inClass: 'MultiplicityElement'.
	generator addOperation: operation to: class.
	self assertMethod: (class methodNamed: 'isMultivaluedStub') source equals: 'isMultivaluedStub
	"The query isMultivalued() checks whether this multiplicity has an upper bound greater than one."
	
	"pre: {OCL} upperBound()->notEmpty()"
	
	"{OCL} result = (upperBound() > 1)"
	
	self notYetImplemented'
]

{ #category : 'tests - generating - operations' }
OPUMLMetamodelGeneratorTest >> testAddOperationWithoutBody [
	| class operation |
	class := CBClass new.
	operation := self operation: 'behavioredClassifier' inClass: 'Behavior'.
	generator addOperation: operation to: class.
	self
		assertMethod: (class methodNamed: 'behavioredClassifierStub') source
		equals:
			'behavioredClassifierStub
	"The first BehavioredClassifier reached by following the chain of owner relationships from the Behavior, if any."
	
	"spec: {OCL} if from.oclIsKindOf(BehavioredClassifier) then
    from.oclAsType(BehavioredClassifier)
else if from.owner = null then
    null
else
    self.behavioredClassifier(from.owner)
endif
endif
    "
	
	self notYetImplemented'
]

{ #category : 'tests - generating - operations' }
OPUMLMetamodelGeneratorTest >> testAddOperationWithoutMethod [

	| class operation |
	class := CBClass new.
	operation := self operation: 'isNull' inClass: 'ValueSpecification'.
	generator addOperation: operation to: class.
	self
		assert: (class methodNamed: 'isNullStub') protocolName
		equals: 'operations - stubs'.
	self
		assertMethod: (class methodNamed: 'isNullStub') source
		equals: 'isNullStub
	"The query isNull() returns true when it can be computed that the value is null."
	
	"{OCL} result = (false)"

	self notYetImplemented'
]

{ #category : 'tests - generating - generalizations' }
OPUMLMetamodelGeneratorTest >> testAddOperationsDelegationMethods [

	| class classModel methods |
	class := CBClass new.
	classModel := self findClass: 'LiteralSpecification'.
	generator loadTemplateMethods.
	generator createClassFrom: (self findClass: 'NamedElement') in: 'Anywhere'.
	generator createClassFrom: (self findClass: 'ParameterableElement') in: 'Anywhere'.
	generator createClassFrom: (self findClass: 'TypedElement') in: 'Anywhere'.
	generator createClassFrom: (self findClass: 'PackageableElement') in: 'Anywhere'.
	generator createClassFrom: (self findClass: 'ValueSpecification') in: 'Anywhere'.
	generator addDelegationMethodsFrom: classModel to: class.
	methods := class methods collect: [ :each | each selector -> each protocolName ].
	self assertCollection: methods includesAll: { ('stringValue' -> 'operations - ValueSpecification') }.
	self assertMethod: (class methodNamed: #stringValue) source equals: 'stringValue
	^ (sharedGeneralizations at: #ValueSpecification) stringValue'
]

{ #category : 'tests - retrieving' }
OPUMLMetamodelGeneratorTest >> testAllSuperclasses [
	| class |
	class := self findClass: 'StructuralFeature'.
	self
		assert: ((generator allSuperclassesOf: class) collect: #name)
		equals: #(NamedElement RedefinableElement MultiplicityElement TypedElement Feature)
]

{ #category : 'testing - test meta' }
OPUMLMetamodelGeneratorTest >> testAttributeInClass [

	| attribute |
	attribute := self attribute: 'ownedComment' inClass: 'Element'.
	self assert: attribute class identicalTo: BootUMLProperty.
	self assert: attribute name equals: 'ownedComment'
]

{ #category : 'tests - testing' }
OPUMLMetamodelGeneratorTest >> testAttributeName [
	self
		assert: (generator attributeNameFor: (self attribute: 'owner' inClass: 'Element'))
		equals: 'owner'.
	self
		assert: (generator attributeNameFor: (self attribute: 'class' inClass: 'Property'))
		equals: 'owningClass'.
	self
		assert: (generator attributeNameFor: (self attribute: 'ownedComment' inClass: 'Element'))
		equals: 'ownedComments'
]

{ #category : 'tests - retrieving' }
OPUMLMetamodelGeneratorTest >> testClassNameFor [
	self assert: (generator classNameFor: 'Hello') equals: 'MBUTHello'
]

{ #category : 'tests - retrieving' }
OPUMLMetamodelGeneratorTest >> testClassesAccessors [

	| customClasses |
	customClasses := Dictionary with: 'Example' -> (CBClass new
			                  name: 'MBUTExample';
			                  yourself).
	generator classes: customClasses.
	self assert: generator classes identicalTo: customClasses
]

{ #category : 'tests - retrieving' }
OPUMLMetamodelGeneratorTest >> testCommentIn [
	self
		assert: (generator commentIn: (self operation: 'lowerBound' inClass: 'MultiplicityElement'))
		equals:
			'The query lowerBound() returns the lower bound of the multiplicity as an integer, which is the integerValue of lowerValue, if this is given, and 1 otherwise.'
]

{ #category : 'tests - generating - classes' }
OPUMLMetamodelGeneratorTest >> testCreateClass [
	| classModel class |
	classModel := BootUMLClass new name: 'Simple'.
	class := generator createClassFrom: classModel in: 'Tag'.
	self assert: class name equals: 'MBUTSimple'
]

{ #category : 'tests - meta' }
OPUMLMetamodelGeneratorTest >> testCreateElementMeta [
	| cls elCls |
	cls := generator createElementMeta.
	elCls := generator createClassFrom: (self findClass: 'Element') in: 'CommonStructure'.
	self assert: cls name equals: 'MBUTMetaElement'.
	self assert: cls parent equals: 'Object'.
	self assert: elCls name equals: 'MBUTElement'.
	self assert: elCls parent equals: 'MBUTMetaElement'
]

{ #category : 'tests - meta' }
OPUMLMetamodelGeneratorTest >> testCreateElementMetaAttributes [
	| cls |
	cls := generator createElementMeta.
	self
		assert: cls instanceVariables sorted
		equals: #(directGeneralizations sharedGeneralizations tags uuid)
]

{ #category : 'tests - meta' }
OPUMLMetamodelGeneratorTest >> testCreateElementMetaClassMethods [
	| cls method |
	cls := generator createElementMeta.
	self
		assert: (cls metaMethods collect: #selector) sorted
		equals: #(newOnShared:) sorted.
	method := cls metaMethods detect: [ :each | each selector = #newOnShared: ].
	self assert: method protocolName equals: 'instance creation'.
	self
		assertMethod: method source
		equals:
			'newOnShared: aDictionary
	^ self basicNew
		initializeWithShared: aDictionary;
		yourself'
]

{ #category : 'tests - meta' }
OPUMLMetamodelGeneratorTest >> testCreateElementMetaComment [

	| cls |
	cls := generator createElementMeta.
	self
		assert: cls comment
		equals:
		'I am a metaclass for UML classes implementing some behavior for managing the classes and other stuff (like an announcer).'
]

{ #category : 'tests - meta' }
OPUMLMetamodelGeneratorTest >> testCreateElementMetaInitialize [
	| cls |
	cls := generator createElementMeta.
	self
		assertMethod: (cls methodNamed: #initialize) source
		equals:
			'initialize
	super initialize.
	sharedGeneralizations := OrderedDictionary new.
	tags := OrderedDictionary new.
	self initializeSharedGeneralizations.
	self initializeDirectGeneralizations'
]

{ #category : 'tests' }
OPUMLMetamodelGeneratorTest >> testCreateElementMetaInstanceMethods [

	| cls |
	cls := generator createElementMeta.
	self
		assertCollection: (cls methods collect: #selector)
		hasSameElements: #( #appliedStereotypes #applyStereotype: #hasTagAt: #identity #initialize #initializeDirectGeneralizations
			   #initializeSharedGeneralizations #initializeWithShared: #inspectionGeneralizations: #inspectionAllProperties:
			   #inspectionProperties: #inspectionStereotypes: #inspectionStereotypeProperties: #inspectionTags: #inspectorProperties
			   #inspectorPropertiesSelectors #isBidirectionalToOneSlotNamed: #metaElementClass #nonEmptyinspectorProperties
			   #oclAsType: #oclClassifierNameFrom: #oclIsKindOf: #oclIsTypeOf: #postCopy #postCopyResetSliceSlots #postCopySliceWithShared:
			   #postCopySlotValue:forSlotNamed: #printAsClassifierNameOn: #printOn: #removeTagAt: #setExtensionFor:to: #stereotypeProperties
			   #tagAt: #tagAt:ifAbsent: #tagAt:put: #tags #umlClassName #umlClassPrefix #umlMetaClass #unapplyStereotype:
			   #uuid #uuid: ).
	self assert: (cls methodNamed: #initialize) protocolName equals: 'initialization'
]

{ #category : 'tests - meta' }
OPUMLMetamodelGeneratorTest >> testCreateElementMetaUsesConfiguredClassPrefix [

	| cls metaClassMethod prefixMethod oclMethod postCopySlotMethod toOneMethod |
	cls := generator createElementMeta.
	metaClassMethod := cls methodNamed: #metaElementClass.
	prefixMethod := cls methodNamed: #umlClassPrefix.
	oclMethod := cls methodNamed: #oclClassifierNameFrom:.
	postCopySlotMethod := cls methodNamed: #postCopySlotValue:forSlotNamed:.
	toOneMethod := cls methodNamed: #isBidirectionalToOneSlotNamed:.
	self assertMethod: metaClassMethod source equals: 'metaElementClass
	^ MBUTMetaElement'.
	self assertMethod: prefixMethod source equals: 'umlClassPrefix
	^ ''MBUT'''.
	self
		deny: (oclMethod source includesSubstring: 'Smalltalk globals')
		description: 'Generated oclClassifierNameFrom: must not use Smalltalk globals dynamic lookup'.
	self
		deny: (oclMethod source includesSubstring: '''OPUML''')
		description: 'Generated oclClassifierNameFrom: must not hardcode OPUML prefix'.
	self
		assert: (postCopySlotMethod source includesSubstring: 'OPUMLToManyLinks')
		description: 'Generated postCopySlotValue:forSlotNamed: must detach OPUMLToManyLinks slots'.
	self
		assert: (toOneMethod source includesSubstring: 'OPUMLToOneLink')
		description: 'Generated isBidirectionalToOneSlotNamed: must detect OPUMLToOneLink setters'
]

{ #category : 'tests - generating - enums' }
OPUMLMetamodelGeneratorTest >> testCreateEnum [
	| enumModel class |
	enumModel := BootUMLEnumeration new name: 'SimpleEnum'.
	class := generator createEnumFrom: enumModel in: 'Tag'.
	self assert: class name equals: 'MBUTSimpleEnum'.
	self assert: class parent equals: 'MBUTEnumeration'
]

{ #category : 'tests - generating - enums' }
OPUMLMetamodelGeneratorTest >> testCreateEnumWithLiterals [
	| enumModel class |
	enumModel := self findElement: 'AggregationKind'.
	class := generator createEnumFrom: enumModel in: 'Tag'.
	self assert: class selectors sorted equals: #(composite none shared)
]

{ #category : 'tests - generating - packages' }
OPUMLMetamodelGeneratorTest >> testCreateTargetPackage [

	generator packageName: 'TestGenerated123'.
	generator createTargetPackage.
	self
		assert: (self packageOrganizer hasPackage: 'TestGenerated123')
		description: 'createTargetPackage must register target package in PackageOrganizer'
]

{ #category : 'tests - retrieving' }
OPUMLMetamodelGeneratorTest >> testDefaultDefaultValue [

	| attribute |
	attribute := self attribute: 'isReadOnly' inClass: 'Activity'.
	self
		deny: (generator defaultValueFrom: attribute defaultValue)
		description: 'Default value of Activity>>isReadOnly must evaluate to false'
]

{ #category : 'tests - retrieving' }
OPUMLMetamodelGeneratorTest >> testDefaultValue [
	| attribute |
	attribute := self attribute: 'value' inClass: 'LiteralInteger'.
	self assert: (generator defaultValueFrom: attribute defaultValue) equals: 0
]

{ #category : 'tests - retrieving' }
OPUMLMetamodelGeneratorTest >> testDefaultValueFromUnknownLiteral [

	self assert: (generator defaultValueFrom: Association new) equals: nil
]

{ #category : 'tests - retrieving' }
OPUMLMetamodelGeneratorTest >> testDefaultValues [

	| result |
	result := generator defaultValues.
	self assertCollection: result includesAll: { ('LiteralBoolean' -> false) }.
	self assertCollection: result includesAll: { ('LiteralNull' -> nil) }
]

{ #category : 'tests - generating - generalizations' }
OPUMLMetamodelGeneratorTest >> testDontAddDelegationMethodsForRedefined [

	| class classModel methods |
	class := CBClass new.
	classModel := self findClass: 'IntervalConstraint'.
	generator createClassFrom: (self findClass: 'Constraint') in: 'Somewhere'.
	generator createClassFrom: (self findClass: 'NamedElement') in: 'Somewhere'.
	generator createClassFrom: (self findClass: 'ParameterableElement') in: 'Somewhere'.
	generator createClassFrom: (self findClass: 'PackageableElement') in: 'Somewhere'.
	generator addDelegationMethodsFrom: classModel to: class.
	methods := class methods collect: [ :each | each selector -> each protocolName ].
	self denyCollection: methods includesAny: { ('specification' -> 'accessing - Constraint') }.
	self denyCollection: methods includesAny: { ('specification:' -> 'accessing - Constraint') }
]

{ #category : 'tests - generating - generalizations' }
OPUMLMetamodelGeneratorTest >> testDontAddOperationsDelegationMethods [

	| class classModel methods |
	class := CBClass new.
	classModel := self findClass: 'LiteralString'.
	generator createClassFrom: (self findClass: 'NamedElement') in: 'Anywhere'.
	generator createClassFrom: (self findClass: 'ParameterableElement') in: 'Anywhere'.
	generator createClassFrom: (self findClass: 'TypedElement') in: 'Anywhere'.
	generator createClassFrom: (self findClass: 'PackageableElement') in: 'Anywhere'.
	generator createClassFrom: (self findClass: 'ValueSpecification') in: 'Anywhere'.
	generator createClassFrom: (self findClass: 'LiteralSpecification') in: 'Anywhere'.
	generator addDelegationMethodsFrom: classModel to: class.
	methods := class methods collect: [ :each | each selector -> each protocolName ].
	methods := class methods collect: [ :each | each selector -> each protocolName ].
	self denyCollection: methods includesAny: { ('stringValue' -> 'operations - ValueSpecification') }
]

{ #category : 'tests - generating - classes' }
OPUMLMetamodelGeneratorTest >> testEnsureCreateClass [

	| result1 result2 |
	result1 := generator ensureCreateClass: 'GeneratedClassXXX' in: 'Generated-Package'.
	self assert: result1 name equals: 'MBUTGeneratedClassXXX'.
	self assert: result1 packageName equals: 'Generated-UMLMetamodelTest-Generated-Package'.
	self assert: result1 parent equals: 'MBUTElement'.
	result2 := generator ensureCreateClass: 'GeneratedClassXXX' in: 'Generated-Package'.
	self assert: result1 identicalTo: result2
]

{ #category : 'tests - retrieving' }
OPUMLMetamodelGeneratorTest >> testEnumDefaultValue [
	| attribute |
	attribute := self attribute: 'direction' inClass: 'Parameter'.
	self
		assert: (generator defaultValueFrom: attribute defaultValue)
		equals: (generator classNameFor: 'ParameterDirectionKind') , ' new in'
]

{ #category : 'testing - test meta' }
OPUMLMetamodelGeneratorTest >> testFindClass [

	| aClass |
	aClass := self findClass: 'Comment'.
	self assert: aClass class identicalTo: BootUMLClass.
	self assert: aClass name equals: 'Comment'
]

{ #category : 'testing - test meta' }
OPUMLMetamodelGeneratorTest >> testFindElement [

	| anElement |
	anElement := self findElement: 'AggregationKind'.
	self assert: anElement class identicalTo: BootUMLEnumeration.
	self assert: anElement name equals: 'AggregationKind'
]

{ #category : 'tests - generating' }
OPUMLMetamodelGeneratorTest >> testGenerateAll [

	| result |
	result := generator generateAll.
	self denyEmpty: result
]

{ #category : 'tests - testing' }
OPUMLMetamodelGeneratorTest >> testIsEnumValue [

	self
		assert: (generator isEnumValue: (self attribute: 'direction' inClass: 'Parameter') defaultValue)
		description: 'Parameter direction default value must be recognized as an enum value'
]

{ #category : 'tests - testing' }
OPUMLMetamodelGeneratorTest >> testIsMultivalued [
	self
		deny: (self attribute: 'owner' inClass: 'Element') isMultivalued
		description: '0..1'.
	self
		deny: (self attribute: 'template' inClass: 'TemplateSignature') isMultivalued
		description: '1'.
	self
		assert: (self attribute: 'ownedComment' inClass: 'Element') isMultivalued
		description: '*'.
	self
		assert: (self attribute: 'relatedElement' inClass: 'Relationship') isMultivalued
		description: '1..*'.
	self
		assert: (self attribute: 'event' inClass: 'DurationObservation') isMultivalued
		description: '1..2'
]

{ #category : 'tests - testing' }
OPUMLMetamodelGeneratorTest >> testLiteralSpecification [

	self
		assert: (generator isLiteralSpecification: (self attribute: 'value' inClass: 'LiteralInteger') defaultValue)
		description: 'LiteralInteger value defaultValue must be recognized as a LiteralSpecification'.
	self
		deny: (generator isLiteralSpecification: (self attribute: 'direction' inClass: 'Parameter') defaultValue)
		description: 'Parameter direction defaultValue must not be recognized as a LiteralSpecification'
]

{ #category : 'tests - generating - operations' }
OPUMLMetamodelGeneratorTest >> testLoadTemplateMethods [

	| operation |
	operation := self operation: 'isNull' inClass: 'ValueSpecification'.
	operation method: nil.
	generator loadTemplateMethods.
	self assert: operation method class identicalTo: Array.
	self denyEmpty: operation method.
	self denyEmpty: operation method first body first.
	self assert: operation method first language first equals: 'Pharo'
]

{ #category : 'tests - generating - operations' }
OPUMLMetamodelGeneratorTest >> testLoadTemplateMethodsVarious [

	| isNullMethod lowerMethod |
	generator loadTemplateMethods.
	isNullMethod := (self operation: 'isNull' inClass: 'ValueSpecification') method.
	lowerMethod := (self operation: 'lower' inClass: 'MultiplicityElement') method.
	self assert: isNullMethod class identicalTo: Array.
	self denyEmpty: isNullMethod.
	self assert: isNullMethod first language equals: #( #Pharo ).
	self assert: isNullMethod first body equals: #( '^ false' ).
	self assert: lowerMethod class identicalTo: Array.
	self denyEmpty: lowerMethod.
	self assert: lowerMethod first language equals: #( #Pharo ).
	self assert: lowerMethod first body equals: #( '^ self lowerBound' )
]

{ #category : 'tests' }
OPUMLMetamodelGeneratorTest >> testNewDefault [

	| defaultGenerator |
	defaultGenerator := OPUMLMetamodelGenerator newDefault.
	self assert: defaultGenerator classPrefix equals: 'OPUML'.
	self assert: defaultGenerator packageName equals: 'OP-UML-Metamodel'.
	self assert: defaultGenerator sourceModel identicalTo: OPUMLMetamodelGenerator umlBootstrapModel
]

{ #category : 'testing - test meta' }
OPUMLMetamodelGeneratorTest >> testOperationInClass [

	| operation |
	operation := self operation: 'lowerBound' inClass: 'MultiplicityElement'.
	self assert: operation class identicalTo: BootUMLOperation.
	self assert: operation name equals: 'lowerBound'
]

{ #category : 'tests - generating - operations' }
OPUMLMetamodelGeneratorTest >> testOperationName [

	| classOperation |
	self assert: (generator operationNameFor: (self operation: 'lower' inClass: 'MultiplicityElement')) equals: 'lower'.
	self assert: (generator operationNameFor: (self operation: 'context' inClass: 'Behavior')) equals: 'context'.
	classOperation := BootUMLOperation new
		                  name: 'class';
		                  yourself.
	self assert: (generator operationNameFor: classOperation) equals: 'owningClass'
]

{ #category : 'tests - retrieving' }
OPUMLMetamodelGeneratorTest >> testParent [
	self assert: (generator parentFor: 'MetaElement') equals: 'Object'.
	self assert: (generator parentFor: 'Element') equals: 'MBUTMetaElement'.
	self assert: (generator parentFor: 'Port') equals: 'MBUTElement'
]

{ #category : 'tests - utility' }
OPUMLMetamodelGeneratorTest >> testPlural [
	self assert: (generator asPlural: 'owner') equals: 'owners'.
	self assert: (generator asPlural: 'superClass') equals: 'superClasses'.
	self assert: (generator asPlural: 'subsettedProperty') equals: 'subsettedProperties'
]

{ #category : 'tests - generating - operations' }
OPUMLMetamodelGeneratorTest >> testPrefixClassNames [
	self
		assert: (generator prefixClassNamesInText: '^ self aggregation = ''%AggregationKind%'' composite')
		equals: '^ self aggregation = MBUTAggregationKind composite'
]

{ #category : 'tests - retrieving' }
OPUMLMetamodelGeneratorTest >> testStubOperationName [
	self
		assert: (generator stubOperationNameFor: (self operation: 'lower' inClass: 'MultiplicityElement'))
		equals: 'lowerStub'.
	self
		assert: (generator stubOperationNameFor: (self operation: 'context' inClass: 'Behavior'))
		equals: 'contextStub'
]

{ #category : 'tests - retrieving' }
OPUMLMetamodelGeneratorTest >> testSuperclassLayers [
	| class |
	class := self findClass: 'StructuralFeature'.
	self
		assert: ((generator superclassLayersOf: class) collect: [ :each | each collect: #name ])
		equals:
			#(#() #(Element) #(Element NamedElement) #(Element NamedElement RedefinableElement) #(MultiplicityElement TypedElement Feature))
]

{ #category : 'tests - retrieving' }
OPUMLMetamodelGeneratorTest >> testUmlBootstrapModelCachingAndReset [

	| cachedModel reloadedModel |
	[
		OPUMLMetamodelGenerator resetUmlBootstrapModel.
		reloadedModel := OPUMLMetamodelGenerator umlBootstrapModel.
		cachedModel := OPUMLMetamodelGenerator umlBootstrapModel.
		self assert: reloadedModel className equals: #BootUMLPackage.
		self assert: reloadedModel name equals: 'UML'.
		self assert: cachedModel identicalTo: reloadedModel ] ensure: [ OPUMLMetamodelGenerator umlBootstrapModel ]
]

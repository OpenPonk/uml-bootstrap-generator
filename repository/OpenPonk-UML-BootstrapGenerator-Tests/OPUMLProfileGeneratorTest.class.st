"
Unit test suite verifying UML profile code generation, including generation of stereotype extension getter and setter methods onto existing target metaclasses.
"
Class {
	#name : 'OPUMLProfileGeneratorTest',
	#superclass : 'TestCase',
	#instVars : [
		'generator'
	],
	#category : 'OpenPonk-UML-BootstrapGenerator-Tests-Profile-Generator',
	#package : 'OpenPonk-UML-BootstrapGenerator-Tests',
	#tag : 'Profile-Generator'
}

{ #category : 'asserting' }
OPUMLProfileGeneratorTest >> assertAllMethodsParseIn: aCBClass [

	aCBClass methods do: [ :each |
			self
				assert: (OCParser parseMethod: each source) isMethod
				description: 'Generated instance method ' , each selector , ' must parse cleanly' ].
	aCBClass metaMethods do: [ :each |
			self
				assert: (OCParser parseMethod: each source) isMethod
				description: 'Generated class method ' , each selector , ' must parse cleanly' ]
]

{ #category : 'asserting' }
OPUMLProfileGeneratorTest >> assertMethod: actualCode equals: expectedCode [

	self
		assert: (OCParser parseMethod: actualCode) formattedCode withUnixLineEndings
		equals: (OCParser parseMethod: expectedCode) formattedCode withUnixLineEndings
]

{ #category : 'instance creation' }
OPUMLProfileGeneratorTest >> newTestGenerator [

	^ OPUMLProfileTestGenerator new
		  classPrefix: 'PTG';
		  packageName: 'Generated-ProfileTest';
		  yourself
]

{ #category : 'instance creation' }
OPUMLProfileGeneratorTest >> profileElementWithName: aName kind: aKindSymbol [

	^ OPUMLProfileTestElement new
		  name: aName;
		  kind: aKindSymbol;
		  yourself
]

{ #category : 'running' }
OPUMLProfileGeneratorTest >> setUp [

	super setUp.
	generator := OPUMLProfileGenerator new.
	generator classPrefix: 'PTG'.
	generator packageName: 'Generated-ProfileTest'
]

{ #category : 'tests - generating - methods' }
OPUMLProfileGeneratorTest >> testAddAccessingDelegationMethodsWithRedefinition [

	| parentProp redefinedProp overrideProp parentModel childModel parentCls childCls |
	parentProp := (self profileElementWithName: 'inheritedProp' kind: #Property)
		              type: (self profileElementWithName: 'String' kind: #PrimitiveType);
		              yourself.
	redefinedProp := (self profileElementWithName: 'sharedProp' kind: #Property)
		                 type: (self profileElementWithName: 'String' kind: #PrimitiveType);
		                 yourself.
	overrideProp := (self profileElementWithName: 'overrideProp' kind: #Property)
		                type: (self profileElementWithName: 'String' kind: #PrimitiveType);
		                redefinedProperties: { redefinedProp };
		                yourself.
	parentModel := (self profileElementWithName: 'Parent' kind: #Stereotype)
		               ownedAttributes: {
				               parentProp.
				               redefinedProp };
		               yourself.
	childModel := (self profileElementWithName: 'Child' kind: #Stereotype)
		              generalizations: { (OPUMLProfileTestElement new general: parentModel) };
		              ownedAttributes: { overrideProp };
		              yourself.
	parentCls := generator createClassFrom: parentModel in: 'Model'.
	childCls := generator ensureCreateClass: 'Child' in: 'Model'.
	generator addAccessingDelegationMethodsFrom: childModel to: childCls.
	self assertCollection: childCls selectors hasSameElements: #( #inheritedProp #inheritedProp: ).
	self assert: (childCls methodNamed: #inheritedProp) protocolName equals: 'accessing - Parent'.
	self assertMethod: (childCls methodNamed: #inheritedProp) source equals: 'inheritedProp
	^ (sharedGeneralizations at: #Parent) inheritedProp'.
	self assertMethod: (childCls methodNamed: #inheritedProp:) source equals: 'inheritedProp: aString
	(sharedGeneralizations at: #Parent) inheritedProp: aString'.
	self denyCollection: childCls selectors includesAny: #( #sharedProp #sharedProp: ).
	self assertAllMethodsParseIn: childCls
]

{ #category : 'tests - generating - attributes' }
OPUMLProfileGeneratorTest >> testAddAttributeAssociations [

	| cls oneToMany manyToOne manyToMany oneToOne singleOpp multiOpp |
	cls := CBClass new.
	singleOpp := (self profileElementWithName: 'owner' kind: #Property)
		             isMultivalued: false;
		             yourself.
	multiOpp := (self profileElementWithName: 'items' kind: #Property)
		            isMultivalued: true;
		            yourself.
	oneToMany := (self profileElementWithName: 'subNode' kind: #Property)
		             isMultivalued: true;
		             type: (self profileElementWithName: 'Node' kind: #Stereotype);
		             opposite: singleOpp;
		             yourself.
	manyToOne := (self profileElementWithName: 'parent' kind: #Property)
		             isMultivalued: false;
		             type: (self profileElementWithName: 'Node' kind: #Stereotype);
		             opposite: multiOpp;
		             yourself.
	manyToMany := (self profileElementWithName: 'tag' kind: #Property)
		              isMultivalued: true;
		              type: (self profileElementWithName: 'Tag' kind: #Stereotype);
		              opposite: multiOpp;
		              yourself.
	oneToOne := (self profileElementWithName: 'mate' kind: #Property)
		            isMultivalued: false;
		            type: (self profileElementWithName: 'Node' kind: #Stereotype);
		            opposite: singleOpp;
		            yourself.
	generator addAttribute: oneToMany to: cls.
	generator addAttribute: manyToOne to: cls.
	generator addAttribute: manyToMany to: cls.
	generator addAttribute: oneToOne to: cls.
	self assertMethod: (cls methodNamed: #subNodes) source equals: 'subNodes
	""
	^ subNodes ifNil: [ subNodes := OPUMLToManyLinks on: self identity opposite: #owner: ]'.
	self assertMethod: (cls methodNamed: #subNodes:) source equals: 'subNodes: aNode
	""
	self subNodes removeAll; addAll: aNode'.
	self assertMethod: (cls methodNamed: #parent) source equals: 'parent
	""
	^ parent'.
	self assertMethod: (cls methodNamed: #parent:) source equals: 'parent: aNode
	""
	parent := OPUMLToOneLink on: self identity update: #itemses from: parent to: aNode'.
	self assertMethod: (cls methodNamed: #tags) source equals: 'tags
	""
	^ tags ifNil: [ tags := OPUMLManyToManyLinks on: self identity opposite: #itemses ]'.
	self assertMethod: (cls methodNamed: #mate:) source equals: 'mate: aNode
	""
	| anOldMate |
	anOldMate := mate.
	mate := aNode.
	OPUMLToOneLink on: self identity thisSelector: #mate otherSelector: #owner from: anOldMate to: mate'.
	self assertAllMethodsParseIn: cls
]

{ #category : 'tests - generating - attributes' }
OPUMLProfileGeneratorTest >> testAddAttributeMultivaluedWithoutOpposite [

	| cls attr |
	cls := CBClass new.
	attr := (self profileElementWithName: 'item' kind: #Property)
		        isMultivalued: true;
		        type: (self profileElementWithName: 'String' kind: #PrimitiveType);
		        yourself.
	generator addAttribute: attr to: cls.
	self assertCollection: cls instanceVariables hasSameElements: #( #items ).
	self assertCollection: cls selectors hasSameElements: #( #items #items: ).
	self assertMethod: (cls methodNamed: #items) source equals: 'items
	""
	^ items ifNil: [ items := OrderedCollection new ]'.
	self assertMethod: (cls methodNamed: #items:) source equals: 'items: aString
	""
	items := aString'.
	self assertAllMethodsParseIn: cls
]

{ #category : 'tests - generating - attributes' }
OPUMLProfileGeneratorTest >> testAddAttributeSingleAndNamedClass [

	| cls attr classAttr comment |
	cls := CBClass new.
	comment := OPUMLProfileTestElement new body: 'Owner class'.
	attr := (self profileElementWithName: 'label' kind: #Property)
		        type: (self profileElementWithName: 'String' kind: #PrimitiveType);
		        yourself.
	classAttr := (self profileElementWithName: 'class' kind: #Property)
		             type: (self profileElementWithName: 'Element' kind: #Class);
		             ownedComments: { comment };
		             yourself.
	generator addAttribute: attr to: cls.
	generator addAttribute: classAttr to: cls.
	self assertCollection: cls instanceVariables hasSameElements: #( #label #owningClass ).
	self assertCollection: cls selectors hasSameElements: #( #label #label: #owningClass #owningClass: ).
	self assertMethod: (cls methodNamed: #owningClass) source equals: 'owningClass
	"Owner class"
	^ owningClass'.
	self assertMethod: (cls methodNamed: #owningClass:) source equals: 'owningClass: anElement
	"Owner class"
	owningClass := anElement'.
	self assertAllMethodsParseIn: cls
]

{ #category : 'tests - generating - attributes' }
OPUMLProfileGeneratorTest >> testAddAttributeUntyped [

	| cls attr |
	cls := CBClass new.
	attr := self profileElementWithName: 'rawValue' kind: #Property.
	generator addAttribute: attr to: cls.
	self assertCollection: cls selectors hasSameElements: #( #rawValue #rawValue: ).
	self assertMethod: (cls methodNamed: #rawValue:) source equals: 'rawValue: anObject
	""
	rawValue := anObject'.
	self assertAllMethodsParseIn: cls
]

{ #category : 'tests - generating - attributes' }
OPUMLProfileGeneratorTest >> testAddAttributeWithDefaultValues [

	| cls boolAttr intAttr strAttr nullAttr enumAttr enumType enumLit enumVal |
	cls := CBClass new.
	boolAttr := (self profileElementWithName: 'flag' kind: #Property)
		            type: (self profileElementWithName: 'Boolean' kind: #PrimitiveType);
		            defaultValue: (OPUMLProfileTestElement new
				             kinds: #( #LiteralBoolean #LiteralSpecification );
				             value: false;
				             yourself);
		            yourself.
	intAttr := (self profileElementWithName: 'count' kind: #Property)
		           type: (self profileElementWithName: 'Integer' kind: #PrimitiveType);
		           defaultValue: (OPUMLProfileTestElement new
				            kinds: #( #LiteralInteger #LiteralSpecification );
				            value: 0;
				            yourself);
		           yourself.
	strAttr := (self profileElementWithName: 'text' kind: #Property)
		           type: (self profileElementWithName: 'String' kind: #PrimitiveType);
		           defaultValue: (OPUMLProfileTestElement new
				            kinds: #( #LiteralString #LiteralSpecification );
				            value: 'don''t';
				            yourself);
		           yourself.
	nullAttr := (self profileElementWithName: 'empty' kind: #Property)
		            type: (self profileElementWithName: 'String' kind: #PrimitiveType);
		            defaultValue: (OPUMLProfileTestElement new
				             kinds: #( #LiteralNull #LiteralSpecification );
				             value: nil;
				             yourself);
		            yourself.
	enumType := self profileElementWithName: 'ColorKind' kind: #Enumeration.
	enumLit := self profileElementWithName: 'red' kind: #EnumerationLiteral.
	enumVal := (self profileElementWithName: 'dv' kind: #InstanceValue)
		           type: enumType;
		           instance: enumLit;
		           yourself.
	enumAttr := (self profileElementWithName: 'color' kind: #Property)
		            type: enumType;
		            defaultValue: enumVal;
		            yourself.
	generator addAttribute: boolAttr to: cls.
	generator addAttribute: intAttr to: cls.
	generator addAttribute: strAttr to: cls.
	generator addAttribute: nullAttr to: cls.
	generator addAttribute: enumAttr to: cls.
	self assertMethod: (cls methodNamed: #flag) source equals: 'flag
	""
	^ flag ifNil: [ flag := false ]'.
	self assertMethod: (cls methodNamed: #count) source equals: 'count
	""
	^ count ifNil: [ count := 0 ]'.
	self assertMethod: (cls methodNamed: #text) source equals: 'text
	""
	^ text ifNil: [ text := ''don''''t'' ]'.
	self assertMethod: (cls methodNamed: #empty) source equals: 'empty
	""
	^ empty'.
	self assertMethod: (cls methodNamed: #color) source equals: 'color
	""
	^ color ifNil: [ color := PTGColorKind new red ]'.
	self assertAllMethodsParseIn: cls
]

{ #category : 'tests - generating - methods' }
OPUMLProfileGeneratorTest >> testAddGeneralizations [

	| element parent child cls |
	element := self profileElementWithName: 'Element' kind: #Stereotype.
	parent := self profileElementWithName: 'Parent' kind: #Stereotype.
	child := self profileElementWithName: 'Child' kind: #Stereotype.
	child generalizations: {
			(OPUMLProfileTestElement new general: element).
			(OPUMLProfileTestElement new general: parent) }.
	cls := CBClass new.
	generator addGeneralizationsFrom: child to: cls.
	self assertCollection: cls selectors hasSameElements: #( #initializeSharedGeneralizations #initializeDirectGeneralizations ).
	self assertMethod: (cls methodNamed: #initializeSharedGeneralizations) source equals: 'initializeSharedGeneralizations
	sharedGeneralizations at: #Parent put: (PTGParent newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Child put: self'.
	self assertMethod: (cls methodNamed: #initializeDirectGeneralizations) source equals: 'initializeDirectGeneralizations
	directGeneralizations := {
		sharedGeneralizations at: #Parent.
	}'.
	self assertAllMethodsParseIn: cls
]

{ #category : 'tests - generating - operations' }
OPUMLProfileGeneratorTest >> testAddOperationWithRealMethod [

	| cls op behavior |
	cls := CBClass new.
	behavior := OPUMLProfileTestElement new
		            languages: { 'Pharo' };
		            bodies: { '^ ''%Kind%'' new' };
		            yourself.
	op := (self profileElementWithName: 'class' kind: #Operation)
		      methods: { behavior };
		      yourself.
	generator addOperation: op to: cls.
	self assertCollection: cls selectors hasSameElements: #( #owningClassStub #owningClass ).
	self assert: (cls methodNamed: #owningClass) protocolName equals: 'operations'.
	self assertMethod: (cls methodNamed: #owningClass) source equals: 'owningClass
	""
	^ PTGKind new'.
	self assertAllMethodsParseIn: cls
]

{ #category : 'tests - generating - operations' }
OPUMLProfileGeneratorTest >> testAddOperationWithUnspecifiedLanguages [

	| cls op preSpec pre bodySpec bodyCond |
	cls := CBClass new.
	preSpec := OPUMLProfileTestElement new
		           bodies: { 'self.size > 0' };
		           yourself.
	pre := (self profileElementWithName: 'nonEmpty' kind: #Constraint)
		       specification: preSpec;
		       yourself.
	bodySpec := OPUMLProfileTestElement new
		            bodies: { 'result = 42' };
		            yourself.
	bodyCond := (self profileElementWithName: 'spec' kind: #Constraint)
		            specification: bodySpec;
		            yourself.
	op := (self profileElementWithName: 'answer' kind: #Operation)
		      preconditions: { pre };
		      bodyCondition: bodyCond;
		      yourself.
	generator addOperation: op to: cls.
	self assertMethod: (cls methodNamed: #answerStub) source equals: 'answerStub
	""
	"nonEmpty: {} self.size > 0"
	"{} result = 42"
	self notYetImplemented'.
	self assertAllMethodsParseIn: cls
]

{ #category : 'tests - generating - operations' }
OPUMLProfileGeneratorTest >> testAddOperationWithoutMethod [

	| cls op preSpec pre bodySpec bodyCond |
	cls := CBClass new.
	preSpec := OPUMLProfileTestElement new
		           languages: { 'OCL' };
		           bodies: { 'self.size > 0' };
		           yourself.
	pre := (self profileElementWithName: 'nonEmpty' kind: #Constraint)
		       specification: preSpec;
		       yourself.
	bodySpec := OPUMLProfileTestElement new
		            languages: { 'OCL' };
		            bodies: { 'result = 42' };
		            yourself.
	bodyCond := (self profileElementWithName: 'spec' kind: #Constraint)
		            specification: bodySpec;
		            yourself.
	op := (self profileElementWithName: 'answer' kind: #Operation)
		      preconditions: { pre };
		      bodyCondition: bodyCond;
		      ownedComments: { (OPUMLProfileTestElement new body: 'Computes answer') };
		      yourself.
	generator addOperation: op to: cls.
	self assertCollection: cls selectors hasSameElements: #( #answerStub ).
	self assert: (cls methodNamed: #answerStub) protocolName equals: 'operations - stubs'.
	self assertMethod: (cls methodNamed: #answerStub) source equals: 'answerStub
	"Computes answer"
	"nonEmpty: {OCL} self.size > 0"
	"{OCL} result = 42"
	self notYetImplemented'.
	self assertAllMethodsParseIn: cls
]

{ #category : 'tests - generating - methods' }
OPUMLProfileGeneratorTest >> testAddOperationsDelegationMethodsWithRedefinition [

	| behavior inheritedOp redefinedOp stubOp childRedefOp parentModel childModel parentCls childCls |
	behavior := OPUMLProfileTestElement new
		            languages: { 'Pharo' };
		            bodies: { '^ 1' };
		            yourself.
	inheritedOp := (self profileElementWithName: 'inheritedOp' kind: #Operation)
		               methods: { behavior };
		               yourself.
	redefinedOp := (self profileElementWithName: 'class' kind: #Operation)
		               methods: { behavior };
		               yourself.
	stubOp := self profileElementWithName: 'stubOnly' kind: #Operation.
	childRedefOp := (self profileElementWithName: 'class' kind: #Operation)
		                methods: { behavior };
		                yourself.
	parentModel := (self profileElementWithName: 'Parent' kind: #Stereotype)
		               ownedOperations: {
				               inheritedOp.
				               redefinedOp.
				               stubOp };
		               yourself.
	childModel := (self profileElementWithName: 'Child' kind: #Stereotype)
		              generalizations: { (OPUMLProfileTestElement new general: parentModel) };
		              ownedOperations: { childRedefOp };
		              yourself.
	parentCls := generator createClassFrom: parentModel in: 'Model'.
	childCls := generator ensureCreateClass: 'Child' in: 'Model'.
	generator addOperationsDelegationMethodsFrom: childModel to: childCls.
	self assertCollection: childCls selectors hasSameElements: #( #inheritedOp ).
	self assert: (childCls methodNamed: #inheritedOp) protocolName equals: 'operations - Parent'.
	self assertMethod: (childCls methodNamed: #inheritedOp) source equals: 'inheritedOp
	^ (sharedGeneralizations at: #Parent) inheritedOp'.
	self denyCollection: childCls selectors includesAny: #( #owningClass #stubOnly #stubOnlyStub ).
	self assertAllMethodsParseIn: childCls
]

{ #category : 'tests - utilities' }
OPUMLProfileGeneratorTest >> testAsPluralAndNamingHelpers [

	| attrProp singleProp multivaluedClassProp opProp |
	self assert: (generator asPlural: 'class') equals: 'classes'.
	self assert: (generator asPlural: 'property') equals: 'properties'.
	self assert: (generator asPlural: 'item') equals: 'items'.
	self assert: (generator classNameFor: 'Kind') equals: #PTGKind.
	self assert: (generator parentFor: 'Element') equals: 'OPUMLMetaElement'.
	self assert: (generator parentFor: 'ProfileFactory') equals: 'OPUmlCustomProfile'.
	self assert: (generator parentFor: 'Kind') equals: #PTGElement.
	attrProp := self profileElementWithName: 'label' kind: #Property.
	singleProp := self profileElementWithName: 'class' kind: #Property.
	multivaluedClassProp := (self profileElementWithName: 'class' kind: #Property)
		                        isMultivalued: true;
		                        yourself.
	self assert: (generator attributeNameFor: attrProp) equals: 'label'.
	self assert: (generator attributeNameFor: singleProp) equals: 'owningClass'.
	self assert: (generator attributeNameFor: multivaluedClassProp) equals: 'owningClasses'.
	opProp := self profileElementWithName: 'class' kind: #Operation.
	self assert: (generator operationNameFor: opProp) equals: 'owningClass'.
	self assert: (generator stubOperationNameFor: opProp) equals: 'owningClassStub'.
	self assert: (generator prefixClassNamesInText: 'self = ''%Kind%'' new') equals: 'self = PTGKind new'.
	self assertEmpty: (generator commentIn: attrProp).
	attrProp ownedComments: { (OPUMLProfileTestElement new body: 'Doc') }.
	self assert: (generator commentIn: attrProp) equals: 'Doc'
]

{ #category : 'tests - generating' }
OPUMLProfileGeneratorTest >> testCreateElementMeta [

	| profile elementClass |
	profile := OPUMLProfileTestElement new
		           implementationPackage: 'Metamodel';
		           yourself.
	generator sourceModel: profile.
	elementClass := generator createElementMeta.
	self assert: elementClass name equals: #PTGElement.
	self assert: elementClass parent equals: 'OPUMLMetaElement'.
	self assert: elementClass packageName equals: 'Generated-ProfileTest'.
	self assert: elementClass tag equals: 'Metamodel'.
	self assertCollection: elementClass selectors hasSameElements: #( #umlClassName #umlMetaClass ).
	self assertMethod: (elementClass methodNamed: #umlClassName) source equals: 'umlClassName
	^ self className withoutPrefix: ''PTG'''.
	self assertMethod: (elementClass methodNamed: #umlMetaClass) source equals: 'umlMetaClass
	^ PTGProfileFactory metaClassFor: self'.
	self assertAllMethodsParseIn: elementClass
]

{ #category : 'tests - generating' }
OPUMLProfileGeneratorTest >> testCreateProfileFactory [

	| testGenerator factoryClass xmiAst expectedXmi |
	expectedXmi := '<?xml version="1.0"?><xmi:XMI><comment body="Element''s quote"/></xmi:XMI>'.
	testGenerator := self newTestGenerator.
	testGenerator xmiStringValue: expectedXmi.
	testGenerator sourceModel: OPUMLProfileTestElement new.
	factoryClass := testGenerator createProfileFactory.
	self assert: factoryClass name equals: #PTGProfileFactory.
	self assert: factoryClass parent equals: 'OPUmlCustomProfile'.
	self assert: factoryClass packageName equals: 'Generated-ProfileTest'.
	self assert: factoryClass tag equals: 'Model'.
	self assertCollection: factoryClass instanceVariables hasSameElements: #( #profile ).
	self assertCollection: factoryClass selectors hasSameElements: #( #createProfile #xmi ).
	self assertAllMethodsParseIn: factoryClass.
	xmiAst := OCParser parseMethod: (factoryClass methodNamed: #xmi) source.
	self assert: xmiAst body statements first value value equals: expectedXmi
]

{ #category : 'tests - generating' }
OPUMLProfileGeneratorTest >> testEnsureCreateClass [

	| firstClass secondClass unclassifiedClass |
	firstClass := generator ensureCreateClass: 'SampleStereotype' in: 'Model'.
	self assert: firstClass name equals: #PTGSampleStereotype.
	self assert: firstClass parent equals: #PTGElement.
	self assert: firstClass packageName equals: 'Generated-ProfileTest'.
	self assert: firstClass tag equals: 'Model'.
	secondClass := generator ensureCreateClass: 'SampleStereotype' in: 'Model'.
	self assert: firstClass identicalTo: secondClass.
	unclassifiedClass := generator ensureCreateClass: 'OtherStereotype' in: 'Unclassified'.
	self assert: unclassifiedClass packageName equals: 'Generated-ProfileTest'.
	self assertEmpty: unclassifiedClass tag
]

{ #category : 'tests - generating' }
OPUMLProfileGeneratorTest >> testGenerateAll [

	| testGenerator profile enumModel baseStereotype childStereotype baseAttr childAttr op behavior comment ext1 ext2 metaclassElement end1 end2 opp1 opp2 changes customClasses |
	enumModel := (self profileElementWithName: 'VisibilityKind' kind: #Enumeration)
		             ownedLiterals: { (self profileElementWithName: 'public' kind: #EnumerationLiteral) };
		             yourself.
	comment := OPUMLProfileTestElement new body: 'Stereotype''s doc'.
	baseAttr := (self profileElementWithName: 'label' kind: #Property)
		            type: (self profileElementWithName: 'String' kind: #PrimitiveType);
		            defaultValue: (OPUMLProfileTestElement new
				             kinds: #( #LiteralString #LiteralSpecification );
				             value: 'don''t';
				             yourself);
		            yourself.
	behavior := OPUMLProfileTestElement new
		            languages: { 'Pharo' };
		            bodies: { '^ ''%BaseStereo%'' ' };
		            yourself.
	op := (self profileElementWithName: 'tagName' kind: #Operation)
		      methods: { behavior };
		      yourself.
	baseStereotype := (self profileElementWithName: 'BaseStereo' kind: #Stereotype)
		                  ownedComments: { comment };
		                  ownedAttributes: { baseAttr };
		                  ownedOperations: { op };
		                  yourself.
	childAttr := (self profileElementWithName: 'note' kind: #Property)
		             isMultivalued: true;
		             type: (self profileElementWithName: 'String' kind: #PrimitiveType);
		             yourself.
	childStereotype := (self profileElementWithName: 'ChildStereo' kind: #Stereotype)
		                   generalizations: { (OPUMLProfileTestElement new general: baseStereotype) };
		                   ownedAttributes: { childAttr };
		                   yourself.
	metaclassElement := self profileElementWithName: 'MetamodelTestParentElement' kind: #Class.
	opp1 := (self profileElementWithName: 'base_MetamodelTestParentElement' kind: #Property)
		        type: metaclassElement;
		        yourself.
	opp2 := (self profileElementWithName: 'base_MetamodelTestParentElement' kind: #Property)
		        type: metaclassElement;
		        yourself.
	end1 := (self profileElementWithName: 'extension_BaseStereo' kind: #Property)
		        type: baseStereotype;
		        opposite: opp1;
		        yourself.
	end2 := (self profileElementWithName: 'extension_ChildStereo' kind: #Property)
		        type: childStereotype;
		        opposite: opp2;
		        yourself.
	ext1 := (self profileElementWithName: 'Ext1' kind: #Extension)
		        ownedEnd: end1;
		        yourself.
	ext2 := (self profileElementWithName: 'Ext2' kind: #Extension)
		        ownedEnd: end2;
		        yourself.
	profile := OPUMLProfileTestElement new
		           implementationPackage: 'Generated-ProfileTest';
		           packagedElements: {
				           enumModel.
				           baseStereotype.
				           childStereotype.
				           ext1.
				           ext2 };
		           yourself.
	testGenerator := self newTestGenerator.
	customClasses := OrderedDictionary new.
	testGenerator classes: customClasses.
	self assert: testGenerator classes identicalTo: customClasses.
	testGenerator xmiStringValue: '<xmi><tag body="It''s ok"/></xmi>'.
	testGenerator sourceModel: profile.
	changes := testGenerator generateAll.
	self denyEmpty: changes.
	self
		assertCollection: testGenerator classes keys
		hasSameElements: #( 'Element' 'VisibilityKind' 'BaseStereo' 'ChildStereo' 'ProfileFactory' #OPUMLMetamodelTestParentElement ).
	self assert: (testGenerator classes at: 'BaseStereo') tag equals: 'Model'.
	testGenerator classes valuesDo: [ :each | self assertAllMethodsParseIn: each ]
]

{ #category : 'tests - generating' }
OPUMLProfileGeneratorTest >> testGenerateAllEnums [

	| enumModel redLiteral pkgLiteral redComment profile enumClass |
	redComment := OPUMLProfileTestElement new body: 'Primary "red" color'.
	redLiteral := (self profileElementWithName: 'red' kind: #EnumerationLiteral)
		              ownedComments: { redComment };
		              yourself.
	pkgLiteral := self profileElementWithName: 'package' kind: #EnumerationLiteral.
	enumModel := (self profileElementWithName: 'ColorKind' kind: #Enumeration)
		             ownedLiterals: {
				             redLiteral.
				             pkgLiteral };
		             yourself.
	profile := OPUMLProfileTestElement new
		           implementationPackage: 'Metamodel';
		           packagedElements: { enumModel };
		           yourself.
	generator sourceModel: profile.
	generator generateAllEnums.
	self assertCollection: generator classes keys hasSameElements: #( 'ColorKind' ).
	enumClass := generator classes at: 'ColorKind'.
	self assert: enumClass name equals: #PTGColorKind.
	self assert: enumClass parent equals: #PTGEnumeration.
	self assert: enumClass packageName equals: 'Generated-ProfileTest'.
	self assert: enumClass tag equals: 'Metamodel'.
	self assertCollection: enumClass selectors hasSameElements: #( #red #package ).
	self assertCollection: (enumClass metaMethods collect: #selector) hasSameElements: #( #red ).
	self assert: (enumClass methodNamed: #red) protocolName equals: 'accessing'.
	self assert: enumClass metaMethods first protocolName equals: 'accessing - enum'.
	self assertMethod: (enumClass methodNamed: #red) source equals: 'red
	"Primary ""red"" color"
	^ #red'.
	self assertAllMethodsParseIn: enumClass
]

{ #category : 'tests - generating' }
OPUMLProfileGeneratorTest >> testGenerateExtensionMethods [

	| profile nonExtensionElement extensionElement extensionEnd stereotypeElement oppositeEnd metaclassElement generatedClass getterMethod setterMethod changes |
	stereotypeElement := OPUMLProfileTestElement new
		                     name: 'SampleStereotype';
		                     yourself.
	metaclassElement := OPUMLProfileTestElement new
		                    name: 'MetamodelTestParentElement';
		                    yourself.
	oppositeEnd := OPUMLProfileTestElement new
		               name: 'base_MetamodelTestParentElement';
		               type: metaclassElement;
		               yourself.
	extensionEnd := OPUMLProfileTestElement new
		                name: 'extension_SampleStereotype';
		                type: stereotypeElement;
		                opposite: oppositeEnd;
		                yourself.
	extensionElement := OPUMLProfileTestElement new
		                    kind: #Extension;
		                    ownedEnd: extensionEnd;
		                    yourself.
	nonExtensionElement := OPUMLProfileTestElement new
		                       kind: #Stereotype;
		                       name: 'SampleStereotype';
		                       yourself.
	profile := OPUMLProfileTestElement new
		           implementationPackage: 'Generated-ProfileTest';
		           packagedElements: {
				           nonExtensionElement.
				           extensionElement };
		           yourself.

	generator sourceModel: profile.
	generator generateExtensionMethods.

	self assertCollection: generator classes keys hasSameElements: #( #OPUMLMetamodelTestParentElement ).
	generatedClass := generator classes at: #OPUMLMetamodelTestParentElement.
	self assert: generatedClass packageTag equals: OPUMLMetamodelTestParentElement packageTagName asString.
	self
		assertCollection: (generatedClass methods collect: #selector)
		hasSameElements: #( #extension_SampleStereotype #extension_SampleStereotype: ).

	getterMethod := generatedClass methodNamed: #extension_SampleStereotype.
	setterMethod := generatedClass methodNamed: #extension_SampleStereotype:.
	self assert: getterMethod protocolName equals: '*Generated-ProfileTest'.
	self assert: setterMethod protocolName equals: '*Generated-ProfileTest'.
	self assertMethod: getterMethod source equals: 'extension_SampleStereotype
	^ self tagAt: #extension_SampleStereotype ifAbsent: [ nil ]'.
	self assertMethod: setterMethod source equals: 'extension_SampleStereotype: aSampleStereotype
	| oldSampleStereotype |
	oldSampleStereotype := self extension_SampleStereotype.
	self tagAt: #extension_SampleStereotype put: aSampleStereotype.
	OPUMLToOneLink
		on: self
		thisSelector: #extension_SampleStereotype
		otherSelector: #base_MetamodelTestParentElement
		updateFrom: oldSampleStereotype
		to: aSampleStereotype'.

	changes := generator changes.
	self assert: changes size equals: 2.
	self
		assertCollection: (changes collect: #selector)
		hasSameElements: #( #extension_SampleStereotype #extension_SampleStereotype: )
]

{ #category : 'tests - generating' }
OPUMLProfileGeneratorTest >> testGenerateExtensionMethodsMultipleOnSameMetaclass [

	| stereotypeOne stereotypeTwo metaclassElement oppositeOne oppositeTwo endOne endTwo extOne extTwo profile generatedClass |
	stereotypeOne := self profileElementWithName: 'FirstStereotype' kind: #Stereotype.
	stereotypeTwo := self profileElementWithName: 'SecondStereotype' kind: #Stereotype.
	metaclassElement := self profileElementWithName: 'MetamodelTestParentElement' kind: #Class.
	oppositeOne := (self profileElementWithName: 'base_MetamodelTestParentElement' kind: #Property)
		               type: metaclassElement;
		               yourself.
	oppositeTwo := (self profileElementWithName: 'base_MetamodelTestParentElement' kind: #Property)
		               type: metaclassElement;
		               yourself.
	endOne := (self profileElementWithName: 'extension_FirstStereotype' kind: #Property)
		          type: stereotypeOne;
		          opposite: oppositeOne;
		          yourself.
	endTwo := (self profileElementWithName: 'extension_SecondStereotype' kind: #Property)
		          type: stereotypeTwo;
		          opposite: oppositeTwo;
		          yourself.
	extOne := (self profileElementWithName: 'Ext1' kind: #Extension)
		          ownedEnd: endOne;
		          yourself.
	extTwo := (self profileElementWithName: 'Ext2' kind: #Extension)
		          ownedEnd: endTwo;
		          yourself.
	profile := OPUMLProfileTestElement new
		           implementationPackage: 'Generated-ProfileTest';
		           packagedElements: {
				           extOne.
				           extTwo };
		           yourself.
	generator sourceModel: profile.
	generator generateExtensionMethods.
	generatedClass := generator classes at: #OPUMLMetamodelTestParentElement.
	self
		assertCollection: (generatedClass methods collect: #selector)
		hasSameElements:
		#( #extension_FirstStereotype #extension_FirstStereotype: #extension_SecondStereotype #extension_SecondStereotype: ).
	self assertAllMethodsParseIn: generatedClass
]

{ #category : 'tests - utilities' }
OPUMLProfileGeneratorTest >> testPredicatesAndDefaultValueFrom [

	| litStr litNull enumType enumLit enumVal |
	self deny: (generator isLiteralSpecification: nil) description: 'nil must not be a LiteralSpecification'.
	self deny: (generator isEnumValue: nil) description: 'nil must not be an enum InstanceValue'.
	litStr := OPUMLProfileTestElement new
		          kinds: #( #LiteralString #LiteralSpecification );
		          value: 'a''b';
		          yourself.
	self assert: (generator isLiteralSpecification: litStr) description: 'LiteralString must satisfy isLiteralSpecification:'.
	self assert: (generator defaultValueFrom: litStr) equals: '''a''''b'''.
	litNull := OPUMLProfileTestElement new
		           kinds: #( #LiteralNull #LiteralSpecification );
		           value: nil;
		           yourself.
	self assert: (generator defaultValueFrom: litNull) equals: nil.
	enumType := self profileElementWithName: 'ColorKind' kind: #Enumeration.
	enumLit := self profileElementWithName: 'red' kind: #EnumerationLiteral.
	enumVal := (self profileElementWithName: 'dv' kind: #InstanceValue)
		           type: enumType;
		           instance: enumLit;
		           yourself.
	self assert: (generator isEnumValue: enumVal) description: 'InstanceValue typed by Enumeration must satisfy isEnumValue:'.
	self assert: (generator defaultValueFrom: enumVal) equals: 'PTGColorKind new red'
]

{ #category : 'tests - generating - methods' }
OPUMLProfileGeneratorTest >> testSuperclassLayersAndAllSuperclasses [

	| element root parentA parentB child genRoot genA genB genChildA genChildB layers allSupers |
	element := self profileElementWithName: 'Element' kind: #Stereotype.
	root := self profileElementWithName: 'Root' kind: #Stereotype.
	parentA := self profileElementWithName: 'ParentA' kind: #Stereotype.
	parentB := self profileElementWithName: 'ParentB' kind: #Stereotype.
	child := self profileElementWithName: 'Child' kind: #Stereotype.
	genRoot := OPUMLProfileTestElement new general: element.
	root generalizations: { genRoot }.
	genA := OPUMLProfileTestElement new general: root.
	genB := OPUMLProfileTestElement new general: root.
	parentA generalizations: { genA }.
	parentB generalizations: { genB }.
	genChildA := OPUMLProfileTestElement new general: parentA.
	genChildB := OPUMLProfileTestElement new general: parentB.
	child generalizations: {
			genChildA.
			genChildB }.
	layers := generator superclassLayersOf: child.
	self assert: layers first equals: #(  ).
	self assertCollection: (layers second collect: #name) hasSameElements: #( 'Element' ).
	self assertCollection: (layers third collect: #name) hasSameElements: #( 'Root' 'Root' ).
	self assertCollection: (layers fourth collect: #name) hasSameElements: #( 'ParentA' 'ParentB' ).
	allSupers := generator allSuperclassesOf: child.
	self assert: (allSupers collect: #name) equals: #( 'Root' 'ParentA' 'ParentB' )
]

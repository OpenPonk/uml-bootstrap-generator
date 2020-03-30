Class {
	#name : #OPUMLBootstrapGeneratorTest,
	#superclass : #TestCase,
	#instVars : [
		'generator'
	],
	#classInstVars : [
		'umlSpecs'
	],
	#category : 'OP-UML-BootstrapGenerator-Tests'
}

{ #category : #accessing }
OPUMLBootstrapGeneratorTest class >> retrieveUmlSpecs [
	| primitives uml mapping result |
	primitives := 'http://www.omg.org/spec/UML/20131001/PrimitiveTypes.xmi'.
	uml := 'http://www.omg.org/spec/UML/20131001/UML.xmi'.
	mapping := Dictionary
		with: primitives -> (ZnEasy get: primitives) entity readStream contents
		with: uml -> (ZnEasy get: uml) entity readStream contents.
	result := OPXMIReader readFromMapping: mapping.
	^ result at: uml
]

{ #category : #accessing }
OPUMLBootstrapGeneratorTest class >> umlSpecs [
	"umlSpecs := nil"

	<script: 'self umlSpecs inspect'>
	^ umlSpecs ifNil: [ umlSpecs := self retrieveUmlSpecs ]
]

{ #category : #running }
OPUMLBootstrapGeneratorTest >> setUp [
	super setUp.
	generator := OPUMLBootstrapGenerator new.
	generator sourceXmi: self class umlSpecs.
	generator classPrefix: 'BUT'.
	generator packageName: 'Generated-UMLBootstrapTest'
]

{ #category : #'tests - selecting' }
OPUMLBootstrapGeneratorTest >> testClassNameFor [
	self assert: (generator classNameFor: 'Hello') equals: 'BUTHello'
]

{ #category : #tests }
OPUMLBootstrapGeneratorTest >> testCreateAccessors [
	| class |
	class := CBClass new.
	generator createAccessorsFrom: self xmiClassAttribute in: class.
	self assert: class instanceVariables equals: #(body).
	self assert: class selectors equals: #(body body:)
]

{ #category : #tests }
OPUMLBootstrapGeneratorTest >> testCreateAccessorsForClassAttribute [
	| class attribute |
	"'class' is a prohibited attribute/method name, make sure we don't generate it"
	attribute := OPXMIObjectElement new
		xmiName: 'ownedAttribute';
		containedItems:
			{OPXMIValueElement xmiName: 'name' value: 'class'.
			OPXMIObjectElement new
				xmiName: 'type';
				containedItems:
					{OPXMIValueElement xmiName: 'xmi:type' value: 'uml:PrimitiveType'.
					OPXMIValueElement
						xmiName: 'href'
						value: 'http://www.omg.org/spec/UML/20131001/PrimitiveTypes.xmi#String'}}.
	class := CBClass new.
	generator createAccessorsFrom: attribute in: class.
	self assert: class instanceVariables equals: #(owningClass).
	self assert: class selectors equals: #(owningClass owningClass:)
]

{ #category : #tests }
OPUMLBootstrapGeneratorTest >> testCreateAssociation [
	| association element comment |
	association := self xmiAssociation containedItems
		detect: [ :each | each xmiType = 'uml:Association' ].
	element := generator ensureCreateClass: 'Element' in: 'Wherever'.
	comment := generator ensureCreateClass: 'Comment' in: 'Wherever'.
	generator createAssociationFrom: association.
	self assert: element instanceVariables equals: #(comment).
	self assert: element selectors equals: #(comment comment:).
	self assert: comment instanceVariables equals: #(annotatedElement).
	self assert: comment selectors equals: #(annotatedElement annotatedElement:)
]

{ #category : #'tests - generating' }
OPUMLBootstrapGeneratorTest >> testCreateClass [
	| result |
	result := generator createClassFrom: self xmiComplexElement in: 'CommonStructure'.
	self assert: result name equals: 'BUTComment'.
	self assert: result package equals: 'Generated-UMLBootstrapTest-CommonStructure'
]

{ #category : #'tests - initialization' }
OPUMLBootstrapGeneratorTest >> testDefaultConfiguration [
	self assert: generator classPrefix equals: 'BUT'.
	self assert: generator packageName equals: 'Generated-UMLBootstrapTest'.
	self assert: generator rootClassName equals: 'OPUMLBootstrapObject'.
	self assert: generator sourceXmi isNotNil
]

{ #category : #'tests - generating' }
OPUMLBootstrapGeneratorTest >> testEnsureCreateClass [
	| result1 result2 |
	result1 := generator ensureCreateClass: 'GeneratedClassXXX' in: 'Package'.
	self assert: result1 name equals: 'BUTGeneratedClassXXX'.
	self assert: result1 package equals: 'Generated-UMLBootstrapTest-Package'.
	self assert: result1 parent equals: generator rootClassName.
	result2 := generator ensureCreateClass: 'GeneratedClassXXX' in: 'Package'.
	self assert: result1 == result2 description: 'should be the same identity'
]

{ #category : #'tests - selecting' }
OPUMLBootstrapGeneratorTest >> testGeneralizationsInClass [
	| parent child |
	parent := OPXMIObjectElement new
		containedItems: {OPXMIValueElement xmiName: 'name' value: 'Parent'}.
	child := OPXMIObjectElement new
		containedItems:
			{OPXMIValueElement xmiName: 'name' value: 'Child'.
			OPXMIObjectElement new
				xmiName: 'generalization';
				containedItems:
					{OPXMIReferenceAttribute new
						xmiName: 'general';
						referencedElements: {parent}}}.
	self assert: (generator collectGeneralizationsInClass: parent) equals: #().
	self
		assert: (generator collectGeneralizationsInClass: child)
		equals: {'Child' -> 'Parent'}
]

{ #category : #'tests - generating' }
OPUMLBootstrapGeneratorTest >> testGenerateAll [
	| result |
	result := generator generateAll.
	self assert: result isNotEmpty
]

{ #category : #'tests - retrieving' }
OPUMLBootstrapGeneratorTest >> testTypeOfPrimitive [
	self
		assert:
			(generator
				typeOf:
					(OPXMIObjectElement new
						containedItems:
							{OPXMIValueElement xmiName: 'xmi:type' value: 'uml:PrimitiveType'.
							OPXMIValueElement xmiName: 'href' value: 'uri#String'}))
		equals: 'String'
]

{ #category : #'tests - retrieving' }
OPUMLBootstrapGeneratorTest >> testTypeOfReference [
	self
		assert:
			(generator
				typeOf:
					(OPXMIReferenceAttribute new
						referencedElements:
							{OPXMIObjectElement new
								containedItems: {OPXMIValueElement xmiName: 'name' value: 'Element'}}))
		equals: 'Element'
]

{ #category : #'tests - generating' }
OPUMLBootstrapGeneratorTest >> testeCreateDelegationMethods [
	| parent child |
	parent := generator ensureCreateClass: 'GeneratedParentClass' in: 'Package'.
	child := generator ensureCreateClass: 'GeneratedChildClass' in: 'Package'.
	parent addMethod: (CBMethod new getter: 'property').
	parent addMethod: (CBMethod new setter: 'property' argument: 'Property').
	generator createDelegationMethods: #(#(GeneratedParentClass)) for: #GeneratedChildClass.
	self assert: child methods size equals: 2.
	self assert: child methods first protocol equals: 'accessing - GeneratedParentClass'.
	self assert: child methods second protocol equals: 'accessing - GeneratedParentClass'
]

{ #category : #'instance creation' }
OPUMLBootstrapGeneratorTest >> xmiAssociation [
	| s |
	s := '<xmi>
	<packagedElement xmi:type="uml:Class" xmi:id="Comment">
		<name>Comment</name>
	</packagedElement>
	<packagedElement xmi:type="uml:Class" xmi:id="Element">
		<name>Element</name>
	</packagedElement>
	<packagedElement xmi:type="uml:Association" xmi:id="Assoc" name="Assoc" memberEnd="Assoc_attrib Assoc_end">
		<ownedEnd xmi:type="uml:Property" xmi:id="Assoc_end" name="comment" type="Comment" association="Assoc">
		</ownedEnd>
	</packagedElement>
	<ownedAttribute xmi:type="uml:Property" xmi:id="Assoc_attrib" name="annotatedElement" type="Element" association="Assoc">
	</ownedAttribute>
</xmi>'.
	^ OPXMIReader readFrom: s readStream
]

{ #category : #'instance creation' }
OPUMLBootstrapGeneratorTest >> xmiClassAttribute [
	^ OPXMIObjectElement new
		xmiName: 'ownedAttribute';
		containedItems:
			{OPXMIValueElement xmiName: 'name' value: 'body'.
			OPXMIObjectElement new
				xmiName: 'ownedComment';
				containedItems: {OPXMIValueElement xmiName: 'body' value: 'Comment of a Comment body.'}.
			OPXMIObjectElement new
				xmiName: 'type';
				containedItems:
					{OPXMIValueElement xmiName: 'xmi:type' value: 'uml:PrimitiveType'.
					OPXMIValueElement
						xmiName: 'href'
						value: 'http://www.omg.org/spec/UML/20131001/PrimitiveTypes.xmi#String'}}
]

{ #category : #'instance creation' }
OPUMLBootstrapGeneratorTest >> xmiComplexElement [
	^ OPXMIObjectElement new
		xmiName: 'packagedElement';
		containedItems:
			{OPXMIValueElement xmiName: 'xmi:type' value: 'uml:Class'.
			OPXMIValueElement xmiName: 'name' value: 'Comment'.
			OPXMIObjectElement new
				xmiName: 'ownedComment';
				containedItems: {OPXMIValueElement xmiName: 'body' value: 'Comment of a Comment.'}.
			OPXMIObjectElement new
				xmiName: 'ownedAttribute';
				containedItems:
					{OPXMIValueElement xmiName: 'name' value: 'body'.
					OPXMIObjectElement new
						xmiName: 'ownedComment';
						containedItems: {OPXMIValueElement xmiName: 'body' value: 'Comment of a Comment body.'}.
					OPXMIObjectElement new
						xmiName: 'type';
						containedItems:
							{OPXMIValueElement xmiName: 'xmi:type' value: 'uml:PrimitiveType'.
							OPXMIValueElement
								xmiName: 'href'
								value: 'http://www.omg.org/spec/UML/20131001/PrimitiveTypes.xmi#String'}}}
]

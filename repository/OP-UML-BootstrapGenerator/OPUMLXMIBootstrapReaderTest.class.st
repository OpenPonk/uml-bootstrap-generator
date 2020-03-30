Class {
	#name : #OPUMLXMIBootstrapReaderTest,
	#superclass : #TestCase,
	#instVars : [
		'reader'
	],
	#category : 'OP-UML-BootstrapGenerator-Reader'
}

{ #category : #'instance creation' }
OPUMLXMIBootstrapReaderTest >> association [
	| assoc ownedAttr ownedEnd |
	ownedAttr := OPXMIObjectElement new.
	ownedEnd := OPXMIObjectElement new.
	assoc := OPXMIObjectElement new.
	assoc
		xmiName: 'packagedElement';
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Association'.
			OPXMIValueAttribute xmiName: 'xmi:id' value: 'A_annotatedElement_comment'.
			OPXMIValueAttribute xmiName: 'name' value: 'A_annotatedElement_comment'.
			OPXMIReferenceAttribute
				xmiName: 'memberEnd'
				referencedElements:
					{ownedAttr.
					ownedEnd}.
			ownedEnd}.
	ownedAttr
		xmiName: 'ownedAttribute';
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Property'.
			OPXMIValueAttribute xmiName: 'xmi:id' value: 'Comment-annotatedElement'.
			OPXMIValueAttribute xmiName: 'name' value: 'annotatedElement'.
			OPXMIReferenceAttribute xmiName: 'association' referencedElements: {assoc}}.
	ownedEnd
		xmiName: 'ownedEnd';
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Property'.
			OPXMIValueAttribute xmiName: 'xmi:id' value: 'A_annotatedElement_comment-comment'.
			OPXMIValueAttribute xmiName: 'name' value: 'comment'.
			OPXMIReferenceAttribute xmiName: 'association' referencedElements: {assoc}}.
	^ assoc
]

{ #category : #'instance creation' }
OPUMLXMIBootstrapReaderTest >> defaultValueElement [
	^ OPXMIObjectElement new
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:LiteralInteger'.
			OPXMIValueAttribute xmiName: 'xmi:id' value: 'lowerValue'}
]

{ #category : #'instance creation' }
OPUMLXMIBootstrapReaderTest >> elementWithGeneralization [
	"Comment -> Element"

	^ OPXMIObjectElement new
		xmiName: 'packagedElement';
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Class'.
			OPXMIValueAttribute xmiName: 'xmi:id' value: 'Comment'.
			OPXMIValueAttribute xmiName: 'name' value: 'Comment'.
			OPXMIObjectElement new
				xmiName: 'generalization';
				containedItems:
					{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Generalization'.
					OPXMIValueAttribute xmiName: 'xmi:id' value: 'Comment-_generalization.0'.
					OPXMIReferenceAttribute new
						xmiName: 'general';
						referencedElements:
							{OPXMIObjectElement new
								xmiName: 'packagedElement';
								containedItems:
									{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Class'.
									OPXMIValueAttribute xmiName: 'xmi:id' value: 'Element'.
									OPXMIValueAttribute xmiName: 'name' value: 'Element'}}}}
]

{ #category : #'instance creation' }
OPUMLXMIBootstrapReaderTest >> generalizationElement [
	"-> Element"

	^ OPXMIObjectElement new
		xmiName: 'generalization';
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Generalization'.
			OPXMIValueAttribute xmiName: 'xmi:id' value: 'Comment-_generalization.0'.
			OPXMIReferenceAttribute new
				xmiName: 'general';
				referencedElements:
					{OPXMIObjectElement new
						xmiName: 'packagedElement';
						containedItems:
							{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Class'.
							OPXMIValueAttribute xmiName: 'xmi:id' value: 'Element'.
							OPXMIValueAttribute xmiName: 'name' value: 'Element'}}}
]

{ #category : #'instance creation' }
OPUMLXMIBootstrapReaderTest >> multipleNestedAttributes [
	^ OPXMIObjectElement new
		xmiName: 'packagedElement';
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Class'.
			OPXMIValueAttribute xmiName: 'xmi:id' value: 'Comment'.
			OPXMIValueAttribute xmiName: 'name' value: 'Comment'.
			OPXMIObjectElement new
				xmiName: 'ownedAttribute';
				containedItems:
					{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Property'.
					OPXMIValueAttribute xmiName: 'xmi:id' value: 'Comment-annotatedElement'.
					OPXMIValueElement xmiName: 'name' value: 'annotatedElement'}.
			OPXMIObjectElement new
				xmiName: 'ownedAttribute';
				containedItems:
					{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Property'.
					OPXMIValueAttribute xmiName: 'xmi:id' value: 'Comment-body'.
					OPXMIValueElement xmiName: 'name' value: 'body'}}
]

{ #category : #'instance creation' }
OPUMLXMIBootstrapReaderTest >> nestedComplexElement [
	^ OPXMIObjectElement new
		xmiName: 'Attribute';
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Property'.
			OPXMIValueAttribute xmiName: 'xmi:id' value: 'PROPID'.
			OPXMIObjectElement new
				xmiName: 'upperValue';
				containedItems:
					{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:LiteralUnlimitedNatural'.
					OPXMIValueAttribute xmiName: 'xmi:id' value: 'PROPID_upperValue'.
					OPXMIValueElement xmiName: 'value' value: '*'}}
]

{ #category : #'instance creation' }
OPUMLXMIBootstrapReaderTest >> packageImportPackage [
	| activities classification |
	classification := OPXMIObjectElement new
		xmiName: 'packagedElement';
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Package'.
			OPXMIValueAttribute xmiName: 'xmi:id' value: 'Classification'.
			OPXMIValueAttribute xmiName: 'name' value: 'Classification'}.
	activities := OPXMIObjectElement new
		xmiName: 'packagedElement';
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Package'.
			OPXMIValueAttribute xmiName: 'xmi:id' value: 'Activities'.
			OPXMIValueAttribute xmiName: 'name' value: 'Activities'.
			OPXMIObjectElement new
				xmiName: 'packageImport';
				containedItems:
					{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:PackageImport'.
					OPXMIValueAttribute xmiName: 'xmi:id' value: '_packageImport.1'.
					OPXMIReferenceAttribute xmiName: 'importedPackage' referencedElements: {classification}}}.
	^ OPXMIObjectElement new
		xmiName: 'uml:Package';
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Package'.
			OPXMIValueAttribute xmiName: 'xmi:id' value: '_0'.
			OPXMIValueAttribute xmiName: 'name' value: 'UML'.
			OPXMIObjectElement new
				xmiName: 'packageImport';
				containedItems:
					{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:PackageImport'.
					OPXMIValueAttribute xmiName: 'xmi:id' value: '_packageImport.1'.
					OPXMIReferenceAttribute xmiName: 'importedPackage' referencedElements: {activities}}.
			OPXMIObjectElement new
				xmiName: 'packageImport';
				containedItems:
					{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:PackageImport'.
					OPXMIValueAttribute xmiName: 'xmi:id' value: '_packageImport.2'.
					OPXMIReferenceAttribute xmiName: 'importedPackage' referencedElements: {classification}}}
]

{ #category : #running }
OPUMLXMIBootstrapReaderTest >> setUp [
	reader := OPUMLXMIBootstrapReader new.
	reader classPrefix: 'BootUML'
]

{ #category : #tests }
OPUMLXMIBootstrapReaderTest >> testAmbiguousPackageImport [
	"xmi:id of <packageImport> elements are not valid and should be ignored (they are not unique). Test that we can load correctly despite that"

	| masterPkg activitiesPkg classificationPkg |
	masterPkg := reader readItem: self packageImportPackage.
	self assert: masterPkg name equals: 'UML'.
	self assert: masterPkg packageImport size equals: 2.
	activitiesPkg := masterPkg packageImport first importedPackage.
	classificationPkg := masterPkg packageImport second importedPackage.
	self assert: classificationPkg name equals: 'Classification'.
	self assert: classificationPkg packageImport equals: nil.
	self assert: activitiesPkg name equals: 'Activities'.
	self assert: activitiesPkg packageImport first importedPackage equals: classificationPkg
]

{ #category : #tests }
OPUMLXMIBootstrapReaderTest >> testAssociation [
	| result |
	result := reader readItem: self association.
	self assert: result className equals: #BootUMLAssociation.
	self assert: result memberEnd size equals: 2.
	self assert: result memberEnd second equals: result ownedEnd first
]

{ #category : #tests }
OPUMLXMIBootstrapReaderTest >> testBooleanValue [
	| result |
	result := reader valueFor: 'true'.
	self assert: result equals: true
]

{ #category : #tests }
OPUMLXMIBootstrapReaderTest >> testCreateNewInstance [
	self assert: (reader createNewInstanceFor: 'uml:Class') className equals: #BootUMLClass
]

{ #category : #tests }
OPUMLXMIBootstrapReaderTest >> testFloatValue [
	| result |
	result := reader valueFor: '12.5'.
	self assert: result equals: 12.5
]

{ #category : #tests }
OPUMLXMIBootstrapReaderTest >> testGeneralizationElement [
	| result |
	result := reader readItem: self generalizationElement.
	self assert: result className equals: 'BootUMLGeneralization'.
	self assert: result general name equals: 'Element'
]

{ #category : #tests }
OPUMLXMIBootstrapReaderTest >> testGroupedChildren [
	| result |
	result := reader groupedChildrenIn: self multipleNestedAttributes.
	self assert: result keys sorted equals: #(name ownedAttribute).
	self assert: (result at: #name) size equals: 1.
	self assert: (result at: #ownedAttribute) size equals: 2
]

{ #category : #tests }
OPUMLXMIBootstrapReaderTest >> testInstance [
	| element result1 result2 |
	element := OPXMIObjectElement new
		containedItems:
			{OPXMIValueElement xmiName: 'xmi:id' value: 'CLS'.
			OPXMIValueElement xmiName: 'xmi:type' value: 'uml:Package'}.
	result1 := reader instanceFor: element.
	self assert: result1 className equals: #BootUMLPackage.
	result2 := reader instanceFor: element.
	self assert: result1 == result2 description: 'We expect the same object.'
]

{ #category : #tests }
OPUMLXMIBootstrapReaderTest >> testIntegerValue [
	| result |
	result := reader valueFor: '123'.
	self assert: result equals: 123
]

{ #category : #tests }
OPUMLXMIBootstrapReaderTest >> testIsCollectionAttribute [
	self deny: (reader isCollectionAttribute: #name inClass: BootUMLProperty).
	self deny: (reader isCollectionAttribute: #body inClass: BootUMLComment).
	self deny: (reader isCollectionAttribute: #general inClass: BootUMLGeneralization).
	self deny: (reader isCollectionAttribute: #type inClass: BootUMLProperty).
	self deny: (reader isCollectionAttribute: #importedPackage inClass: BootUMLPackageImport).
	self deny: (reader isCollectionAttribute: #defaultValue inClass: BootUMLProperty).
	self deny: (reader isCollectionAttribute: #instance inClass: BootUMLInstanceValue).
	self deny: (reader isCollectionAttribute: #bodyCondition inClass: BootUMLOperation).
	self deny: (reader isCollectionAttribute: #specification inClass: BootUMLConstraint)
]

{ #category : #tests }
OPUMLXMIBootstrapReaderTest >> testMultipleNestedAttributes [
	| result |
	result := reader readItem: self multipleNestedAttributes.
	self assert: result className equals: #BootUMLClass.
	self assert: result ownedAttribute size equals: 2.
	self assert: result ownedAttribute first name equals: 'annotatedElement'.
	self assert: result ownedAttribute second name equals: 'body'
]

{ #category : #tests }
OPUMLXMIBootstrapReaderTest >> testNestedComplexElement [
	| result |
	result := reader readItem: self nestedComplexElement.
	self assert: result className equals: #BootUMLProperty.
	self assert: result upperValue value equals: '*'.
	"	self assert: result lowerValue value equals: 0."
	self assert: result lowerValue value equals: nil
]

{ #category : #tests }
OPUMLXMIBootstrapReaderTest >> testReadBoolean [
	| result |
	result := reader readItem: (OPXMIValueAttribute xmiName: 'isDerived' value: 'true').
	self assert: result equals: true
]

{ #category : #tests }
OPUMLXMIBootstrapReaderTest >> testReadSimpleObject [
	| element result |
	element := OPXMIObjectElement new
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmi:id' value: 'Comment'.
			OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Comment'.
			OPXMIValueElement xmiName: 'body' value: 'CONTENT'}.
	result := reader readItem: element.
	self assert: result className equals: #BootUMLComment.
	self assert: result body equals: 'CONTENT'
]

{ #category : #tests }
OPUMLXMIBootstrapReaderTest >> testReadTrivialXmi [
	| result |
	result := reader readXmi: self trivialXmi.
	self assert: result size equals: 1.
	self assert: result first className equals: #BootUMLPackage
]

{ #category : #tests }
OPUMLXMIBootstrapReaderTest >> testReadTrivialishXmi [
	| result |
	result := reader readXmi: self trivialishXmi.
	self assert: result size equals: 1.
	self assert: result first className equals: #BootUMLPackage.
	self assert: result first packagedElement size equals: 1.
	self assert: result first packagedElement first name equals: 'Activities'
]

{ #category : #tests }
OPUMLXMIBootstrapReaderTest >> testReferenceElement [
	| result gen |
	result := reader readItem: self elementWithGeneralization.
	self assert: result name equals: 'Comment'.
	gen := result generalization first.
	self assert: gen className equals: 'BootUMLGeneralization'.
	self assert: gen general name equals: 'Element'
]

{ #category : #tests }
OPUMLXMIBootstrapReaderTest >> testUniqueId [
	| regular packageImport |
	regular := OPXMIObjectElement new
		containedItems: {OPXMIValueAttribute xmiName: 'xmi:id' value: 'AAA'}.
	packageImport := OPXMIObjectElement new
		xmiName: 'packageImport';
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:PackageImport'.
			OPXMIValueAttribute xmiName: 'xmi:id' value: '_packageImport.1'.
			OPXMIReferenceAttribute xmiName: 'importedPackage' referencedElements: {regular}}.
	self assert: (reader uniqueIdOf: regular) equals: 'AAA'.
	self assert: (reader uniqueIdOf: packageImport) equals: '_packageImport.1-AAA'
]

{ #category : #'instance creation' }
OPUMLXMIBootstrapReaderTest >> trivialXmi [
	^ OPXMIObjectElement new
		xmiName: 'XMI';
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmlns:xmi' value: 'http://www.omg.org/spec/XMI/20131001'.
			OPXMIValueAttribute xmiName: 'xmlns:uml' value: 'http://www.omg.org/spec/UML/20131001'.
			OPXMIValueAttribute
				xmiName: 'xmlns:moftext'
				value: 'http://www.omg.org/spec/MOF/20131001'.
			OPXMIObjectElement new
				xmiName: 'Package';
				containedItems:
					{OPXMIValueAttribute xmiName: 'xmi:id' value: '_0'.
					OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Package'}.
			OPXMIObjectElement new
				xmiName: 'Tag';
				containedItems:
					{OPXMIValueAttribute xmiName: 'xmi:id' value: '_1'.
					OPXMIValueAttribute xmiName: 'xmi:type' value: 'mofext:Tag'}}
]

{ #category : #'instance creation' }
OPUMLXMIBootstrapReaderTest >> trivialishXmi [
	^ OPXMIObjectElement new
		xmiName: 'XMI';
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmlns:xmi' value: 'http://www.omg.org/spec/XMI/20131001'.
			OPXMIValueAttribute xmiName: 'xmlns:uml' value: 'http://www.omg.org/spec/UML/20131001'.
			OPXMIValueAttribute
				xmiName: 'xmlns:moftext'
				value: 'http://www.omg.org/spec/MOF/20131001'.
			OPXMIObjectElement new
				xmiName: 'Package';
				containedItems:
					{OPXMIValueAttribute xmiName: 'xmi:id' value: '_0'.
					OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Package'.
					OPXMIObjectElement new
						xmiName: 'packagedElement';
						containedItems:
							{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Package'.
							OPXMIValueAttribute xmiName: 'xmi:id' value: 'Activities'.
							OPXMIValueAttribute xmiName: 'name' value: 'Activities'}}.
			OPXMIObjectElement new
				xmiName: 'Tag';
				containedItems:
					{OPXMIValueAttribute xmiName: 'xmi:id' value: '_1'.
					OPXMIValueAttribute xmiName: 'xmi:type' value: 'mofext:Tag'}}
]
